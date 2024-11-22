USE ev_project1;

/* 1.TOTAL NUMBER OF ELECTRIC VEHICLES */
SELECT COUNT (*) AS Total_EVs
FROM Electric_vehicle;


/* 2.TYPE OF ELECTRIC VEHICLES */
SELECT DISTINCT Electric_Vehicle_Type
FROM Electric_vehicle;


/* 3.TOP 10 POPULAR CAR MAKES */
SELECT TOP 10 Make, COUNT(*) AS Count
FROM Electric_vehicle
GROUP BY Make
ORDER BY COUNT Desc;


/* 4.TOP 5 STATES WITH HIGHEST NUMBER OF EVs */
SELECT TOP 5 State, COUNT(*) AS Count
FROM Electric_vehicle
GROUP BY State
ORDER BY count Desc;

/*  */

/* 5.Average range of EVs by make and model*/
SELECT Make, Model, AVG(Electric_Range) AS Avg_Range
FROM Electric_vehicle
GROUP BY Make, Model
ORDER BY Avg_Range DESC;


/* 6. Ranking models by electric range*/
SELECT Make, Model, Electric_Range,
		DENSE_RANK() OVER (ORDER BY Electric_Range DESC) AS Rank
FROM Electric_vehicle;


/* 7. Cumulative sum of EVs registered over time */
SELECT Model_Year, COUNT(*) AS Count,
	SUM(COUNT(*)) OVER (ORDER BY Model_Year) AS Cumulative_Count
FROM Electric_vehicle
GROUP BY Model_Year;


/* 8.Categorising EVs by range*/
SELECT *,
		CASE
			WHEN Electric_Range < 150 THEN 'Short Range'
			WHEN Electric_Range BETWEEN 150 AND 250 THEN 'Medium Range'
			ELSE 'Long Range'
		END AS Range_Category
FROM Electric_vehicle;


/* 9. Conditional aggregation: Count of BEV and PHEV vehicles*/
SELECT 
	SUM( CASE WHEN Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)' THEN 1 ELSE 0 END) AS BEV_Count,
	SUM( CASE WHEN Electric_Vehicle_Type = 'Plug-in Hybrid Electric Vehicle (PHEV)' THEN 1 ELSE 0 END) AS PHEV_Count
FROM Electric_vehicle;


/* 10. Percentage of EVs in each range category*/
SELECT Range_Category, COUNT(*) AS Vehicle_Count, COUNT(*)/SUM(COUNT(*)) OVER () AS Percentage
FROM (	SELECT *,
		CASE
			WHEN Electric_Range < 150 THEN 'Short Range'
			WHEN Electric_Range BETWEEN 150 AND 250 THEN 'Medium Range'
			ELSE 'Long Range'
		END AS Range_Category
		FROM Electric_vehicle 
	 ) AS VehicleCategory
GROUP BY Range_Category;


/* 11. Most popular model in each state*/
WITH RankedModels AS (
  SELECT
    State, Make, Model,
    COUNT(*) AS ModelCount,
    RANK() OVER (PARTITION BY State ORDER BY COUNT(*) DESC) AS ModelRank
  FROM Electric_vehicle
  GROUP BY State, Make, Model
)
SELECT
  State,Make, Model, ModelCount
FROM RankedModels
WHERE ModelRank = 1;