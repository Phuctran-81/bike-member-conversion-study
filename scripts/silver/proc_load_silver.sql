/* ===================================================================================
LAYER: SILVER (cleaned and transformation data)
Script Purpose:
    This script performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Inserts transformed and cleansed data from Bronze into Silver tables.
=================================================================================== */

/* ==========================================
Insert data into silver.dim_station TABLE
============================================*/
INSERT INTO silver.dim_station (
	station_id,
	station_name,
	station_latitude,
	station_longitude
				)
SELECT 
*
FROM (
SELECT DISTINCT
start_station_id AS station_id,
start_station_name AS station_name,
start_lat AS station_latitude,
start_lng AS station_longitude
FROM bronze.divvy_trips_2020_q1
UNION
SELECT DISTINCT
end_station_id AS station_id,
end_station_name AS station_name,
end_lat AS station_latitude,
end_lng AS station_longitude
FROM bronze.divvy_trips_2020_q1)t
WHERE station_id IS NOT NULL 
GO 

/* ===============================================
Insert data into silver.divvy_trips_2019_q1 TABLE
==================================================*/

INSERT INTO silver.divvy_trips_2019_q1 (
		trip_id,
		start_time,
		start_hour,
		weekday_of_start_date,
		end_time,
		end_hour,
		bikeid,
		trip_duration_minutes,
		from_station_id,
		from_station_name,
		to_station_id,
		to_station_name,
		usertype,
		gender,
		birthyear,
		from_station_latitude,
		from_station_longitude,
		to_station_latitude,
		to_station_longitude
							)
SELECT 
trip_id,
start_time,
-- Create a new column for start time of trip in hour
DATEPART(HOUR,start_time) AS start_hour, 
-- Create a new column for the day of the week of trip starting date
DATENAME (WEEKDAY, start_time) AS weekday_of_start_date,
end_time,
-- Create a new column for end time of trip in hour 
DATEPART(HOUR,end_time) AS end_hour,
bikeid,
-- Create a new column for trip duration in minutes
DATEDIFF (MINUTE, start_time, end_time) AS trip_duration_minutes,
from_station_id,
from_station_name,
to_station_id,
to_station_name,
usertype,
CASE 
	WHEN gender IS NULL THEN 'n/a'
	ELSE gender
END gender,
birthyear,
s1.station_latitude AS from_station_latitude,
s1.station_longitude AS from_station_longitude,
s2.station_latitude AS to_station_latitude,
s2.station_longitude AS to_station_longitude
FROM bronze.divvy_trips_2019_q1 d
LEFT JOIN silver.dim_station s1
ON d.from_station_id = s1.station_id
LEFT JOIN silver.dim_station s2
ON d.to_station_id = s2.station_id 

/* ===============================================
Insert data into silver.divvy_trips_2019_q2 TABLE
==================================================*/

INSERT INTO silver.divvy_trips_2019_q2 (
	rental_details_rental_id,
	rental_details_local_start_time,
	start_hour,
	weekday_of_start_date,
	rental_details_local_end_time,
	end_hour,
	rental_details_bike_id,
	trip_duration_minutes,
	rental_start_station_id,
	rental_start_station_name,
	rental_end_station_id,
	rental_end_station_name,
	usertype,
	member_gender,
	member_details_member_birthday_year,
	start_station_latitude,
	start_station_longitude,
	end_station_latitude,
	end_station_longitude
				)
SELECT 
rental_details_rental_id,
rental_details_local_start_time,
-- Create a new column for start time of trip in hour
DATEPART(HOUR,rental_details_local_start_time) AS start_hour,
-- Create a new column for the day of the week of trip starting date
DATENAME (WEEKDAY, rental_details_local_start_time) AS weekday_of_start_date,
rental_details_local_end_time,
-- Create a new column for end time of trip in hour 
DATEPART(HOUR,rental_details_local_end_time) AS end_hour,
rental_details_bike_id,
-- Create a new column for trip duration in minutes
DATEDIFF (MINUTE, rental_details_local_start_time, rental_details_local_end_time) AS trip_duration_minutes,
rental_start_station_id,
rental_start_station_name,
rental_end_station_id,
rental_end_station_name,
usertype,
CASE 
	WHEN member_gender IS NULL THEN 'n/a'
	ELSE member_gender
END member_gender,
member_details_member_birthday_year,
s1.station_latitude AS from_station_latitude,
s1.station_longitude AS from_station_longitude,
s2.station_latitude AS to_station_latitude,
s2.station_longitude AS to_station_longitude
FROM bronze.divvy_trips_2019_q2 d
LEFT JOIN silver.dim_station s1
ON d.rental_start_station_id = s1.station_id
LEFT JOIN silver.dim_station s2
ON d.rental_end_station_id = s2.station_id 

/* ===============================================
Insert data into silver.divvy_trips_2019_q3 TABLE 
==================================================*/

