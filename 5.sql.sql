SELECT *
FROM [TASK1].[dbo].[rides_raw]
WHERE status = 'cancelled'

SELECT
    dropoff_city,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_rides,
    (SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*)) AS cancellation_rate_percent
FROM [TASK1].[dbo].[rides_raw]
GROUP BY dropoff_city
ORDER BY cancellation_rate_percent DESC;