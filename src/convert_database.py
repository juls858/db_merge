# coding: utf-8


import networkx as nx
import pandas as pd
import pyhocon
import argparse
from sqlalchemy import create_engine, text
from keyvault import KeyVault
from data_factory import AzureDataFactoryCopy
from urllib.parse import quote_plus
from fix_data_fixtures import fix_data_fixtures, update_id_to_id_old

CONFIG = pyhocon.ConfigFactory.parse_file('app.config')


def create_mssql_engine(url, db, user, pwd):
    # pymssql_url = 'mssql+pymssql://{u}:{p}@{h}/{d}?charset=utf8'
    pyodbc_url = "mssql+pyodbc://{u}:{p}@{h}/{d}?driver=ODBC+Driver+17+for+SQL+Server"

    return create_engine(pyodbc_url.format(u=user, h=url, p=pwd,
                                           d=db), pool_pre_ping=True)


def create_mysql_engine(url, db, user, pwd):
    # if is_secret:
    #
    #     azure_cfg = pyhocon.ConfigFactory.parse_file('app.config')
    #
    #     kv = KeyVault(azure_cfg)

    # maria_db_pass = kv.fetch_secret('ares-mariadb-password', pwd).value

    # setup mariadb connection
    #     maria_db_user = 'dw_reader@mi-ares-prod'
    # maria_db_host = 'mi-ares-prod.mariadb.database.azure.com'
    maria_db_host = 'mi-ares-prod.mariadb.database.azure.com'

    maria_db_host = url
    maria_db_user = quote_plus(user)
    maria_db_pass = quote_plus(pwd)

    # sqlalchemy engine
    sa_cnx_str = 'mysql+pymysql://{user}:{pw}@{host}/{db}'.format(user=maria_db_user,
                                                                  pw=maria_db_pass,
                                                                  host=maria_db_host,
                                                                  db=db)
    print(sa_cnx_str)
    return create_engine(sa_cnx_str, pool_pre_ping=True)


def get_key_column_usage(cnx, schema):
    assert isinstance(schema, object)
    q = """
    SELECT C.CONSTRAINT_NAME [CONSTRAINT_NAME]
     , C.TABLE_NAME      [TABLE_NAME]
     , KCU.COLUMN_NAME   [COLUMN_NAME]
     , KCU.TABLE_SCHEMA  [TABLE_SCHEMA]
     , C2.TABLE_SCHEMA   [REFERENCED_TABLE_SCHEMA]
     , C2.TABLE_NAME     [REFERENCED_TABLE_NAME]
     , KCU2.COLUMN_NAME  [REFERENCED_COLUMN_NAME]
     , C.CONSTRAINT_TYPE
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS C
           left JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
                      ON C.CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA
                        AND C.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
           LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
                     ON C.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
                       AND C.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
           LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS C2
                     ON RC.UNIQUE_CONSTRAINT_SCHEMA = C2.CONSTRAINT_SCHEMA
                       AND RC.UNIQUE_CONSTRAINT_NAME = C2.CONSTRAINT_NAME
           LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU2
                     ON C2.CONSTRAINT_SCHEMA = KCU2.CONSTRAINT_SCHEMA
                       AND C2.CONSTRAINT_NAME = KCU2.CONSTRAINT_NAME
                       AND KCU.ORDINAL_POSITION = KCU2.ORDINAL_POSITION
    WHERE
      1 = 1
      and KCU.TABLE_SCHEMA = '{}'
    """.format(schema)

    return pd.read_sql(q, con=cnx)


def get_all_tables_in_schema(cnx, schema):
    q = """
    select *
    from information_schema.tables
    WHERE
    TABLE_SCHEMA = '{}'
      and table_type = 'BASE TABLE'
    """.format(schema)

    return pd.read_sql(q, con=cnx)


def get_fks(df):
    q = "REFERENCED_TABLE_NAME == REFERENCED_TABLE_NAME & CONSTRAINT_NAME != 'PRIMARY'"
    return df.query(q)


def get_tables_with_pk(df):
    q = "CONSTRAINT_TYPE == 'PRIMARY KEY'"
    return df.query(q)[['TABLE_NAME', 'COLUMN_NAME']]


def find_heaps(df_all_ables, df_tables_with_pk):
    q = "TABLE_NAME not in @df_tables_with_pk.TABLE_NAME.tolist()"
    return df_all_ables.query(q)


