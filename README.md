# Behavioral Analysis & Strategic Growth: Cyclistic Member Conversion
## Overall
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
Delivered 3 actionable growth: \
- **"Weekend-Warrior" Membership:** This caters to casual riders who use the service for recreation but may be intimidated by an annual commitment.\
- **Hyper-Local Marketing:** Geographic-targeted digital signage at the Top 10 high-volume casual stations.\
- **Incentive-Based Digital Alerts:** Utilize the mobile app to trigger "Smart Alerts". If a casual rider exceeds a certain duration (e.g., 45 minutes), send a notification showing how much they would have saved on that specific trip with a membership.
## The deep dive
This project followed by the six stage of analysis process\
**1. Ask**\
   Business Object: Identify behavioral differences between casual riders "Customer" and members "Subscriber" to convert Customer to Subscriber.\
**2. Prepare**\
   **Data Sourcing:** Utilized 5 quarterly datasets (2019 q1 - 2020 q1) totaling 4.3M+ rows.\
   **Data Storage:** A tiered strategy in MS SQL Server was used to ensure integrity:
- Bronze Layer: House immutable raw CSV imports as a “Single Source of Truth”.
- Silver Layer: Contains processed datasets (remove duplicate, error data, add new column ….)
- Gold Layer: Contains cleaned, validated and unified dataset for staged analysis\
**Data Flow Diagram**\
  <img width="801" height="441" alt="Data Flow Diagram drawio" src="https://github.com/user-attachments/assets/9bbc8bc7-fa7a-425f-8196-1a4338f5649a" />
**Check Data integrity**
3. Process
  **Bronze to Silver:**
  ....
  - Created a dim_station table to facilitate for backfilling missing geospatial coordinates in 2019 table.\
  **Silver to Gold:**
  - Performed a UNION ALL transformation to merge the quaterly tables into a single source of truth: gold.unified_divvy_trips.
  - Assigned NULL values to missing demographic fields (gender, birth_year) in 2020 data to prevent statistical skew.
  


<img width="1772" height="784" alt="Data Schema Diagram drawio" src="https://github.com/user-attachments/assets/14036459-3e59-4232-b665-e5bc124a8952" />
