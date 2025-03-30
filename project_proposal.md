# BusEquityAnalysis  
**A Spark! Project Analyzing MBTA Bus Performance and Service Equity in Boston**  

## **Project Description**  
This project analyzes MBTA bus service performance and equity in Boston, focusing on ridership trends, delays, and disparities across different routes. The Massachusetts Bay Transportation Authority (MBTA) serves over 1 million people daily, making reliable bus service crucial for accessibility and economic mobility. This analysis will explore changes in ridership, wait times, and service reliability to highlight patterns and potential areas for improvement.  

## **Key Goals**  

1. **Data Collection & Preprocessing**  
   - Gather and clean MBTA bus ridership and service reliability datasets.  
   - Standardize time formats, merge datasets, and handle missing values.  

2. **Analyze Ridership & Performance Trends**  
   - Examine ridership trends across different bus routes.  
   - Analyze average wait times and service reliability over time.  

3. **Identify Service Disparities**  
   - Compare service reliability across different neighborhoods.  
   - Assess whether certain areas experience disproportionately long wait times and analyze how these delays may disproportionately impact specific demographic groups.

4. **Data Visualization**  
   - Create time-series plots and histograms to highlight ridership patterns and delays.  
   - Use geospatial visualizations to display service disparities across neighborhoods.  

5. **Predict On-Time Performance**  
   - Train a regression model to predict the on-time percentage for each bus route in an upcoming month, based on historical arrival data.
   - Incorporate key predictors such as route number, time of day, and past delays.  

6. **Deliver a Clear & Reproducible Report**  
   - Maintain a well-documented GitHub repo with code and analysis.  
   - Summarize findings in a final report with key insights and recommendations.  

## **Data Collection**  

### **Sources**  
The following datasets will be used to analyze MBTA bus performance and equity:  
- **MBTA System-Wide Passenger Survey (2023)**: Provides ridership demographics and transit usage patterns.  
- **MBTA Bus Ridership Data**: Tracks ridership counts by route.  
- **MBTA Bus Arrival & Departure Data (2018-2024)**: Logs bus stop arrival/departure times.  
- **Census & Socioeconomic Data (Boston 2020 Census)**: Helps examine disparities in transit service.  

### **Collection Method**  
- **Public MBTA datasets** will be accessed from the agency's open data portal.  
- **Ridership and delay data** will be retrieved in CSV format for preprocessing.  
- **Data cleaning** will involve handling missing values, correcting time inconsistencies, and merging datasets for analysis.  

## **Data Modeling**  

This project will use statistical analysis and predictive modeling to assess service reliability.  

- **Trend Analysis**: Identify ridership patterns and delay trends over time.  
- **On-Time Performance Prediction**: Train a regression model (e.g., Logistic Regression, Decision Tree) to predict the on-time percentage for each bus route in an upcoming month based on historical arrival data.
- **Model Evaluation**: Assess prediction accuracy using metrics such as Mean Absolute Error (MAE) and Root Mean Squared Error (RMSE), refining the model as needed.

## **Data Visualization**  
- **Time-Series Plots**: Track ridership and wait time trends over time.  
- **Heatmaps**: Identify routes and areas with the most delays.  
- **Histograms**: Compare travel times across different routes.  
- **Geospatial Maps**: Display disparities in service levels across neighborhoods.  

## **Test Plan**  

To ensure accuracy and reliability, the project will follow a structured testing approach:  

- **Data Splitting**: Withhold 20% of past transit data for evaluating model predictions.  
- **Model Validation**: Use cross-validation to prevent overfitting.  
- **Performance Metrics**: Evaluate predictive models using MAE and RMSE.  
- **Outlier Verification**: Optionally compare flagged service anomalies to MBTA reports.  