def create_stage_schema(cnx, schema):
    # check for existing schema
    if schema not in pd.read_sql("select schema_name from information_schema.schemata",
                                 con=cnx).schema_name.values:
        # create schema using source database name
        cnx.execute(text("create schema [{}]".format(schema)).execution_options(autocommit=True))


def stage_source_data(source, target, source_db, graph):
    # iterate through all tables
    # stg_done = list()
    for table in graph.nodes:
        # if table in stg_done:
        #     continue
        print('staging: ', table)
        if source.driver == 'pymysql':
            query = "SELECT * FROM `{}` LIMIT 0"
            # df_source_table = pd.read_sql_table(table, con=source)
            df_source_table = pd.read_sql(query.format(table), con=source)
        else:
            query = "SELECT TOP 0 * FROM [{0}].[{1}]"
            #df_source_table = pd.read_sql_table(table, con=source, schema='dbo')
            df_source_table = pd.read_sql(query.format('stage', table), con=source)

        # add data lineage columns
        df_source_table['source_db'] = source_db
        df_source_table['migration_date'] = pd.Timestamp.now()
        df_source_table.to_sql(table, con=target, schema=source_db, if_exists='replace', index=False)
        # stg_done.append(table)


def create_staging_tables(source_schema, target_schema, cnx, graph):
    print("creating staging tables...")
    drop_table_fmt = ("IF OBJECT_ID ('{target}') IS NOT NULL\n"
                      "DROP TABLE {target};")
    create_table_fmt = ("SELECT TOP 0 *\n"
                        # "'foo' as source_db,\n"
                        # "'1999-01-01 00:00:00' as migration_date \n"
                        "INTO {target}\n"
                        "FROM {source};")

    schema_table_fmt = "[{0}].[{1}]"

    for table in graph:
        print(table)
        source_table_name = schema_table_fmt.format(source_schema, table)
        target_table_name = schema_table_fmt.format(target_schema, table)

        drop_table_statement = drop_table_fmt.format(target=target_table_name)
        create_table_statement = create_table_fmt.format(target=target_table_name,
                                                         source=source_table_name)

        cnx.execute(text(drop_table_statement).execution_options(autocommit=True))
        cnx.execute(text(create_table_statement).execution_options(autocommit=True))

        print(create_table_statement)


def generate_simple_select(graph, node, source_schema, target_schema):
    pk = graph.node[node]['PK']
    if node in data_fixtures:
        formatted_pk = "\t[{0}]".format(pk)
    else:
        formatted_pk = "\t[{0}] as [{0}_old]".format(pk)

    all_columns = graph.node[node]['COLUMNS'].copy()

    columns_pk_removed = [x for x in set(all_columns) - set([pk, 'id_guid', 'id_old'])]
    # select_columns = ',\n'.join([formatted_pk] + formatted_columns)
    #
    #     # insert_columns = ', '.join([f'[{x}]' for x in [
    #     f'{pk}_old' if pk == 'id' and node not in data_fixtures else f'{pk}'] + columns_pk_removed])

    select_columns, insert_columns = generate_insert_columns(columns_pk_removed,
                                                             # formatted_columns,
                                                             formatted_pk,
                                                             node,
                                                             pk, )

    is_data_fixture = node in data_fixtures
    sql = generate_sql_insert_merge(insert_columns, is_data_fixture, None, node, select_columns, None,
                                    source_schema,
                                    target_schema)

    return sql


def generate_insert_columns(columns_pk_removed, formatted_pk, node, pk, alias='', fk_columns: tuple = None):
    formatted_columns = [f"[{x}]" for x in columns_pk_removed]
    aliased_formatted_columns = [f"[{alias}].[{x}]" for x in columns_pk_removed]

    if fk_columns:
        aliased_fk = fk_columns[0]
        unaliased_fk = [f"[{x}]" for x in fk_columns[1]]
        columns = aliased_formatted_columns
    else:
        aliased_fk = []
        unaliased_fk = []
        columns = formatted_columns

    # if node in data_fixtures and pk == 'id':
    #     insert = ', '.join(formatted_columns + unaliased_fk)
    #     select = ',\n'.join(columns + aliased_fk)
    # el
    if pk == 'id':
        insert = ', '.join([f'{pk}_old'] + formatted_columns + unaliased_fk)
        select = ',\n'.join([formatted_pk] + columns + aliased_fk)
    else:
        insert = ', '.join([f'{pk}'] + formatted_columns + unaliased_fk)
        select = ',\n'.join([formatted_pk] + columns + aliased_fk)

    return select, insert


