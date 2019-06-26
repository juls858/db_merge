import random

alter_table = """
ALTER TABLE {0}
ADD {1}_guid uniqueidentifier;
"""

update_table = """
UPDATE {0}
set {0}.{1}_guid = new_data.new_id
From {0}
inner join (select {3}, {3}_guid as new_id from {2} ) new_data on {0}.{1} = new_data.{3}

where {0}.{1} = new_data.{3};
"""

add_foreign_key = """
ALTER TABLE {0} ADD CONSTRAINT {3}_fkey_{4} FOREIGN KEY ({1}_guid) REFERENCES {2}({3}_guid);
"""

alter_table_remove_foreign_key = """
ALTER TABLE {0} DROP COLUMN {1}
"""

rename_column = """
EXEC sp_RENAME '{0}.{1}_guid', '{1}', 'COLUMN'
"""

def foreign_key_to_guid(table, reference_table, primary_key, foreign_key):
    query_list = []
    query_list.append(alter_table.format(reference_table, foreign_key))
    query_list.append(update_table.format(reference_table, foreign_key, table, primary_key))
    return query_list


def remove_foreign_key(table, reference_table, primary_key, foreign_key):
    query_list = []
    query_list.append(add_foreign_key.format(reference_table, foreign_key, table, primary_key, str(random.randint(100000, 999999))))
    query_list.append(alter_table_remove_foreign_key.format(reference_table, foreign_key))
    query_list.append(rename_column.format(reference_table, foreign_key))
    return query_list


