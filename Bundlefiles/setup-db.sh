#wait for the SQL Server to come up

DBFILE=/usr/mssql/data/demodb.mdf
if [[ -f "$DBFILE" ]]; then
    sleep 20s
    #run the setup script to create the DB and the schema in the DB
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i attach.sql
else
    sleep 20s
    #run the setup script to create the DB and the schema in the DB
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i setup.sql
fi
