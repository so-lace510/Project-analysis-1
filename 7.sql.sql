SELECT *
FROM [TASK1].[dbo].[drivers_raw]

SELECT *
FROM [TASK1].[dbo].[rides_raw]

SELECT *
FROM [TASK1].[dbo].[riders_raw]


SELECT *
FROM [TASK1].[dbo].[payments_raw]

SELECT 
  SUM(CAST(amount AS FLOAT))  AS TotalRevenue
FROM [TASK1].[dbo].[payments_raw]
WHERE CAST(paid_date AS datetime) >= '2021-06-01'
  AND CAST(paid_date AS datetime) <  '2025-01-01';

  WITH revenue_per_driver AS (
    SELECT
        driver_id,
        city,
        SUM(CAST(amount AS FLOAT)) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY f.city
            ORDER BY SUM(CAST(amount AS FLOAT)) DESC
        ) AS ranking
    FROM [TASK1].[dbo].[rides_raw] AS r
    LEFT JOIN [TASK1].[dbo].[payments_raw] AS p
        ON r.ride_id = p.ride_id
	 LEFT JOIN [TASK1].[dbo].[riders_raw] AS f
        ON r.rider_id = f.rider_id
    WHERE CAST(paid_date AS datetime)>= '2021-06-01'
      AND CAST(paid_date AS datetime)<  '2025-01-01'
    GROUP BY
        r.driver_id,
        f.city
)
SELECT
    city,
    driver_id,
    total_revenue
FROM revenue_per_driver
WHERE ranking <= 3
ORDER BY city, total_revenue DESC;