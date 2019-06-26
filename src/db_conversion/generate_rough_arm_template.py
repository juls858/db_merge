import copy
import json
import os
from typing import List
import pyhocon

from src.db_conversion.dataflow_conversion import data_conversion
from src.db_conversion.keyvault import KeyVault
from src.db_conversion.runner import *

dataflowNoLookup_template = {
    "name": "CircDataFlowTemplateNoLookup",
    "properties": {
        "type": "MappingDataFlow",
        "typeProperties": {
            "sources": [
                {
                    "dataset": {
                        "referenceName": "AzureSqlTable3",
                        "type": "DatasetReference"
                    },
                    "name": "InputStream",
                    "script": "source(output(\n\t\tid as integer,\n\t\tpassword as string,\n\t\tlast_login as timestamp,\n\t\tis_superuser as boolean,\n\t\tusername as string,\n\t\tfirst_name as string,\n\t\tlast_name as string,\n\t\temail as string,\n\t\tis_staff as boolean,\n\t\tis_active as boolean,\n\t\tdate_joined as timestamp\n\t),\n\tallowSchemaDrift: true,\n\tvalidateSchema: true,\n\tformat: 'table') ~> InputStream"
                }
            ],
            "sinks": [
                {
                    "dataset": {
                        "referenceName": "AzureSqlTable4",
                        "type": "DatasetReference"
                    },
                    "name": "sink1",
                    "script": "DerivedColumn1 sink(input(\n\t\tid as integer,\n\t\tpassword as string,\n\t\tlast_login as timestamp,\n\t\tis_superuser as boolean,\n\t\tusername as string,\n\t\tfirst_name as string,\n\t\tlast_name as string,\n\t\temail as string,\n\t\tis_staff as boolean,\n\t\tis_active as boolean,\n\t\tdate_joined as timestamp\n\t),\n\tallowSchemaDrift: true,\n\tvalidateSchema: false,\n\tformat: 'table',\n\tstaged: false,\n\tmapColumn(\n\t\tpassword,\n\t\tlast_login,\n\t\tis_superuser,\n\t\tusername,\n\t\tfirst_name,\n\t\tlast_name,\n\t\temail,\n\t\tis_staff,\n\t\tis_active,\n\t\tdate_joined\n\t)) ~> sink1"
                }
            ],
            "transformations": [
                {
                    "name": "DerivedColumn1",
                    "script": "InputStream derive(migration_date = currentTimestamp(),\n\t\tid_old = id) ~> DerivedColumn1"
                }
            ]
        }
    }
}

azure_template = {
    "name": "AzureCircSourceTemplate",
    "properties": {
        "linkedServiceName": {
            "referenceName": "AzureCircSource",
            "type": "LinkedServiceReference"
        },
        "folder": {
            "name": "azure"
        },
        "type": "AzureSqlTable",
        "typeProperties": {
            "tableName": "[dbo].[auth_user]"
        }
    }
}

maria_template = {
    "name": "MariaCircSourceTemplate",
    "properties": {
        "linkedServiceName": {
            "referenceName": "CircMariaSource",
            "type": "LinkedServiceReference"
        },
        "folder": {
            "name": "mariadb"
        },
        "type": "MariaDBTable",
        "typeProperties": {
            "tableName": "`auth_user`"
        }
    }
}

conf = pyhocon.ConfigFactory.parse_file('../app.config')
keyVault = KeyVault(conf)

exclusion = {}


def get_valid_tables_as_dict():
    result = []
    with open("migration_order.json") as f:
        tables = json.load(f)
        for t in tables:
            if t['exclude'] is False:
                result.append(t)
            else:
                exclusion[t['table']] = True
    return result


def generate_sink_from_table(**tables) -> [{}]:
    sinks = []

    for table in tables:
        sink = {
            'dataset': {
                'referenceName': table,
                'type': 'DataSetReference'
            },
            'name': '{0}_Sink'.format(table),
            'script': ''  # TODO Marty put your script here
        }
        sinks.append(sink)

    return sinks