INSERT INTO silver.divvy_trips_2019_q3 (
		trip_id,
		start_time,
		start_hour,
		weekday_of_start_date,
		end_time,
		end_hour,
		bikeid,
		trip_duration_minutes,
		from_station_id,
		from_station_name,
		to_station_id,
		to_station_name,
		usertype,
		gender,
		birthyear,
		from_station_latitude,
		from_station_longitude,
		to_station_latitude,
		to_station_longitude
					 )
SELECT
trip_id,
start_time,
-- Create a new column for start time of trip in hour
DATEPART(HOUR,start_time) AS start_hour,
-- Create a new column for the day of the week of trip starting date
DATENAME (WEEKDAY, start_time) AS weekday_of_start_date,
end_time,
-- Create a new column for end time of trip in hour 
DATEPART(HOUR,end_time) AS end_hour,
bikeid,
-- Create a new column for trip duration in minutes
DATEDIFF (MINUTE, start_time, end_time) AS trip_duration_minutes,
from_station_id,
from_station_name,
to_station_id,
to_station_name,
usertype,
CASE 
	WHEN gender IS NULL THEN 'n/a'
	ELSE gender
END gender,
birthyear,
s1.station_latitude AS from_station_latitude,
s1.station_longitude AS from_station_longitude,
s2.station_latitude AS to_station_latitude,
s2.station_longitude AS to_station_longitude
FROM bronze.divvy_trips_2019_q3 d
LEFT JOIN silver.dim_station s1
ON d.from_station_id = s1.station_id
LEFT JOIN silver.dim_station s2
ON d.to_station_id = s2.station_id 

/* ===============================================
Insert data into silver.divvy_trips_2019_q4 TABLE
==================================================*/

INSERT INTO silver.divvy_trips_2019_q4 (
		trip_id,
		start_time,
		start_hour,
		weekday_of_start_date,
		end_time,
		end_hour,
		bikeid,
		trip_duration_minutes,
		from_station_id,
		from_station_name,
		to_station_id,
		to_station_name,
		usertype,
		gender, 
		birthyear,
		from_station_latitude,
		from_station_longitude,
		to_station_latitude,
		to_station_longitude
					)
SELECT
trip_id,
start_time,
-- Create a new column for start time of trip in hour
DATEPART(HOUR,start_time) AS start_hour,
-- Create a new column for the day of the week of trip starting date
DATENAME (WEEKDAY, start_time) AS weekday_of_start_date,
end_time,
-- Create a new column for end time of trip in hour 
DATEPART(HOUR,end_time) AS end_hour,
bikeid,
-- Create a new column for trip duration in minutes
DATEDIFF (MINUTE, start_time, end_time) trip_duration_minutes,
from_station_id,
from_station_name,
to_station_id,
to_station_name,
usertype,
CASE
	WHEN gender IS NULL THEN 'n/a'
	ELSE gender
END gender, 
birthyear,
s1.station_latitude AS from_station_latitude,
s1.station_longitude AS from_station_longitude,
s2.station_latitude AS to_station_latitude,
s2.station_longitude AS to_station_longitude
FROM bronze.divvy_trips_2019_q4 d
LEFT JOIN silver.dim_station s1
ON d.from_station_id = s1.station_id
LEFT JOIN silver.dim_station s2
ON d.to_station_id = s2.station_id 
-- Filter out all rows with trip duration under 1 minute
WHERE DATEDIFF (MINUTE, start_time, end_time) > 1 


/* ===============================================
Insert data into silver.divvy_trips_2020_q1 TABLE
==================================================*/

INSERT INTO silver.divvy_trips_2020_q1 (
	ride_id,
	started_at,
	start_hour,
	weekday_of_start_date,
	ended_at,
	end_hour,
	trip_duration_minutes,
	start_station_id,
	start_station_name,
	end_station_id,
	end_station_name,
	member_casual,
	start_lat,
	start_lng,
	end_lat,
	end_lng
				)
SELECT
ride_id,
started_at,
-- Create a new column for start time of trip in hour
DATEPART(HOUR,started_at) AS start_hour,
-- Create a new column for the day of the week of trip starting date
DATENAME (WEEKDAY, started_at) AS weekday_of_start_date,
ended_at,
-- Create a new column for end time of trip in hour 
DATEPART(HOUR,ended_at) AS end_hour,
-- Create a new column for trip duration in minutes
DATEDIFF (MINUTE, started_at, ended_at) trip_duration_minutes,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
-- Updated user_type labels to match the naming conventions of the 2019 datasets.
CASE 
	WHEN member_casual = 'member' THEN 'Subscriber'
	WHEN member_casual = 'casual' THEN 'Customer'
END member_casual, 
start_lat,
start_lng,
end_lat,
end_lng
FROM bronze.divvy_trips_2020_q1
-- Filter out all rows with trip duration under 1 minute and missing end station name
WHERE DATEDIFF (MINUTE, started_at, ended_at) >= 1 AND end_station_name IS NOT NULL ; 


 
