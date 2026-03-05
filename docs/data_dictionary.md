# Data Dictionary for Gold Layer
## Table: gold.unified_divvy_trips
- **Purpose:** Stores detail data of bike trip.

| Column Name              | Data Type     | Description                                                  |
|--------------------------|---------------|--------------------------------------------------------------|
| trip_key                 | INT           | A unique surrogate key to identify each individual trip.     |
| trip_id                  | NVARCHAR(50)  | The original unique identifier for each ride.                |
| start_time               | DATETIME      | The date and time when the bike trip started.                |                                             
| start_hour               | INT           | The hour when the bike trip started                          |
| weekday_of_start_date    | NVARCHAR(30)  | The day of the week when the bike trip started               |
| end_time                 | DATIME        | The date and time when the bike trip ended.                  |
| end_hour                 | INT           | The hour when the bike trip ended.                           |
| bike_id                  | INT           | Unique identifier for the bike used                          |
| trip_duration_minutes    | INT           | Total trip length in minutes of the bike trip.               |
| start_station_id         | INT           | Numeric ID of the station where the trip began.              |
| start_station_name       | NVARCHAR(250) | The official name of the starting bike station.              |
| end_station_id           | INT           | Numeric ID of the station where the trip ended.              |
| end_station_name         | NVARCHAR(250) | The official name of the destination bike station.           |
| user_type                | NVARCHAR(50)  | User classification                                          |
| user_gender              | NVARCHAR(30)  | The reported gender of the user.                             |
| user_birth_year          | INT           | The reported birth year of the user.                         |
| start_station_latitude   | FLOAT         | The latitude coordinate of the start station.                |
| start_station_longitude  | FLOAT         | The longitude coordinate of the start station.               |
| end_station_latitude     | FLOAT         | The latitude coordinate of the end station.                  |
| end_station_longitude    | FLOAT         | The longitude coordinate of the end station.                 |