def generate_data_set(x, az_table, az_sink_tbl, maria_table):
    """
    Generates the raw data set dictionary for ADF
    :param x:
    :param az_table:
    :param az_sink_tbl:
    :param maria_table:
    :return:
    """

    keyVault = KeyVault(conf)
    keyVault_pass = keyVault.fetch_secret(
        conf.get("source.secret_name"), conf.get("source.secret_version")
    ).value

    columns = get_columns(conf.get('source.url'), conf.get('source.user'), keyVault_pass, "circ-hack-source",
                          "dbo", x)

    az_table['name'] = 'AzSource_' + x
    az_table['properties']['typeProperties']['tableName'] = "[dbo].[" + x + "]"
    az_table['properties']['schema'] = columns
    az_table['properties'].pop('structure', None)

    columns = get_columns(conf.get("sink.url"), conf.get("sink.user"), keyVault_pass, "circ-hack-sink",
                          "dbo", x)

    az_sink_tbl['name'] = 'AzSink_' + x
    az_sink_tbl['properties']['linkedServiceName']['referenceName'] = "AzureCircSink"
    az_sink_tbl['properties']['typeProperties']['tableName'] = "[dbo].[" + x + "]"
    az_sink_tbl['properties']['folder']['name'] = 'azure_sink'
    az_sink_tbl['properties']['schema'] = columns
    az_sink_tbl['properties'].pop('structure', None)

    maria_table['name'] = 'MariaSource_' + x
    maria_table['properties']['typeProperties']['tableName'] = "`" + x + "`"

    return az_table, az_sink_tbl, maria_table


def generate_data_sets(base_dir, valid_tables):
    """
    :param base_dir:
    :param valid_tables:
    :return:
    """

    for x in valid_tables:
        az_table = {}
        az_sink_tbl = {}
        maria_table = {}

        if os.path.isfile(base_dir + ("/AzSource_{0}".format(x))):
            with open(base_dir + ("/AzSource_{0}".format(x))) as tp:
                az_table = json.load(tp)
        else:
            az_table = copy.deepcopy(azure_template)

        if os.path.isfile(base_dir + ("/AzSink_{0}".format(x))):
            with open(base_dir + ("/AzSink_{0}".format(x))) as tp:
                az_sink_tbl = json.load(tp)
        else:
            az_sink_tbl = copy.deepcopy(azure_template)

        if os.path.isfile(base_dir + ("/MariaSource_{0}".format(x))):
            with open(base_dir + ("/MariaSource_{0}".format(x))) as tp:
                maria_table = json.load(tp)
        else:
            maria_table = maria_template

        az_table, az_sink_tbl, maria_table = generate_data_set(x, az_table, az_sink_tbl, maria_table)

        with open(base_dir + '/dataset/' + az_table['name'] + ".json", 'w') as azp:
            json.dump(az_table, azp)

        with open(base_dir + '/dataset/' + az_sink_tbl['name'] + ".json", 'w') as azp:
            json.dump(az_sink_tbl, azp)

        with open(base_dir + '/dataset/' + maria_table['name'] + ".json", 'w') as mdp:
            json.dump(maria_table, mdp)


def load_dataflow_template(template_name):
    with open(template_name) as tfp:
        return json.load(tfp)


def generate_data_flow(template, df_name, db_name: str, sources: list = [], sink={}):
    """
    generates an Azure Data Factory
    :param template:
    :param df_name:
    :param output:
    :param sources:
    :param sink:
    :return:
    """
    template = load_dataflow_template(template)
    data_flow_tmpl = template
    data_flow_tmpl['name'] = df_name
    output = []

    data_flow_tmpl['properties']['typeProperties']['sources'] = generate_dataflow_sources(data_flow_tmpl,
                                                                                          sources, df_name, False)
    data_flow_tmpl['properties']['typeProperties']['sinks'] = generate_dataflow_sources(data_flow_tmpl,
                                                                                        sources, df_name, True)
    data_flow_tmpl['properties']['typeProperties']['transformations'] = get_transformations(sources, db_name, df_name)

    pretty_json(data_flow_tmpl['properties']['typeProperties']['transformations'])

    return data_flow_tmpl


def generate_dataflow_sources(data_flow_tmpl, sources, name, sink_flag=False):
    sinks = list()

    sinks.append(generate_dataflow_source(data_flow_tmpl, name, sink_flag, sink_flag))

    if sources and not sink_flag:
        for s in sources:
            name = s['referenced_table_name']
            if name in exclusion:
                continue
            print(name)
            sinks.append(generate_dataflow_source(data_flow_tmpl, name, True, sink_flag))

    return sinks


