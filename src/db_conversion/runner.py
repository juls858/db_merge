import mysql.connector as mariadb
import id_to_guid
import foreign_key_to_guid
import get_constraints
import pymssql
import argparse
import pandas as pd
from sqlalchemy import create_engine
from src.db_conversion.dataflow_conversion import conversion_dict

lookup_tables = {
    'api_badge',
    'api_badgerequirement',
    'api_mediacentercategory',
    'api_mediacenterresource_core_skills',
    'api_mediacentertab',
    'api_minigamedefaultsetting',
    'api_minigamesessiontoken',
    'api_minigameusersetting',
    'api_preference',
    'api_quizquestion_minigame_sections',
    'api_rank',
    'api_sitesettings',
    'api_skilltype',
    'oauth2_provider_accesstoken',
    'oauth2_provider_grant',
    'oauth2_provider_refreshtoken',
}

sql_to_adf = {
    'Int64': ('bigint', 10),
     'Byte[]': ('varbinary', "nan"),
     'Boolean': ('bit', "nan"),
     'string': ('varchar', "nan"),
     'DateTime': ('datetime2', 7),
     'DateTimeOffset': ('Datetimeoffset', 'nan'),
     'Decimal': ('smallmoney', 'nan'),
     'Double': ('Float', 'nan'),
     'Int32': ('int', 10),
     'String': ('nvarchar', 'nan'),
     'Single': ('real', 'nan'),
     'Int16': ('tinyint', 'nan'),
     'Object': ('sql_variant', 'nan'),
     'TimeSpan': ('time', 'nan'),
     'Guid': ('uniqueidentifier', 'nan'),
     'Xml': ('xml', 'nan')
}

def get_columns(host, user, password, database, schema, table):
    cnx_str_fmt = 'mssql+pymssql://{u}:{p}@{h}/{d}'
    cnx_str = cnx_str_fmt.format(u=user, p=password, h=host, d=database)
    cnx = create_engine(cnx_str)

    columns_query = """
        SELECT 
         *
        FROM information_schema.COLUMNS c
        WHERE c.TABLE_CATALOG = '{2}' 
        AND c.TABLE_SCHEMA = '{0}' 
        AND c.TABLE_NAME = '{1}'
    """.format(schema, table, database)

    df = pd.read_sql(columns_query, con=cnx)
    rename_columns = {'COLUMN_NAME': 'name', 'DATA_TYPE': 'type', 'NUMERIC_PRECISION': 'precision'}
    to_dict = df[['COLUMN_NAME', 'DATA_TYPE', 'NUMERIC_PRECISION']].rename(columns=rename_columns).to_dict(orient='records')
    tmp = eval(str(to_dict).replace("'precision': nan", '').replace('.0', ''))
    return eval(str(to_dict).replace("'precision': nan", '').replace('.0', ''))


def deploy(host, user, password, database):
    sqlserver_connection = pymssql.connect(host=host,
                                           user=user,
                                           password=password,
                                           database=database)

    cursor = sqlserver_connection.cursor()
    change_query = sqlserver_connection.cursor()
    query_cursor = sqlserver_connection.cursor()

    tables_altered = {}

    foreign_keys_query = """
        SELECT C.CONSTRAINT_NAME as constraint_name, C.CONSTRAINT_SCHEMA as the_schema,C.TABLE_NAME as referencing_table_name ,KCU.COLUMN_NAME as referencing_column_name,C2.TABLE_NAME as referenced_table_name, KCU2.COLUMN_NAME as referenced_column_name, RC.DELETE_RULE delete_referential_action_desc, RC.UPDATE_RULE update_referential_action_desc
        FROM   information_schema.TABLE_CONSTRAINTS C
               INNER JOIN information_schema.KEY_COLUMN_USAGE KCU
                 ON C.CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA 
                    AND C.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME 
               INNER JOIN information_schema.REFERENTIAL_CONSTRAINTS RC
                 ON C.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
                    AND C.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 
               INNER JOIN information_schema.TABLE_CONSTRAINTS C2
                 ON RC.UNIQUE_CONSTRAINT_SCHEMA = C2.CONSTRAINT_SCHEMA 
                    AND RC.UNIQUE_CONSTRAINT_NAME = C2.CONSTRAINT_NAME 
               INNER JOIN information_schema.KEY_COLUMN_USAGE KCU2
                 ON C2.CONSTRAINT_SCHEMA = KCU2.CONSTRAINT_SCHEMA 
                    AND C2.CONSTRAINT_NAME = KCU2.CONSTRAINT_NAME 
                    AND KCU.ORDINAL_POSITION = KCU2.ORDINAL_POSITION 
        WHERE  C.CONSTRAINT_TYPE = 'FOREIGN KEY'
        
        ORDER BY C.CONSTRAINT_NAME
    """

    sqlserver_connection.commit()
    cursor.execute(foreign_keys_query)
    print("Retrieved all keys")
    primaries = []
    tuples = cursor.fetchall()
    for val in tuples:
        constraint_name = val[0]
        schema = val[1]
        main_table = val[4]
        schema_main_table = schema + "." + val[4]
        main_col = val[5]
        reference_table = val[2]
        schema_reference_table = schema + "." + val[2]
        reference_col = val[3]
        primaries.append((main_table, main_col, schema))
        print("Main table is:", schema_main_table, "Main column is:", main_col)
        print("Reference table is:", schema_reference_table, "Reference column is:", reference_col)

        if schema_main_table in lookup_tables or schema_main_table == schema_reference_table:
            continue

        if schema_main_table + '_' + main_col not in tables_altered:
            print("Altering main table")
            query_list = id_to_guid.id_to_guid(schema_main_table, main_col)

            for idx, query in enumerate(query_list):
                print('Executing:\n%s' % query)
                change_query.execute(query)
                sqlserver_connection.commit()
            tables_altered[schema_main_table + '_' + main_col] = True

        query_list = foreign_key_to_guid.foreign_key_to_guid(schema_main_table, schema_reference_table, main_col,
                                                             reference_col)

        for idx, query in enumerate(query_list):
            change_query.execute(query)
            sqlserver_connection.commit()

        query = get_constraints.remove_constraint(schema_reference_table, constraint_name)
        change_query.execute(query)
        sqlserver_connection.commit()

        # drop the column set the new
        query_list = foreign_key_to_guid.remove_foreign_key(schema_main_table, schema_reference_table, main_col,
                                                            reference_col)

        for idx, query in enumerate(query_list):
            change_query.execute(query)
            sqlserver_connection.commit()

    primaries_set = set(x for x in primaries)

    for primary in primaries_set:
        main_table = primary[0]
        main_col = primary[1]
        schema = primary[2]
        schema_main_table = schema + "." + main_table

        constraint_query = id_to_guid.get_primary_key_constraint(main_table, schema)
        query_cursor.execute(constraint_query)
        constraint_name = ""
        for constraint in query_cursor:
            constraint_name = constraint[0]
            query = get_constraints.remove_constraint(schema_main_table, constraint_name)
            change_query.execute(query)
            sqlserver_connection.commit()

        query_list = id_to_guid.remove_primary_key(schema_main_table, main_table, main_col)

        for idx, query in enumerate(query_list):
            change_query.execute(query)
            sqlserver_connection.commit()



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Transforms all foreign keys and primary keys to guids")
    parser.add_argument("-H", '--hostname')
    parser.add_argument("-p", "--password")
    parser.add_argument("-d", '--database')
    parser.add_argument("-u", "--username")
    args = parser.parse_args()
    deploy(args.hostname, args.username, args.password, args.database)
