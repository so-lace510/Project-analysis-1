-- Getting an orderly arrangement of the riders
SELECT *
FROM [TASK1].[dbo].[riders_raw]

-- CAST was used to change the datatype to datetime

ORDER BY CAST (signup_date AS datetime)

-- This was used to checked if there was a repitition of any rider_id in 2024
--Which proved that no rider who signed up in 2021 took rides in 2024

SELECT 
  rider_id,
  COUNT(rider_id) AS repeated_count
FROM 
  [TASK1].[dbo].[riders_raw]
GROUP BY
  rider_id
HAVING
  COUNT(rider_id) > 1;


  -- OR

  SELECT 
     A.request_time,
	 A.pickup_time,
	 A.dropoff_time,
     B.signup_date,
	 B.rider_id
FROM [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
     [TASK1].[dbo].[riders_raw] AS B ON A.rider_id = B.rider_id

SELECT 
     A.request_time,
	 A.pickup_time,
	 A.dropoff_time,
     B.signup_date,
     B.rider_id,
  COUNT(B.rider_id) AS repeated_count
FROM [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
     [TASK1].[dbo].[riders_raw] AS B ON A.rider_id = B.rider_id
GROUP BY
     A.request_time,
	 A.pickup_time,
	 A.dropoff_time,
     B.signup_date,
     B.rider_id
HAVING
  COUNT(B.rider_id) > 1;

