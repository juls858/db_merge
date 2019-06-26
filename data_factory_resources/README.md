# Introduction
This Data Factory Pipeline copies data from a specified database (source) to a separate database (sink). 

The pipeline effectively does the following: 
1. Queries what schema.tables are available in the source:
    ```sql
    -- Looks at INFORMATION_SCHEMA to determine what schemas/tables are available.
    -- For this example, we limit ourselves to a specific schema and table. 
    -- At the minium, the WHERE COLUMN_NAME = 'id' should be present in the sub query

    SELECT
    q.TABLE_SCHEMA, 
    q.TABLE_NAME
    FROM (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'usw01-2-ares_pro1' 
    and COLUMN_NAME = 'id'
    and TABLE_NAME = 'api_missionsession'
    ) q 
    ```
1. Pipeline will take `TABLE_SCHEMA` and `TABLE_NAME` and use them as injectable parameters for the next steps
1. For each `TABLE_SCHEMA` and `TABLE_NAME` pair, it will run through TriggerCopy, 
1. TriggerCopy will run a separate pipeline that copies data from source to sink.
    1. The source can be more specified:
        ```sql
        SELECT * FROM `@{item().TABLE_SCHEMA}`.@{item().TABLE_NAME}
        ```
    1. The sink will put the data into a table with the format `TABLE_SCHEMA.TABLE_NAME`

This process assumes that a schema is already created for the tables that will be iterated on. The schema should ensure that the character limits for columns is correctly configured.

# Example Schema Creations For Sink Database
```sql
CREATE SCHEMA [usw01-2-ares_pro1];

CREATE TABLE [usw01-2-ares_pro1].[api_minigame] (
[id] INT,
[name] varchar(100),
[max_points] INT,
[max_points_interval] INT,
[catalog] varchar(100),
[time_limit] INT
)
```

```sql
CREATE TABLE [usw01-2-ares_pro1].[api_missionsession] (
  [id] INT,
  [public_ip] nchar(100),
  [public_port] varchar(100),
  [status] varchar(100),
  [missioninstance_id] varchar(100),
  [time_start] datetime ,
  [time_end] datetime ,
  [team_name] varchar(300),
  [done_reason] varchar(20),
  [owner_id] int,
  [mission_id] int,
  [total_time_elapsed] int,
  [time_limit] int,
  [last_updated] datetime,
  [range_available] varchar(20),
  [room_id] int,
  [environment] nvarchar(max),
  [range_used] varchar(20),
  [range_wait_time] int,
  [time_init] datetime,
  [learningpath] varchar(20),
  [organization_id] int,
  [guidguid] uniqueidentifier  -- added uniqueidentifier column
  )
```
 # Example of Successful Table Copy From Source to Sink
 ```
ares-migration> SELECT TOP (1000) [id]
...............       ,[public_ip]
...............       ,[public_port]
...............       ,[status]
...............       ,[missioninstance_id]
...............       ,[time_start]
...............       ,[time_end]
...............       ,[team_name]
...............       ,[done_reason]
...............       ,[owner_id]
...............       ,[mission_id]
...............       ,[total_time_elapsed]
...............       ,[time_limit]
...............       ,[last_updated]
...............       ,[range_available]
...............       ,[room_id]
...............       ,[environment]
...............       ,[range_used]
...............       ,[range_wait_time]
...............       ,[time_init]
...............       ,[learningpath]
...............       ,[organization_id]
...............       ,[guidguid]
...............   FROM [usw01-2-ares_pro1].[api_missionsession]


-[ RECORD 1 ]-------------------------
id                 | 1
public_ip          | 172.16.251.125
public_port        | 22
status             | done
missioninstance_id | 2f5a9208-be80-49b5-a56e-132ad841fbd2
time_start         | 2017-12-19 12:16:25.503
time_end           | 2017-12-19 12:19:25.883
team_name          | Team trudolph
done_reason        | completed
owner_id           | 60
mission_id         | 2
total_time_elapsed | 181
time_limit         | 28800
last_updated       | 2017-12-19 12:19:25.900
range_available    | 1
room_id            | 2
environment        | {"trainer": {"services": [], "mappable": false, "networks": {"control": {"ip": "10.0.10.101", "mac": "00:50:56:88:12:cf", "mask": "255.255.0.0", "mappable": false}}, "users": [{"uname": "trainer1", "uid": 3001}, {"uname": "trainer2", "uid": 3002}, {"uname": "trainer3", "uid": 3003}, {"uname": "trainer4", "uid": 3004}, {"uname": "trainer5", "uid": 3005}]}, "router": {"services": [], "mappable": true, "networks": {"control": {"ip": "10.0.0.10", "mac": "00:50:56:88:90:55", "mask": "255.255.0.0", "mappable": false}, "net1": {"name": "random1", "proto": "static", "ip": "153.97.170.211", "mappable": false, "mask": "255.255.255.0", "mac": "00:50:56:88:db:05"}, "net0": {"name": "172_16_0", "proto": "static", "ip": "172.16.0.10", "mappable": true, "mask": "255.255.255.0", "mac": "00:50:56:88:bc:05"}}, "users": []}, "kali1": {"services": [], "mappable": true, "networks": {"control": {"ip": "10.0.0.11", "mac": "00:50:56:88:52:f2", "mask": "255.255.0.0", "mappable": false}, "net0": {"name": "172_16_0", "proto": "static", "ip": "172.16.0.11", "mappable": true, "mask": "255.255.255.0", "mac": "00:50:56:88:c0:94"}}, "users": [{"uname": "user1", "uid": 2001}, {"uname": "user2", "uid": 2002}, {"uname": "user3", "uid": 2003}, {"uname": "user4", "uid": 2004}, {"uname": "user5", "uid": 2005}]}, "dns": {"services": ["dnsmasq"], "mappable": true, "networks": {"control": {"ip": "10.0.0.13", "mac": "00:50:56:88:9d:07", "mask": "255.255.0.0", "mappable": false}, "net0": {"name": "172_16_0", "proto": "static", "ip": "172.16.0.13", "mappable": true, "mask": "255.255.255.0", "mac": "00:50:56:88:ef:c2"}}, "users": []}, "server": {"services": ["vnc-server"], "mappable": true, "networks": {"control": {"ip": "10.0.0.12", "mac": "00:50:56:88:96:5c", "mask": "255.255.0.0", "mappable": false}, "net0": {"name": "random1", "proto": "static", "ip": "153.97.170.238", "mappable": true, "mask": "255.255.255.0", "mac": "00:50:56:88:1d:3d"}}, "users": []}}
range_used         | 1
range_wait_time    | 0
time_init          | 2017-12-19 12:14:55.383
learningpath       | 0
organization_id    | 1
guidguid           | NULL
```


# Parameterizing Source Databases
The steps above illustrate how to copy from a source to sink without any parameterization. Now we examine a case where we want to parameterize values to modify the following connection string values: 
* Database server fqdn
* Database table
* Database username
* Database password or secret key via Azure Key Vault

For either parameterized source type (MariaDB, SQL Server), there are default values pre-filled to understand the format of the string required. 

## Using Parameterization With MariaDB Source
1. Use the following snippets to have your source database parameterized:
    1. `datasets/source_parameterized.json`
    1. `linked_services/mariadb_parameterized.json`
    1. `pipelines/GetTableListAndTriggerCopyData.json`

## Using Parameterization With SQL Server Source
1. Use the following snippets to have your source database parameterized:
    1. `datasets/source_parameterized_sqlserver.json`
    1. `linked_services/sqlserver_parameterized.json`
    1. `pipelines/GetTableListAndTriggerCopyDataSQLServer.json`


