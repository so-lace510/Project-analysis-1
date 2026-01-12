-- This query is to find the top 10 longest ride
SELECT 
    B.method,
	C.name,
    A.pickup_city,
	A.distance_km,
    A.dropoff_city,
    D.name
FROM 
  [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
  [TASK1].[dbo].[payments_raw] AS B ON A.ride_id = B.ride_id
LEFT JOIN
  [TASK1].[dbo].[riders_raw] AS C ON A.rider_id = C.rider_id
LEFT JOIN
  [TASK1].[dbo].[drivers_raw] AS D ON A.driver_id = D.driver_id

-- CAST is used to change the datatype to float

ORDER BY CAST (distance_km AS FLOAT) DESC

-- This gives the top 10 longest rides