def generate_join_clause(G, edge, source_alias, referenced_schema, referenced_alias, source_db, remap_suffix='_old'):
    data = G.edges[edge]
    source_column = data['COLUMN_NAME']
    referenced_table = data['REFERENCED_TABLE_NAME']
    referenced_column = data['REFERENCED_COLUMN_NAME']
    if referenced_table in data_fixtures:
        natural_keys = data_fixtures_keys[data_fixtures.index(referenced_table)][1]

    if referenced_table in data_fixtures and referenced_schema != source_db and natural_keys[0] != 'id':
        natural_keys = data_fixtures_keys[data_fixtures.index(referenced_table)][1]
        join_conditions = '\n\tAND '.join([
            f"[{referenced_alias}].[{natural_key}] = [{source_alias}].[{natural_key}]" for natural_key in
            natural_keys])
    else:
        join_conditions = f"[{referenced_alias}].[{referenced_column}{remap_suffix}] = [{source_alias}].[{source_column}]\n"

    # join on original surrogate key (referenced key) on stage = id_old in new_schema
    join = (f"LEFT JOIN [{referenced_schema}].[{referenced_table}] as [{referenced_alias}]\n"
            f"\tON {join_conditions}")

    # id is new surrogate key generated on insert
    column = f'[{referenced_alias}].[{referenced_column}] as [{source_column}]'
    # generate join condition
    clause = f"[{referenced_alias}].[source_db] = '{source_db}'"
    return column, join.strip(), clause


def process_node_with_fk(graph, node, source_schema, target_schema):
    is_data_fixture = node in data_fixtures
    original_columns = [f'{x}' for x in graph.node[node]['COLUMNS'].copy()]

    # get FKs
    edges = list(graph.out_edges(node))
    joins = list()
    clauses = list()
    unaliased_fk_columns = list()
    aliased_fk_columns = list()
    columns_skipped = list()
    source_alias = 's'

    done = dict()
    i = 0
    for edge in edges:

        # handle multiple edges between same nodes
        if edge not in done.keys():
            done[edge] = 0
        else:
            done[edge] += 1

        edge_data = graph.edges[(*edge, done[edge])]

        referenced_column_name = edge_data['REFERENCED_COLUMN_NAME']
        referenced_table_name = edge_data['REFERENCED_TABLE_NAME']
        referenced_alias = 'f' + str(i)
        if referenced_table_name in data_fixtures:
            natural_keys = data_fixtures_keys[data_fixtures.index(referenced_table_name)][1]

        if referenced_table_name in data_fixtures and natural_keys[0] != 'id':
            # FK references data fixture
            remap_suffix = ''
            _, join, _ = generate_join_clause(G=graph, edge=(*edge, done[edge]),
                                              source_alias=source_alias,
                                              referenced_schema=source_schema,
                                              referenced_alias=referenced_alias + '_a',
                                              remap_suffix=remap_suffix,
                                              source_db=source_schema)
            joins.append(join)

            if referenced_table_name == 'api_playerprofile':
                _, join, _ = generate_join_clause(G=graph, edge=('api_playerprofile', 'auth_user', 0),
                                                  source_alias=referenced_alias + '_a',
                                                  referenced_schema=source_schema,
                                                  referenced_alias=referenced_alias + '_b',
                                                  remap_suffix=remap_suffix,
                                                  source_db=source_schema)
                joins.append(join)

                _, join, _ = generate_join_clause(G=graph, edge=('api_playerprofile', 'auth_user', 0),
                                                  source_alias=referenced_alias + '_b',
                                                  referenced_schema=target_schema,
                                                  referenced_alias=referenced_alias + '_c',
                                                  remap_suffix=remap_suffix,
                                                  source_db=source_schema)
                joins.append(join)

                join = (f'LEFT JOIN [dbo].[api_playerprofile] as [{referenced_alias}_d]'
                        f'   ON [{referenced_alias}_d].[player_id] = [{referenced_alias}_c].id')
                fk = (f'[{referenced_alias}_d].[id] as [player_id]')
            else:
                fk, join, _ = generate_join_clause(G=graph, edge=(*edge, done[edge]),
                                                   source_alias=referenced_alias + '_a',
                                                   referenced_schema=target_schema,
                                                   referenced_alias=referenced_alias + '_b',
                                                   remap_suffix=remap_suffix,
                                                   source_db=source_schema)
        else:
            # FK references regular table
            if referenced_column_name != 'id':
                remap_suffix = ''
            else:
                remap_suffix = '_old'
            fk, join, clause = generate_join_clause(G=graph, edge=(*edge, done[edge]),
                                                    source_alias=source_alias,
                                                    referenced_schema=target_schema,
                                                    referenced_alias=referenced_alias,
                                                    remap_suffix=remap_suffix,
                                                    source_db=source_schema)
            if referenced_column_name == 'id' and referenced_table_name not in data_fixtures:
                # clauses.append(clause)
                join = "\n\tAND ".join([join, clause])

        joins.append(join)
        aliased_fk_columns.append(fk)
        unaliased_fk_columns.append(edge_data['COLUMN_NAME'])

        i += 1

    pk = graph.node[node]['PK']

    if is_data_fixture is True:
        formatted_pk = f"\t[{source_alias}].[{pk}]"
        non_insert_columns = [pk, 'id_guid', 'id_old', 'source_db', 'migration_date']
    else:
        formatted_pk = f"\t[{source_alias}].[{pk}] as [{pk}_old]"
        non_insert_columns = [pk, 'id_guid', 'id_old']

    pruned_columns = [x for x in original_columns if x not in unaliased_fk_columns + non_insert_columns]
    select_columns, insert_columns = generate_insert_columns(pruned_columns, formatted_pk, node, pk, source_alias,
                                                             (aliased_fk_columns, unaliased_fk_columns))

    output = generate_sql_insert_merge(insert_columns, is_data_fixture, joins, node, select_columns, source_alias,
                                       source_schema, target_schema)

    return output


