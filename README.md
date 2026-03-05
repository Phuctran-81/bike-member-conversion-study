# Behavioral Analysis & Strategic Growth: Cyclistic Member Conversion
## I. Overall
### **Problem:** 
Analyzed 4.3M+ records of historical trip data to identify behavioral patterns distinguishing casual riders from annual members. The goal was to provide data-driven recommendations to convert casual users ("Customer") into long-term users ("Subscriber").
### **Action:**
**Data Engineering:** Architected a three-tier Medallion Warehouse (Bronze/Silver/Gold) in MS SQL Server to manage data ingestion, cleaning, and unification.\
**Analytics & BI:** Engineered interactive Tableau dashboards to identify seasonal trends, peak usage windows, and user clusters.
### **Result:**
**Usage Patterns:** Identified that Subscribers dominate weekday commute peaks (6–9 AM/4–6 PM), while casual riders spike on weekends, suggesting a shift from utility to recreation.\
**Duration Insights:** Casual riders averaged significantly higher trip durations, indicating "Subscriber” use the bikes for commuting (utility) while “Customer” use them for leisure.\
**Seasonality:** Detected a sharp volume drop during winter, identifying a churn risk period.
### Recommendations: 
Delivered 3 actionable growth: 
- **"Weekend-Warrior" Membership:** This caters to casual riders who use the service for recreation but may be intimidated by an annual commitment.
- **Hyper-Local Marketing:** Geographic-targeted digital signage at the Top 10 high-volume casual stations.
- **Incentive-Based Digital Alerts:** Utilize the mobile app to trigger "Smart Alerts". If a casual rider exceeds a certain duration (e.g., 45 minutes), send a notification showing how much they would have saved on that specific trip with a membership.
## II. Analytical Framework: A 6-Stage Deep Dive
This project followed by the six stage of analysis process.
### **1. Ask**
   The primary objective is to analyze historical bike trip data to identify specific behavioral triggers and trends that distinguish “Customer” riders from “Subscriber” riders. By understanding these usage patterns, the marketing team aims to develop strategies to convert “Customer” riders into long-term members.
#### Key Stakeholders: Head of Marketing.

### **2. Prepare**
#### **Data Sourcing:** 
Utilized 5 quarterly datasets (2019 q1 - 2020 q1) totaling 4.3M+ rows.
#### **Data Storage:** 
A tiered strategy in MS SQL Server was used to ensure integrity:
- Bronze Layer: House immutable raw CSV imports as a “Single Source of Truth”.
- Silver Layer: Contains processed datasets (remove duplicate, error data, add new column ….)
- Gold Layer: Contains cleaned, validated and unified dataset for staged analysis\
**Data Flow Diagram**\
  <img width="801" height="441" alt="Data Flow Diagram drawio" src="https://github.com/user-attachments/assets/9bbc8bc7-fa7a-425f-8196-1a4338f5649a" /> \
**Check Data integrity**\
### **3. Process (Data Engineering & Cleaning)**
#### **A. Bronze to Silver:**
  Data was transformated to silver layer after it was processed. The activities processed data: 
##### **Data Standardization & Schema Alignment**
  - Categorical Synchronization: Updated user_type labels in the 2020_q1 table to matcha the naming conventions of the 2019 datasets.
  - Geospatial Enrichment: Created a dim_station table from divvy_trips_2020_q1 table to facilitate for backfilling missing geospatial coordinates in 2019 table to support future route and mapping analysis.
  - Key Management: Generated a new Primary Key column based on temporal ordering, this synchronizes data type because the original primary key has INT type in 2019 dataset and VARCHAR type in 2020_Q1.
##### Feature Engineering
New derived columns were created to unlock deeper insights into rider behavior:
- Temporal Features: Extracted hour_started, hour_ended, and day_of_week to enable peak-usage and seasonality analysis.
- Unit conversion: Calculated a new trip_duration_minutes column. This resolved a formatting issue where the original seconds column commas (thousand separators), which interfered with numerical calculations.
##### Data Integrity & Noise Reduction
  I performed a targeted ‘pruning’ of the data to remove records that did not represent valid trips:
  - Deduplication: Verified and removed any duplicate ride_id entries to ensure each journey is counted exactly once.
  - Threshold Filtering: Removed 6,097 records ( 13 from 2019_q4; 6,084 from 2020_q1) where the trip duration was less than one minute. These were flagged as ‘docking errors’ rather than intentional rides.
  - Incomplete Record Handling: Dropped one record from 2020_q1 missing an end_station_name, as the lack of destination data prevents station_flow analysis.
  
#### **B. Silver to Gold:**
Consolidate multiple datasets into a unified structure for longitudinal analysis. Integrating the 2019 and 2020 datasets to use easily.
  - Performed a UNION ALL transformation to merge the quaterly tables into a single source of truth: gold.unified_divvy_trips.
  - Assigned NULL values to missing demographic fields (gender, birth_year, bikeid) in 2020 data to preserve the integrity of the 2019 demographic data.
#### End-to-End Data Pipeline & Transformation Map
<img width="3884" height="2546" alt="Data Flow Diagram" src="https://github.com/user-attachments/assets/610a7bb1-45f1-4fc7-8db7-8e44f760e533" />


### 4. Analyze & Share (Data Exploration and Visualization )
#### Key Findings & Visualization:
- **Usage Patterns:** Identified that Subscribers dominate weekday commute peaks (6–9 AM/4–6 PM), while casual riders spike on weekends, suggesting a shift from utility to recreation.\
![Hourly Ride Volume By User Type](https://github.com/user-attachments/assets/2ad2bf80-ef6f-4f3c-80b3-d000481487e2)
![Days of Week&#39;s Ride Volume By User Type](https://github.com/user-attachments/assets/c256976a-af4f-4589-8cf5-6829227523ae)
- **Duration Insights:** Casual riders averaged significantly higher trip durations, indicating "Subscriber” use the bikes for commuting (utility) while “Customer” use them for leisure.\
![Average Trip Duration (Minutes) by User Type](https://github.com/user-attachments/assets/62967fb1-2dde-4806-a5a7-f39b6b729034)

- **Seasonality:** Detected a sharp volume drop during winter, identifying a churn risk period.
  ![Ride Volume by Seasonality (Quarterly)](https://github.com/user-attachments/assets/899cadd1-f771-41c5-b93e-d08ae48a3dbe)
- **Top 10 highest ride volume station.**
![Top 10 Start Stations with highest volume of Customer Riders](https://github.com/user-attachments/assets/b6a09828-73c6-4a0b-8e1b-94cfbdd7aea0)
### 5. Act (Strategic Recommendations)
- **Targeted Geographic Marketing:** Focus efforts exclusively on the Top 10 stations most frequently by “Customer” riders. Install digital signage at these locations on weekends offering “First Month Free” trial.
- **Seasonal/Weekend Membership Tiers:** Introduce a "Summer-Only" or "Weekend-Warrior" membership. This caters to casual riders who use the service for recreation but may be intimidated by an annual commitment.
- **Incentive-Based Digital Alerts:** Utilize the mobile app to trigger "Smart Alerts". If a casual rider exceeds a certain duration (e.g., 45 minutes), send a notification showing how much they would have saved on that specific trip with a membership.
## III. Datasets and Tools used:
- Download full dataset (100MB) at [Datasets](https://github.com/Phuctran-81/bike-member-conversion-study/releases/tag/v1.0.0).
- Database: SQL Server Management Studio 21.
- Visualization: [Tableau]






