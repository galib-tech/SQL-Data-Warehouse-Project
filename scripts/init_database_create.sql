/*
============================================================
Create Database and Schemas 
============================================================

Script Purpose:
    This script creates a new database named 'Datawarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

-- Switch to master database
USE master;

go
-- Drop and recreate the Database
if exists (select 1 from sys.databases where name = 'DataWarehouse')
begin 
	alter database DataWarehouse set SINGLE_USER with rollback immediately;
	drop database DataWarehouse;
end;
go

-- Create Database 'DataWarehouse'
create database DataWarehouse;
go

use DataWarehouse;
go

-- Create schemas bronze, silver, gold
create schema bronze;
go -- go is a separator in sql server
create schema silver;
go
create schema gold;
go