def generate_sql_insert_merge(insert_columns, is_data_fixture, joins, node, select_columns, source_alias, source_schema,
                              target_schema):
    if joins:
        join_str = '\n'.join(joins)
        join_str_where \
            = join_str.replace(f"[{source_alias}]", "[x]")
    else:
        join_str = ''
        join_str_where = ''

    if source_alias:
        source_alias = f'[{source_alias}]'
    else:
        source_alias = ''
    insert = (
        f"\nWITH i as (\n"
        f"    SELECT\n"
        f"    {select_columns}\n"
        f"    FROM [{source_schema}].[{node}] {source_alias}\n"
        f"    {join_str}\n"
        f")\n"
        f"INSERT INTO [{target_schema}].[{node}] ({insert_columns})\n"
        f"    SELECT *\n"
        f"    FROM i\n"
    )
    if is_data_fixture:
        natural_keys = data_fixtures_keys[data_fixtures.index(node)][1]
        not_exists_where = '\nAND '.join(
            [f'[i].[{k}] = [x].[{k}]' if k != 'id' else 'i.id = x.id_old' for k in natural_keys])
        where = (
            f"    WHERE NOT EXISTS ( \n"
            f"    SELECT 1\n"
            f"    FROM [{target_schema}].[{node}] as  [x]\n"
            f"    {join_str_where}\n"
            f"    WHERE \n"
            f"    {not_exists_where}\n"
            f"    )\n\n")
        output = insert + where
    else:
        output = insert

    return output


def merge_table(cnx, table, source_schema, target_schema, primary_key):
    df_target = pd.read_sql_table(table, con=cnx, schema=target_schema).set_index(primary_key)
    df_source = pd.read_sql_table(table, con=cnx, schema=source_schema).set_index(primary_key)[df_target.columns]
    df_new_rows = df_source[~df_source.index.isin(df_target.index)].reset_index()
    df_new_rows[df_target.reset_index().columns].to_sql(table, con=cnx, schema=target_schema, index=False,
                                                        chunksize=500,
                                                        if_exists='append')


def generate_directed_graph(cnx, df_all_keys, target_schema='dbo'):
    df_tables = get_all_tables_in_schema(cnx, target_schema)

    df_fk = get_fks(df_all_keys)

    df_pk_tables = get_tables_with_pk(df_all_keys)

    df_heaps = find_heaps(df_tables, df_pk_tables)

    graph = nx.MultiDiGraph()

    generate_graph_nodes(cnx, target_schema, graph, df_heaps, df_pk_tables)

    generate_graph_edges(graph, df_fk)

    return graph


def generate_graph_edges(graph, df_fk):
    df_edges = df_fk[
        ['TABLE_NAME', 'COLUMN_NAME', 'CONSTRAINT_NAME', 'REFERENCED_TABLE_NAME', 'REFERENCED_COLUMN_NAME']]
    df_edges.head()
    edge_attributes = ['TABLE_NAME', 'COLUMN_NAME', 'CONSTRAINT_NAME', 'REFERENCED_TABLE_NAME',
                       'REFERENCED_COLUMN_NAME']
    graph.add_edges_from(list(zip(df_fk.TABLE_NAME,
                                  df_fk.REFERENCED_TABLE_NAME,
                                  df_edges[edge_attributes].to_dict(orient='rows'))))


