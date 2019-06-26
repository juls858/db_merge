import networkx as nx
import pyhocon
import mysql.connector
import pandas as pd
from sqlalchemy import create_engine
import urllib
from keyvault import KeyVault


# %%

# azure_cfg = pyhocon.ConfigFactory.parse_file("azure.conf")
# kv = KeyVault(azure_cfg)

# maria_db_pass = kv.fetch_secret('mi-datastore-secret', '0bd85431f75e4bcbafd4317dc715bdaa').value
def create_mssql_engine():
    h = 'ares-migration.database.windows.net'
    d = 'ares_schema'
    u = 'ares@ares-migration'
    p = 'ahT9sLc)3e@#'

    pymssql_url = 'mssql+pymssql://{u}:{p}@{h}/{d}?charset=utf8'
    return create_engine(pymssql_url.format(u=u, h=h, p=p, d=d))


def get_key_column_usage(cnx, schema):
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
           INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
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
    q = "CONSTRAINT_TYPE == 'PRIMARY'"
    return df.query(q)[['TABLE_NAME', 'COLUMN_NAME']]


def find_heaps(df_all_ables, df_tables_with_pk):
    q = "TABLE_NAME not in @df_tables_with_pk.TABLE_NAME.tolist()"
    return df_all_ables.query(q)


# %%

cnx = create_mssql_engine()

# %%
df_all_keys = get_key_column_usage(cnx, 'dbo')
df_tables = get_all_tables_in_schema(cnx, 'dbo')

df_fk = get_fks(df_all_keys)

df_tables_with_pk = get_tables_with_pk(df_all_keys)

df_heaps = find_heaps(df_tables, df_tables_with_pk)
# %%


# %%
