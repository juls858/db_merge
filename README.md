# Ares Migration repo
This repo is intended for converting and merging ares databases from mysql to MSSQL.

## Environment requirements
1. Have docker-compose installed on the machine
1. Ability to execute sql scripts on the MSSQL server
1. Access to a Key Vault
1. Edit `*.conf` files

## Conversion Steps
1. Create blank MSSQL database or Empty a MSSQL database with src/empty_database.sql
1. Create database schemata by running the following sql scripts
    - *src/sparta_dbo.sql*
    - *src/ares_schema_stage.sql*
1. Edit app.config to proper keyvault configurations and app configuration
    1. source and target has four fields
        1. url represents the url of the database
        1. user is the user to log in with to the database
        1. secret_name is the name of the secret in the key vault
        1. secret_version is the version of the secret
    1. azure has six fields
        1. tenant is the directory id of the keyvault which can be found in the overview of the keyvault
        1. app id represents the id of the application that can run a pipeline
        1. vaultid is the name of the keyvault
        1. client-secret is the secret associated with the app
        1. object id is not necessary
        1. The last field is a json object which points towards the azure pipeline being used
1. Execute the `./deploy.sh -d <sourceDatabase>  -m <mergeTargetDB>`
        
## ARM Template 
The included ARM template is used to create the Azure Data Factory Pipeline. We have been unable to generate this pipeline directly from the repo.

The following parameterized connection strings are needed when using the ARM Template:

- MySQL
`Server=@{linkedService().DBServer};Port=3306;Database=@{linkedService().DBName};UID=@{linkedService().DBUser}`
- SQL Server:
`Integrated Security=False;Encrypt=True;Connection Timeout=30;Data Source=@{linkedService().SinkDBServer};Initial Catalog=@{linkedService().SinkDBName};User ID=@{linkedService().SinkUser}`