def generate_graph_nodes(cnx, target_schema, graph, df_heaps, df_pk_tables):
    graph.add_nodes_from(df_heaps.TABLE_NAME)

    df_nodes_pk = df_pk_tables.set_index('TABLE_NAME').rename(columns={'COLUMN_NAME': 'PK'})
    graph.add_nodes_from(df_nodes_pk.index)
    nx.set_node_attributes(graph, df_nodes_pk.to_dict(orient='index'))
    query_columns = """
        select COLUMN_NAME
        from information_schema.columns
        where table_schema = '{db}'
        and table_name = '{table_name}'
        """
    for node in graph.nodes():
        df_columns = pd.read_sql(query_columns.format(db=target_schema, table_name=node), con=cnx)
        df_columns.COLUMN_NAME.tolist()

        graph.node[node]['COLUMNS'] = df_columns.COLUMN_NAME.tolist()


def perform_simple_merge(cnx, relation_graph, order, source_schema, target_schema, skip):
    done = skip
    for table in order:

        primary_key = relation_graph.nodes[table]['PK']
        if relation_graph.out_degree(table) == 0 \
                and primary_key != 'id' \
                and table not in done:
            print(table)
            merge_table(cnx, table, source_schema, target_schema, primary_key)
            done.append(table)

    return done


def perform_merge_and_key_remap(cnx, graph, order, source_schema, target_schema):
    global merged_simple
    done = merged_simple
    skipped = list()
    for table in order:
        if table in done:
            print('Skipping %s' % table)
            skipped.append(table)
            continue

        if graph.out_degree(table) == 0:
            insert_query = generate_simple_select(graph, table, source_schema, target_schema)
        else:
            insert_query = process_node_with_fk(graph, table, source_schema, target_schema)
        print(table)
        print(insert_query)

        cnx.execute(text(insert_query).execution_options(autocommit=True))
        done.append(table)


def get_merge_order(graph):
    return list(reversed(list(nx.dag.topological_sort(graph))))


def create_source_cnx(engine, key, db):
    kv = KeyVault(CONFIG)
    cfg = CONFIG[key]
    source_pass = kv.fetch_secret(cfg['secret_name'], cfg['secret_version']).value
    if engine == 'mssql':
        return create_mssql_engine(url=cfg['url'],
                                   user=cfg['user'],
                                   pwd=source_pass,
                                   db=db)
    elif engine == 'mysql':
        return create_mysql_engine(url=cfg['url'],
                                   user=cfg['user'],
                                   pwd=source_pass,
                                   db=db)


