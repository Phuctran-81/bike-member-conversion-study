/*
========================================================================================
LAYER: BRONZE (RAW DATA)
Script Purpose:
    Loads data into the 'bronze' schema from external CSV files.
    Uses the `BULK INSERT` command to load data from csv Files to bronze tables.	

=========================================================================================
*/
/*
===================================================
Insert data into table: bronze.divvy_trips_2019_q1
===================================================
*/
-- This data file have some value such as '1,2000.0' in trip duration so i need to use 'FIELDQUOTE = '"'
BULK INSERT bronze.divvy_trips_2019_q1
FROM 'C:\Users\phuct\OneDrive - VLG\Data Analyst\PROJECT\Bike Share Project\data_set\Divvy_Trips_2019_Q1.csv'
WITH (
		FIRSTROW = 2,
		FORMAT = 'CSV',
		FIELDQUOTE = '"',
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
GO
/*
===================================================
Insert data into table: bronze.divvy_trips_2019_q2
===================================================
*/
-- This data file have some value such as '1,2000.0' in trip duration so i need to use 'FIELDQUOTE = '"'

BULK INSERT bronze.divvy_trips_2019_q2
FROM 'C:\Users\phuct\OneDrive - VLG\Data Analyst\PROJECT\Bike Share Project\data_set\Divvy_Trips_2019_Q2.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	FIELDQUOTE = '"',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	TABLOCK
	);
GO

/*
===================================================
Insert data into table: bronze.divvy_trips_2019_q3
===================================================
*/
-- This data file have some value such as '1,2000.0' in trip duration so i need to use 'FIELDQUOTE = '"'
BULK INSERT bronze.divvy_trips_2019_q3
FROM 'C:\Users\phuct\OneDrive - VLG\Data Analyst\PROJECT\Bike Share Project\data_set\Divvy_Trips_2019_Q3.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	FIELDQUOTE = '"',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	TABLOCK
	);
GO

/*
===================================================
Insert data into table: bronze.divvy_trips_2019_q4
===================================================
*/
-- This data file have some value such as '1,2000.0' in trip duration so i need to use 'FIELDQUOTE = '"'
BULK INSERT bronze.divvy_trips_2019_q4
FROM 'C:\Users\phuct\OneDrive - VLG\Data Analyst\PROJECT\Bike Share Project\data_set\Divvy_Trips_2019_Q4.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	FIELDQUOTE = '"',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	TABLOCK
	);
GO

/*
===================================================
Insert data into table: bronze.divvy_trips_2020_q1
===================================================
*/
BULK INSERT bronze.divvy_trips_2020_q1
FROM 'C:\Users\phuct\OneDrive - VLG\Data Analyst\PROJECT\Bike Share Project\data_set\Divvy_Trips_2020_Q1.csv'
WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
GO
