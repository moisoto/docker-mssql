#start SQL Server, start the script to create the DB and import the data
#Run Setup Script in Background & Run SQL Server in foreground
/usr/scripts/setup-db.sh & /opt/mssql/bin/sqlservr