if __name__ == '__main__':
    # main()
    parser = argparse.ArgumentParser(description="Converts mariadb ares database to Azure sql")
    parser.add_argument('--sourcedb', type=str)
    parser.add_argument('--target', type=str)

    args = parser.parse_args()
    # data fixtures
    data_fixtures_keys = [('api_badge', ('id',)), #id and label
                          ('api_badgerequirement', ('id',)), # id
                          ('api_catalogquizquestion', ('question_id', 'catalog_id',)),
                          ('api_coreskill', ('label',)),
                          ('api_learningpath', ('uid',)),
                          ('api_learningpathoption', ('uid',)),
                          ('api_learningpathoption_locked_by', ('learningpathstep_id', 'learningpathoption_id',)),
                          ('api_learningpathstep', ('uid',)),
                          ('api_mapmarker', ('uid',)),
                          ('api_mediacentercategory', ('id',)), # id
                          ('api_mediacenterresource', ('uid',)),
                          ('api_mediacenterresource_core_skills', ('coreskill_id', 'mediacenterresource_id',)),
                          # ('api_mediacentertab', ('uid',)),
                          ('api_mediacentertab', ('label',)),
                          ('api_minigame', ('id',)), # id
                          ('api_minigamedefaultsetting', ('id',)), # id
                          ('api_minigamefield', ('id',)),
                          # ('api_minigamefield', ('name', 'minigamesection_id',)),
                          # ('api_minigamesection', ('id',)),
                          ('api_minigamesection', ('id',)), #id
                          ('api_mission', ('uid',)),
                          ('api_missioncatalogentry', ('uid',)),
                          ('api_missionfile', ('uid',)),
                          ('api_questionanswerpair', ('uid',)),
                          ('api_questionfollowup', ('uid',)),
                          ('api_quizanswer', ('uid',)),
                          ('api_quizquestion', ('uid',)),
                          ('api_quizquestion_minigame_sections', ('minigamesection_id', 'quizquestion_id',)),
                          ('api_quizquestion_skills', ('coreskill_id', 'quizquestion_id',)),
                          ('api_rank', ('label',)),
                          ('api_sitesettings', ('id',)),
                          ('api_skilltype', ('id',)), #id
                          ('api_staticasset', ('uid',)),
                          ('api_workrole', ('uid',)),
                          ('auth_permission', ('codename',)),
                          ('django_content_type', ('app_label', 'model',)),
                          # ('defender_accessattempt', ['id']),
                          # ('django_migrations', ['']),
                          # ('django_session', [''])2
                          # ('auth_group', ('name',)), # id
                          ('auth_group', ('id',)),
                          ('auth_user', ('username',)),
                          ('api_organization', ('public_org_id',)),
                          ('auth_group_permissions', ('group_id', 'permission_id',)),
                          ('auth_user_groups', ('user_id', 'group_id',)),
                          ('api_playerprofile', ('player_id',)),
                          ('admin_tools_dashboard_preferences', ('user_id', 'dashboard_id',))
                          ]
    data_fixtures = [x[0] for x in data_fixtures_keys]
    tables_to_update_ids = [x[0] for idx, x in enumerate(data_fixtures_keys) if len(x[1])==1 and x[1][0] == 'id']

    # schema to merge into on MSSQL
    target_schema = 'dbo'

    # source_db = 'usw01-3-ares_test'
    # source_db = 'usw01-3-gameserver'
    # source_db = 'usw01-3-gameserver_z3'
    # source_db = 'usw01-2-gameserver_8'
    # source_db = 'usw01-3-ares_lcps'
    # source_db = 'usw01-3-eval_apprentice'
    # source_db = 'usw01-3-ares_dhf'
    # source_db = 'usw01-3-ares_ibm'
    # source_db = 'usw01-3-ares_apprentice1'
    # source_db = 'usw01-3-ares_pro1'
    # source_db = 'usw01-2-gameserver_marsparta'
    # source_db = 'usw01-3-ares_insyte'
    # source_db = 'usw01-2-gameserver_forscom'
    # source_db = 'usw01-3-ares_visa' # missing suspend_type in api_missionsession

    # source_db = 'usw01-2-ares_aci' do not use!!
    source_db = args.sourcedb
    # print(args)
    # merge_source = 'data-merge-source.mariadb.database.azure.com'
    # merge_source = args.source
    # merge_source_user = 'data_admin@data-merge-source'
    # merge_source_user = args.user
    # merge_target_db = 'ares_schema_test'
    merge_target_db = args.target
    stage_schema = source_db
    # kv_secret = 'data-admin'
    # kv_secret = args.kvsecret

    cnx_target = create_source_cnx('mssql', 'target', merge_target_db)

    cnx_source = create_source_cnx('mysql', 'source', source_db)

    df_all_keys = get_key_column_usage(cnx_target, 'dbo')

    relation_graph = generate_directed_graph(cnx_target, df_all_keys, target_schema)

    merge_order = get_merge_order(relation_graph)

    create_stage_schema(cnx_target, source_db)

    stage_source_data(cnx_target, cnx_target, source_db, relation_graph)

    kv = KeyVault(CONFIG)
    cfg_source = CONFIG["source"]
    cfg_target = CONFIG["target"]
    #print(relation_graph)

    print('starting azure pipeline')
    AzureDataFactoryCopy().run(source_db, cfg_source['user'], cfg_source['url'], merge_target_db, sink_schema=source_db,
                                secret_db=cfg_source['secret_name'], sink_server=cfg_target['url'],
                                sink_secret=cfg_target['secret_name'], sink_user=cfg_target['user'])

    try:
        skip = ['knox_authtoken', ]


        merged_simple = perform_simple_merge(cnx_target, relation_graph, merge_order, source_db, target_schema, skip)

        perform_merge_and_key_remap(cnx_target, relation_graph, merge_order, source_db, target_schema)

        fix_data_fixtures(cnx_target, source_db)
        update_id_to_id_old(cnx_target, source_db)

        print('done')
    except Exception:
        print(merged_simple)
        raise
