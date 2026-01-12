SELECT *
FROM [TASK1].[dbo].[drivers_raw]

SELECT *
FROM [TASK1].[dbo].[rides_raw]




SELECT 
    A.request_time,
	A.pickup_time,
    A.pickup_city,
	A.distance_km,
    A.dropoff_city,
    B.signup_date,
	B.driver_id
FROM 
  [TASK1].[dbo].[rides_raw] AS A
LEFT JOIN
  [TASK1].[dbo].[drivers_raw] AS B ON A.driver_id = B.driver_id


	 SELECT 
    driver_id,
    AVG(rides_in_month) AS avg_monthly_rides
    FROM (
    -- STEP 1, 2 & 3: get rides per driver per month
    SELECT
        driver_id,
        FORMAT(CAST(pickup_time AS datetime), 'yyyy-MM') AS ride_month,
        COUNT(*) AS rides_in_month
    FROM  [TASK1].[dbo].[rides_raw]
    GROUP BY
        driver_id,
        FORMAT(CAST(pickup_time AS datetime), 'yyyy-MM')
          ) AS monthly_counts
      
-- STEP 4: average the monthly totals
    GROUP BY 
      driver_id;

