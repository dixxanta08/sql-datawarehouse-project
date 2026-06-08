/*
===============================================================================
Script Name : Initialize Data Warehouse
Description :
    This script recreates the DataWarehouse database from scratch and
    establishes the foundational schema structure for the data warehouse.

    The script performs the following actions:
    1. Checks whether the DataWarehouse database already exists.
    2. Forces active connections to disconnect.
    3. Drops the existing database.
    4. Creates a new DataWarehouse database.
    5. Creates the Bronze, Silver, and Gold schemas used in the Medallion
       Architecture.

Schema Layers:
    Bronze - Raw data ingestion layer.
    Silver - Cleaned, validated, and transformed data layer.
    Gold   - Business-ready reporting and analytics layer.

Usage:
    Run this script when initializing or resetting the data warehouse
    environment during development or testing.

===============================================================================
*/


USE master;
GO



-- Drop and recreate 'dataware' database;
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO



-- CREATE DATABASE `DataWarehouse`

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO


-- CREATE Schemas

CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO
