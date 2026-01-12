SELECT *
FROM [TASK1].[dbo].[rides_raw]

SELECT *
FROM [TASK1].[dbo].[riders_raw]

SELECT *
FROM [TASK1].[dbo].[payments_raw]

SELECT *
FROM [TASK1].[dbo].[drivers_raw]

SELECT
    p.driver_id,
    COUNT(*) AS total_completed_rides,
    AVG(rating) AS avg_rating,
    (SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*)) * 100 AS cancellation_rate,
    SUM(CAST(fare AS FLOAT)) AS total_revenue
 FROM [TASK1].[dbo].[rides_raw] AS r
    LEFT JOIN [TASK1].[dbo].[drivers_raw] AS p
        ON r.driver_id = p.driver_id
GROUP BY p.driver_id
HAVING 
    COUNT(*) >= 30
    AND AVG(rating) >= 4.5
    AND ((SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*))) * 100 < 5
ORDER BY total_revenue DESC;