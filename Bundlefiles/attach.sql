DECLARE @MDF VARCHAR(50) = '/usr/mssql/data/demodb.mdf'

DECLARE @DB_FILE VARCHAR(max)
SELECT  @DB_FILE = mf.physical_name
FROM sys.master_files mf
INNER JOIN sys.databases d ON mf.database_id = d.database_id
WHERE mf.physical_name = @MDF

IF @DB_FILE is NULL
BEGIN
    USE [master]
    CREATE DATABASE [DemoDB] ON 
      ( FILENAME = N'/usr/mssql/data/demodb.mdf' ),
      ( FILENAME = N'/usr/mssql/data/demodb_log.ldf' )
    FOR ATTACH
END
