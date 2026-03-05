/*
========================================================
Create Database and Schemas
========================================================
Script Purpose:
	This script creates a new database named 'bikeshare_datawarehouse'.
	Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
*/

-- Create 'bikeshare_datawarehouse' database
CREATE DATABASE bikeshare_datawarehouse;
GO

USE bikeshare_datawarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
