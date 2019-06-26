
constraints_query = """
Select SysObjects.[Name] As [Contraint Name] ,Tab.[Name] as [Table Name],Col.[Name] As [Column Name]
 From SysObjects Inner Join (Select [Name],[ID] From SysObjects Where XType = 'U') As Tab
On Tab.[ID] = Sysobjects.[Parent_Obj] 
Inner Join sysconstraints On sysconstraints.Constid = Sysobjects.[ID] 
Inner Join SysColumns Col On Col.[ColID] = sysconstraints.[ColID] And Col.[ID] = Tab.[ID]
Where tab.name = '{0}' and col.name = '{1}'
order by Col.[Name]
"""

alter_table_remove_constraint = """
ALTER TABLE {0} DROP {1}
"""


def get_constraint(table, col):
    return constraints_query.format(table, col)


def remove_constraint(reference_table, constraint_name):
    return alter_table_remove_constraint.format(reference_table, constraint_name)

