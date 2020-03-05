CREATE DATABASE [DemoDB] ON PRIMARY
( NAME = N'demodb', FILENAME = N'/usr/mssql/data/demodb.mdf' , SIZE = 2048KB , FILEGROWTH = 1024KB )
LOG ON 
( NAME = N'demodb_log', FILENAME = N'/usr/mssql/data/demodb_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
USE DemoDB;
GO
CREATE TABLE Products (ID int, ProductName varchar(300));
GO
INSERT INTO Products (ID, ProductName) VALUES (1, 'Nintendo Entertainment System');
INSERT INTO Products (ID, ProductName) VALUES (2, 'Super Nintendo Entertainment System');
INSERT INTO Products (ID, ProductName) VALUES (3, 'Nintendo 64');
INSERT INTO Products (ID, ProductName) VALUES (4, 'Nintendo Gamecube');
INSERT INTO Products (ID, ProductName) VALUES (5, 'Nintendo Wii');
INSERT INTO Products (ID, ProductName) VALUES (6, 'Nintendo Wii U');
INSERT INTO Products (ID, ProductName) VALUES (7, 'Nintendo Switch');
INSERT INTO Products (ID, ProductName) VALUES (8, 'Nintendo Switch Lite');
GO
