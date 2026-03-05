/*
===============================================================================
DDL Script: Create Gold table
===============================================================================
Script Purpose:
    This script creates table for the Gold layer in the data warehouse. 
    The Gold layer represents the final tables.

    Table performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - This table can be queried directly for analytics and reporting.
===============================================================================
*/

CREATE TABLE gold.unified_divvy_trips (
	trip_key INT,
	trip_id NVARCHAR (50),
	start_time DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	end_time DATETIME,
	end_hour INT,
	bike_id INT,
	trip_duration_minutes INT,
	start_station_id INT,
	start_station_name NVARCHAR (250),
	end_station_id INT,
	end_station_name NVARCHAR (250),
	user_type NVARCHAR (50),
	user_gender NVARCHAR (30),
	user_birth_year INT,
	start_station_latitude FLOAT,
	start_station_longitude FLOAT,
	end_station_latitude FLOAT,
	end_station_longitude FLOAT
						)
