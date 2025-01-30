# Electric Vehicle Data Analysis Project

This project performs exploratory data analysis on a dataset of electric vehicles (EVs) using SQL.  The analysis covers various aspects of the EV market, including popular makes and models, range categorization, and geographic distribution.

## Project Overview

The SQL queries in this project analyze a dataset of electric vehicles to gain insights into the EV market.  The analysis focuses on:

* **Overall EV Count:** Determining the total number of electric vehicles in the dataset.
* **EV Types:** Identifying the different types of electric vehicles (e.g., BEV, PHEV).
* **Popular Makes and Models:**  Identifying the top car makes and models based on frequency.
* **Geographic Distribution:** Analyzing the distribution of EVs across different states.
* **Range Analysis:** Examining the electric range of EVs, including average range by make and model, ranking models by range, and categorizing EVs into short, medium, and long-range categories.
* **Time-Based Analysis:**  Calculating the cumulative sum of EVs registered over time.
* **Conditional Aggregation:** Counting BEV and PHEV vehicles separately.
* **Percentage Calculation:** Determining the percentage of EVs in each range category.
* **Popular Model by State:** Identifying the most popular EV model in each state.

## Dataset

The dataset used in this project is a table named `Electric_vehicle` with relevant columns such as `Make`, `Model`, `Electric_Vehicle_Type`, `State`, `Electric_Range`, and `Model_Year`. 
## SQL Queries

The `ev_analysis.sql` file contains the SQL queries used for the analysis.  The queries are designed for SQL Server syntax.  Adaptations might be needed for other SQL databases.
