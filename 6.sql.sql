SELECT *
FROM [TASK1].[dbo].[rides_raw]

SELECT *
FROM [TASK1].[dbo].[payments_raw]



SELECT 
    A.request_time,
	A.pickup_time,
    A.pickup_city,
	A.distance_km,
    A.dropoff_city,
	A.rider_id,
    B.method,
	B.payment_id
FROM 
  [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
  [TASK1].[dbo].[payments_raw] AS B ON A.ride_id = B.ride_id


 SELECT 
    rider_id,
    COUNT(*) AS total_rides
FROM 
   [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
  [TASK1].[dbo].[payments_raw] AS B ON A.ride_id = B.ride_id
WHERE method != 'cash' 
GROUP BY 
    rider_id
	HAVING
	  COUNT(*) >10
ORDER BY 
    total_rides DESC;

