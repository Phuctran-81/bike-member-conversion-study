/* ================================================================================
LAYER: GOLD (Unification)
Script Purpose: 
	Consolidate 5 quarterly datasets (2019 Q1 - 2020 Q1) into a single Fact Table 
	for Tableau visualization.

================================================================================
*/

/*
========================================================
CREATE TABLE: gold.unified_divvy_trips
========================================================
*/

INSERT INTO gold.unified_divvy_trips (
	trip_key,
	trip_id,
	start_time,
	start_hour,
	weekday_of_start_date,
	end_time,
	end_hour,
	bike_id,
	trip_duration_minutes,
	start_station_id,
	start_station_name,
	end_station_id,
	end_station_name,
	user_type,
	user_gender,
	user_birth_year,
	start_station_latitude,
	start_station_longitude,
	end_station_latitude,
	end_station_longitude
				)

SELECT 
	-- Generating a unique 'trip_key' to serve as a Primary Key for the Gold layer
	ROW_NUMBER() OVER (ORDER BY start_time, trip_id) AS trip_key,
	trip_id,
	start_time,
	start_hour,
	weekday_of_start_date,
	end_time,
	end_hour,
	bikeid AS bike_id,
	trip_duration_minutes,
	from_station_id AS start_station_id,
	from_station_name AS start_station_name,
	to_station_id AS end_station_id,
	to_station_name AS end_station_name,
	usertype AS user_type,
	gender AS user_gender,
	birthyear AS user_birth_year,
	from_station_latitude AS start_station_latitude,
	from_station_longitude AS start_station_longitude,
	to_station_latitude AS end_station_latitude,
	to_station_longitude AS end_station_longitude
FROM (
		/*
		========================================================
		silver.divvy_trips_2019_q1 TABLE
		========================================================
		*/

		SELECT
			-- Change Data type of trip_id column to match data type of ride_id column in divvy_trip_2020_q1 table.
			CAST (trip_id AS VARCHAR) trip_id,
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
		FROM silver.divvy_trips_2019_q1

		UNION ALL

		/*
		========================================================
		silver.divvy_trips_2019_q2 TABLE
		========================================================
		*/
		SELECT
			-- Change Data type of rental_details_rental_id column to match data type of ride_id column in divvy_trip_2020_q1 table.
			CAST (rental_details_rental_id AS VARCHAR) trip_id,
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
		FROM silver.divvy_trips_2019_q2

		UNION ALL

		/*
		========================================================
		silver.divvy_trips_2019_q3 TABLE
		========================================================
		*/
		SELECT
			-- Change Data type of trip_id column to match data type of ride_id column in divvy_trip_2020_q1 table.
			CAST (trip_id AS VARCHAR ) trip_id,
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
		FROM silver.divvy_trips_2019_q3

		UNION ALL

		/*
		========================================================
		silver.divvy_trips_2019_q4 TABLE
		========================================================
		*/
		SELECT
			-- Change Data type of trip_id column to match data type of ride_id column in divvy_trip_2020_q1 table.
			CAST (trip_id AS VARCHAR) trip_id,
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
		FROM silver.divvy_trips_2019_q4

		UNION ALL

		/*
		========================================================
		silver.divvy_trips_2020_q1 TABLE
		========================================================
		*/
		SELECT 
			ride_id,
			started_at,
			start_hour,
			weekday_of_start_date,
			ended_at,
			end_hour,
			NULL AS bikeid, -- Note: bikeid data was discontinued in the 2020 Q1 source schema.
			trip_duration_minutes,
			start_station_id,
			start_station_name,
			end_station_id,
			end_station_name,
			member_casual,
			NULL AS gender, -- Note: Gender data was discontinued in the 2020 Q1 source schema.
			NULL AS birth_year, -- Note: Birth year data was discontinued in the 2020 Q1 source schema.
			start_lat,
			start_lng,
			end_lat,
			end_lng
		FROM silver.divvy_trips_2020_q1
											)t
