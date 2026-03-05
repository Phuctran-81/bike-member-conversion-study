/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema.
	Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

/*
==============================================
Create silver.dim_station table.
==============================================
*/

CREATE TABLE silver.dim_station (
	station_id INT PRIMARY KEY,
	station_name NVARCHAR (250),
	station_latitude FLOAT,
	station_longitude FLOAT
	);
GO
/*
==============================================
Create silver.divvy_trips_2019_q1 table.
==============================================
*/

CREATE TABLE silver.divvy_trips_2019_q1 (
	trip_id INT,
	start_time DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	end_time DATETIME,
	end_hour INT,
	bikeid INT,
	trip_duration_minutes INT,
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT,
	from_station_latitude FLOAT,
	from_station_longitude FLOAT,
	to_station_latitude FLOAT,
	to_station_longitude FLOAT
	);
GO
/*
==============================================
Create silver.divvy_trips_2019_q2 table.
==============================================
*/

CREATE TABLE silver.divvy_trips_2019_q2 (
	rental_details_rental_id INT,
	rental_details_local_start_time DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	rental_details_local_end_time DATETIME,
	end_hour INT,
	rental_details_bike_id INT,
	trip_duration_minutes INT,
	rental_start_station_id INT,
	rental_start_station_name NVARCHAR(250),
	rental_end_station_id INT,
	rental_end_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	member_gender NVARCHAR (30),
	member_details_member_birthday_year INT,
	start_station_latitude FLOAT,
	start_station_longitude FLOAT,
	end_station_latitude FLOAT,
	end_station_longitude FLOAT
	);
GO
/*
==============================================
Create silver.divvy_trips_2019_q3 table.
==============================================
*/

CREATE TABLE silver.divvy_trips_2019_q3 (
	trip_id INT,
	start_time DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	end_time DATETIME,
	end_hour INT,
	bikeid INT,
	trip_duration_minutes INT,
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT,
	from_station_latitude FLOAT,
	from_station_longitude FLOAT,
	to_station_latitude FLOAT,
	to_station_longitude FLOAT
	);
GO
/*
==============================================
Create silver.divvy_trips_2019_q4 table.
==============================================
*/
DROP TABLE silver.divvy_trips_2019_q4;
CREATE TABLE silver.divvy_trips_2019_q4 (
	trip_id INT,
	start_time DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	end_time DATETIME,
	end_hour INT,
	bikeid INT,
	trip_duration_minutes INT,
	from_station_id INT,
	from_station_name NVARCHAR (250),
	to_station_id INT,
	to_station_name NVARCHAR (250),
	usertype NVARCHAR (50),
	gender NVARCHAR (30),
	birthyear INT,
	from_station_latitude FLOAT,
	from_station_longitude FLOAT,
	to_station_latitude FLOAT,
	to_station_longitude FLOAT
	);
GO
/*
==============================================
Create silver.divvy_trips_2020_q1 table.
==============================================
*/

CREATE TABLE silver.divvy_trips_2020_q1 (
	ride_id NVARCHAR (30),
	started_at DATETIME,
	start_hour INT,
	weekday_of_start_date NVARCHAR (30),
	ended_at DATETIME,
	end_hour INT,
	trip_duration_minutes INT,
	start_station_id INT,
	start_station_name NVARCHAR (250),
	end_station_id INT,
	end_station_name NVARCHAR (250),
	member_casual NVARCHAR (30),
	start_lat FLOAT,
	start_lng FLOAT,
	end_lat FLOAT,
	end_lng FLOAT
	); 
GO
