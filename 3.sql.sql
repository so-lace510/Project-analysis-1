SELECT *
FROM [TASK1].[dbo].[payments_raw]

--Quarterly revenue for 2021
SELECT
  DATEPART(YEAR, paid_date) AS Revenue_year,
  DATEPART(QUARTER, paid_date) AS Revenue_quarter,
  SUM(CAST(amount AS FLOAT)) AS QuarterlyRevenue
FROM
  [TASK1].[dbo].[payments_raw]
WHERE DATEPART(YEAR, paid_date) = 2021
GROUP BY
   DATEPART(YEAR, paid_date),
   DATEPART(QUARTER, paid_date)
ORDER BY
   Revenue_year,
   Revenue_quarter;


--Quarterly revenue for 2022
SELECT
  DATEPART(YEAR, paid_date) AS Revenue_year,
  DATEPART(QUARTER, paid_date) AS Revenue_quarter,
  SUM(CAST(amount AS FLOAT)) AS QuarterlyRevenue
FROM
  [TASK1].[dbo].[payments_raw]
WHERE DATEPART(YEAR, paid_date) = 2022
GROUP BY
   DATEPART(YEAR, paid_date),
   DATEPART(QUARTER, paid_date)
ORDER BY
   Revenue_year,
   Revenue_quarter;


--Quarterly revenue for 2023
SELECT
  DATEPART(YEAR, paid_date) AS Revenue_year,
  DATEPART(QUARTER, paid_date) AS Revenue_quarter,
  SUM(CAST(amount AS FLOAT)) AS QuarterlyRevenue
FROM
  [TASK1].[dbo].[payments_raw]
WHERE DATEPART(YEAR, paid_date) = 2023
GROUP BY
   DATEPART(YEAR, paid_date),
   DATEPART(QUARTER, paid_date)
ORDER BY
   Revenue_year,
   Revenue_quarter;



--Quarterly revenue for 2024
SELECT
  DATEPART(YEAR, paid_date) AS Revenue_year,
  DATEPART(QUARTER, paid_date) AS Revenue_quarter,
  SUM(CAST(amount AS FLOAT)) AS QuarterlyRevenue
FROM
  [TASK1].[dbo].[payments_raw]
WHERE DATEPART(YEAR, paid_date) = 2024
GROUP BY
   DATEPART(YEAR, paid_date),
   DATEPART(QUARTER, paid_date)
ORDER BY
   Revenue_year,
   Revenue_quarter;


--We can say that the fourth quarter has the highest YOY growth