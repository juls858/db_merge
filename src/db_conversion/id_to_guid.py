import random

update_table = """
UPDATE {0}
set {0}.{1}_guid = new_data.new_id
FROM {0}
inner join (select {1}, NEWID() as new_id from {0} ) new_data on {0}.{1} = new_data.{1}
where {0}.{1} = new_data.{1};
"""

alter_table = """
ALTER TABLE {0}
ADD {1}_guid UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL;
"""
alter_table_add_unique = """
alter table {0} 
add constraint {1}_guid_unique_constraint{2} UNIQUE ({1}_guid);
"""

alter_table_remove_auto_increment = """
ALTER TABLE {0} MODIFY {1} int
"""
alter_table_remove_primary = """
ALTER TABLE {0} DROP COLUMN {1}
"""

rename_column = """
EXEC sp_RENAME '{0}.{1}_guid', '{1}', 'COLUMN'
"""

alter_table_set_new_primary = """
ALTER TABLE {0} ADD CONSTRAINT pk__{1}_{2} PRIMARY KEY({1})
"""

get_primary_key_constraint_query = """
SELECT name  
FROM sys.key_constraints  
WHERE type = 'PK' AND OBJECT_NAME(parent_object_id) = N'{0}'
and SCHEMA_NAME(schema_id) = '{1}';  
"""

def id_to_guid(table, column_name):
    query_list = []
    query_list.append(alter_table.format(table, column_name))
    query_list.append(update_table.format(table, column_name))
    query_list.append(alter_table_add_unique.format(table, column_name, str(random.randint(100000, 999999))))
    return query_list


def remove_primary_key(schema_main_table, main_table, main_col):
    query_list = []
    query_list.append(alter_table_remove_primary.format(schema_main_table, main_col))
    query_list.append(rename_column.format(schema_main_table, main_col))
    query_list.append(alter_table_set_new_primary.format(schema_main_table, main_col, str(random.randint(100000, 999999)), main_table))
    return query_list

def get_primary_key_constraint(table, schema):
    return get_primary_key_constraint_query.format(table, schema)

