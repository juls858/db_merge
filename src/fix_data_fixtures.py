import pandas as pd
from sqlalchemy import create_engine, text

update_django_content = [

    """
    update t
    set
        t.object_id = coalesce(m.id, g.id)
    from
        dbo.api_learningpathoption t
            inner join [{0}].api_learningpathoption s
                       on s.uid = t.uid
            left join  [{0}].api_mission m_stg
                       on s.object_id = m_stg.id
                           and t.option_type in ('mission', 'battleroom')
            left join  dbo.api_mission m
                       on m_stg.uid = m.uid
            left join  [{0}].api_minigamesection g_stg
                       on s.object_id = g_stg.id
                           and t.option_type = 'minigame'
            left join  dbo.api_minigamesection g
                       on g_stg.name = g.name;
    
    """,
    """    
    update t
    set t.activity_id = coalesce(m.id, g.id)
    -- Select s.activity_id, t.activity_id, coalesce(m.id,g.id)
    from
        dbo.api_quiz t
            inner join [{0}].api_quiz s
                       on s.id = t.id_old
                       and t.source_db = '{0}'
            inner join dbo.django_content_type dj on t.activity_contenttype_id = dj.id 
            left join  [{0}].api_missionsession m_stg
                       on s.activity_id = m_stg.id and dj.model in ('missionsession')                        
            left join  dbo.api_missionsession m
                       on m_stg.id = m.id_old and m.source_db = '{0}'
            left join  [{0}].api_minigamesession g_stg
                       on s.activity_id = g_stg.id
                           and dj.model in ('minigamesession')
            left join  dbo.api_minigamesession g
                       on g_stg.id = g.id_old and g.source_db = '{0}'
    """
]

update_tables_ids = """
update t
set t.id = t.id_old
from dbo.{0};

"""


def fix_data_fixtures(cnx, database_name):
    querys = [x.format(database_name) for idx, x in enumerate(update_django_content)]
    for idx, query in enumerate(querys):

        cnx.execute(text(query).execution_options(autocommit=True))

def update_id_to_id_old(cnx, database_name):
    query = """
    Select *
    from
    (SELECT Distinct content_type_id as content_type_id
      FROM [dbo].[django_admin_log]) da
      inner join dbo.django_content_type dj on da.content_type_id = dj.id
    """
    df = pd.read_sql_query(query, cnx)
    tables_list = """
      SELECT TABLE_SCHEMA ,
           TABLE_NAME ,
           COLUMN_NAME ,
           ORDINAL_POSITION ,
           COLUMN_DEFAULT ,
           DATA_TYPE ,
           CHARACTER_MAXIMUM_LENGTH ,
           NUMERIC_PRECISION ,
           NUMERIC_PRECISION_RADIX ,
           NUMERIC_SCALE ,
           DATETIME_PRECISION
    FROM   INFORMATION_SCHEMA.COLUMNS
    where TABLE_SCHEMA like 'dbo'
    and COLUMN_NAME like 'id_old'"""
    tables_df = pd.read_sql_query(tables_list, cnx)
    base_query = """
    left join  [{0}].{1} {2}_stg
                       on s.object_id = {2}_stg.id and dj.model in ('{3}') 
    left join  dbo.{1} {2}
                       on {2}_stg.id = {2}.id_old and ({2}.source_db = '{0}' or {2}.source_db  is null)
    """
    random_var_list = []
    left_joins = []

    for idx, row in df.iterrows():
        table_alias = row['model'] + "_"
        table_name = row['app_label'] + "_" + row["model"]
        if table_name not in tables_df['TABLE_NAME'].unique():
            continue
        left_join = base_query.format(database_name, table_name, table_alias, row['model'])
        left_joins.append(left_join)
        random_var_list.append(table_alias)

    update_query = """
    update t
    set t.object_id = coalesce(CAST(coalesce({1}) as NVARCHAR(MAX)), t.object_id)
    from 
    dbo.django_admin_log t 
    inner join [{0}].django_admin_log s
                           on s.id = t.id_old
                           and t.source_db = '{0}'
    inner join dbo.django_content_type dj on t.content_type_id = dj.id 
    """

    table_aliases_id = ".id,".join(random_var_list) + ".id"

    final_query = update_query.format(database_name, table_aliases_id) + "".join(left_joins)

    cnx.execute(text(final_query).execution_options(autocommit=True))