def generate_dataflow_source(data_flow_tmpl, name, sink_flag=False, endpoint=False):
    source = copy.deepcopy(data_flow_tmpl['properties']['typeProperties']['sources'][0])
    source['dataset']['type'] = 'DatasetReference'
    if sink_flag:
        source['name'] = 'Output' + name.replace("_", "")
        source['dataset']['referenceName'] = "AzSink_" + name
    else:
        source['name'] = 'Input' + name.replace("_", "")
        source['dataset']['referenceName'] = "AzSource_" + name

    keyVault = KeyVault(conf)
    keyVault_pass = keyVault.fetch_secret(
        conf.get("source.secret_name"), conf.get("source.secret_version")
    ).value
    dbo_name = "circ-hack-source"
    if sink_flag:
        dbo_name = "circ-hack-sink"
    columns = get_columns(conf.get('source.url'), conf.get('source.user'), keyVault_pass, dbo_name,
                          "dbo", name)

    source['script'] = data_conversion(columns, endpoint) + " " + source['name']

    return source


def get_fk_sources(tables):
    ret_dict = {}
    for idx, table in enumerate(tables):
        for jdx, foreign_key in enumerate(table['foreign_keys']):
            ret_dict[foreign_key['table_name']] = True
    return ret_dict.keys()


def get_fks_for_table(table_name: str, table_list: dict):
    # returns list of foreign keys for a given table
    for table in table_list:
        if table['table'] == table_name:
            return table['foreign_keys']


def pretty_json(obj):
    print(json.dumps(obj, sort_keys=True,
                     indent=4, separators=(',', ': ')))


def get_transformations(sources, source_db, df_name) -> list:
    if len(sources) > 0:
        transformations = get_transformations_lookups(sources, source_db, df_name)
    else:
        transformations = get_transformations_no_lookup("Input" + df_name)
    return transformations


def get_transformations_no_lookup(source_name) -> List[dict]:
    return [
        {
            "name": "DerivedColumn1",
            "script": "{0} derive(migration_date = currentTimestamp(),\n\t\tid_old = {0}@id) ~> DerivedColumn1".format(source_name.replace("_",""))
        }
    ]

    return transform_dict


def get_transformations_lookups(foreign_keys: list, source_db: str, df_name: str):
    """
    This only works for a single lookup
    :param foreign_keys:
    :param source_db:
    :return:
    """
    #template = """[{{"name": "{lookup_name}","script": "{source_table}, {lookup_table} lookup(user_id == {lookup_table}@id,\n\tbroadcast: 'none')~> {lookup_name}"}},{{"name": "DerivedColumn1","script": "{lookup_name} derive(migration_date = currentTimestamp(),\n\t\tid_old = {source_table}@id,\n\t\tsource_db = '{source_db}') ~> DerivedColumn1"}}]""".encode("unicode_escape").decode('utf-8')

    script = "{0}, {1} lookup({2} == {1}@id_old,\n\tbroadcast: 'none')~> {3}"
    transformation_list = []

    source_table = "Input" +df_name.replace("_", "")
    orginal_table = source_table
    for idx, foreign_key in enumerate(foreign_keys):

        lookup_table = "Output" + foreign_key['referenced_table_name'].replace("_", "")
        lookup_col = foreign_key['column_name']
        lookup_name = 'LKP{0}'.format(lookup_table)

        print(lookup_name)
        print(source_table)
        print(lookup_table)
        print(source_db)

        script = script.format(source_table, lookup_table, lookup_col, lookup_name, orginal_table)
        transformation_dict = {"name": lookup_name, "script": script}
        transformation_list.append(transformation_dict)
        source_table = lookup_name

    transformation_list += get_transformations_no_lookup(source_table)
    return transformation_list


if __name__ == '__main__':
    base_dir = conf.get('templates.base_dir')

    # valid_tables = get_valid_tables_as_dict()

    template_path = '../../data-migration-brute-force/dataflow/CircDataFlowTemplateNoLookup.json'

    valid_tables_dict = get_valid_tables_as_dict()

    valid_tables = [x['table'] for x in valid_tables_dict]
    #generate_data_sets(base_dir, valid_tables)

    for vt in valid_tables_dict:

        if vt['degree'] == 1:
            table_name = vt['table']
            fk_sources = get_fks_for_table(table_name, valid_tables_dict)
            # print(vt['degree'])
            template = generate_data_flow(template_path, table_name, 'foo', fk_sources)
            with open(base_dir + '/dataflow/' + vt['table'] + ".json", 'w') as mdp:
                json.dump(template, mdp)
                print(json.dumps(template, sort_keys=True,
                           indent=4, separators=(',', ': ')))
