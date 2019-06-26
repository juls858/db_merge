import json
test_val = "source(output(\n\t\tid as integer,\n\t\tdata as string,\n\t\tdashboard_id as string,\n\t\tuser_id as integer\n\t),\n\tallowSchemaDrift: true,\n\tvalidateSchema: false,\n\tformat: 'table') ~> source1"

conversion_dict = {
    "bigint": "integer",
    "binary": "Byte[]",
    "bit": "Boolean",
    "char": "string",
    "date": "timestamp",
    "Datetime": "timestamp",
    "datetime": "timestamp",
    "datetime2": "timestamp",
    "Datetimeoffset": "DateTimeOffset",
    "Decimal": "Decimal",
    "FILESTREAM attribute (varbinary(max))": "Byte[]",
    "Float": "Double",
    "image": "Byte[]",
    "int": "integer",
    "money": "Decimal",
    "nchar": "string",
    "ntext": "string",
    "numeric": "Decimal",
    "nvarchar": "String",
    "real": "Single",
    "rowversion": "Byte[]",
    "smalldatetime": "timestamp",
    "smallint": "integer",
    "smallmoney": "Decimal",
    "sql_variant": "Object",
    "text": "string",
    "time": "timestamp",
    "timestamp": "Byte[]",
    "tinyint": "integer",
    "uniqueidentifier": "string",
    "varbinary": "Byte[]",
    "varchar": "string",
    "xml": "Xml"
    }




def data_conversion(data, sink=False):
    script = "source(output("
    if sink:
        script = "DerivedColumn1 sink(input("
    for idx, col in enumerate(data):
        if col["type"] in conversion_dict:
            if sink and col["name"] == 'id':
                continue
            script += "\n\t\t" + col["name"] + " as " + conversion_dict[col["type"]].lower() +","
        else:
            print("things are broken please fix")
            print(col)
            print("exiting due to marty shenanigans")
            exit(1)
    script = script[:-1]
    if not sink:
        script += "\n\t),\n\tallowSchemaDrift: true,\n\tvalidateSchema: false,\n\tformat: 'table') ~>"
    else:
        script += "\n\t),\n\tallowSchemaDrift: true,\n\tvalidateSchema: false,\n\tformat: 'table',\n\tstaged: false,\n\tdeletable:false,\n\tinsertable:true,\n\tupdateable:false,\n\tupsertable:false) ~>"
        for idx, col in enumerate(data):
            if col["type"] in conversion_dict:
                if col["name"] == 'id':
                    continue
                script += "\n\t\t" + col["name"] + ","
    return script

