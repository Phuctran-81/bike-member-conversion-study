/*
=====================================================================
DDL Script: Create Bronze Tables
=====================================================================
Script Purpose:
	This script creates tables in the 'bronze' schema.
	Run this script to re-define the DDL structure of 'bronze' Tables
======================================================================
*/

/*
==============================================
Create bronze.divvy_trips_2019_q1 table.
==============================================
*/

CREATE TABLE bronze.divvy_trips_2019_q1 (
	trip_id INT,
	start_time DATETIME,
	end_time DATETIME,
	bikeid INT,
	tripduration NVARCHAR (100),
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT
	);
GO

/*
==============================================
Create bronze.divvy_trips_2019_q2 table.
==============================================
*/
CREATE TABLE bronze.divvy_trips_2019_q2 (
	rental_details_rental_id INT,
	rental_details_local_start_time DATETIME,
	rental_details_local_end_time DATETIME,
	rental_details_bike_id INT,
	rental_details_duration_in_seconds_uncapped NVARCHAR (30),
	rental_start_station_id INT,
	rental_start_station_name NVARCHAR(250),
	rental_end_station_id INT,
	rental_end_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	member_gender NVARCHAR (30),
	member_details_member_birthday_year INT
	);
GO

/*
==============================================
Create bronze.divvy_trips_2019_q3 table.
==============================================
*/
CREATE TABLE bronze.divvy_trips_2019_q3 (
	trip_id INT,
	start_time DATETIME,
	end_time DATETIME,
	bikeid INT,
	tripduration NVARCHAR (30),
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT
	);
GO

/*
==============================================
Create bronze.divvy_trips_2019_q4 table.
==============================================
*/
CREATE TABLE bronze.divvy_trips_2019_q4 (
	trip_id INT,
	start_time DATETIME,
	end_time DATETIME,
	bikeid INT,
	tripduration NVARCHAR (30),
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT
	);
GO

/*
==============================================
Create bronze.divvy_trips_2020_q1 table.
==============================================
*/
CREATE TABLE bronze.divvy_trips_2020_q1 (
	ride_id NVARCHAR (30),
	rideable_type NVARCHAR (30),
	started_at DATETIME,
	ended_at DATETIME,
	start_station_name NVARCHAR (250),
	start_station_id INT,
	end_station_name NVARCHAR (250),
	end_station_id INT,
	start_lat FLOAT,
	start_lng FLOAT,
	end_lat FLOAT,
	end_lng FLOAT,
	member_casual NVARCHAR (30)
	); 
GO 
