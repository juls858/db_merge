# Python Development Environment for SQL Server

This image provides an integrated development environment for Python with connectivity to a remote SQL Server database. 

The following components are included:
- Ubuntu 18.04 OS layer.
- Pre-configured Python 3.6 runtime environment.
- [pyodbc driver](https://github.com/mkleehammer/pyodbc) for SQL Server (v17).
- A working Python to SQL Server code sample.
- SQL Server command-line utilities (sqlcmd and bcp).
- Command-line text editor tools (nano and vim).

## Usage
To build the image (from the docker folder):
        
        docker build --tag=ares-migration:latest .
        
To run an interactive bash session in this container simply run:

        docker run -v ~/ares-migration/src:/src -it ares-migration:latest

### Merging an Ares Database
To run the merge tool run:

        python convert_database.py

### Testing the ODBC Driver
The following optional environment variables can be provided to create the code sample:
- `$DB_HOST`: The IP address or hostname where the SQL Server instance is running.
- `$DB_USERNAME`: The database user in the SQL Server instance. 
- `$DB_PASSWORD`: The database user's password in the SQL Server instance. 
~~~~
    **Note:** If you are running SQL Server in a Docker container as well, you can obtain the container's IP address using `docker inspect <containerID>`.

After passing the above environment variables Within the container, you can run the following commands:
- `python connect.py`: Execute the code sample to connect to SQL Server. The `connect.py` file will already have the database parameters.
- `sqlcmd -S $DB_HOST -U $DB_USERNAME -P $DB_PASSWORD`: This will run the command-line client for SQL Server where you can execute T-SQL statements against it.


# Further Reading
---

+ [SQL Server on Linux for Docker documentation](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-docker)
+ [SQL Server - Developer Getting Started Tutorials](https://www.microsoft.com/en-us/sql-server/developer-get-started/?utm_source=DockerHub)
+ [SQL Server Docker GitHub Repository](https://github.com/Microsoft/mssql-docker)

