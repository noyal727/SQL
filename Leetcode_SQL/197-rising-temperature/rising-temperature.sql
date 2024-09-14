# Write your MySQL query statement below
-- with previousTemp as (select id,recordDate,temperature, LAG(temperature,1, temperature)OVER (
-- 	ORDER BY id ) AS previous_Temp from Weather )
-- select id from previousTemp where  temperature >previous_Temp;
SELECT id
FROM (
    SELECT id, recordDate, temperature, 
           LAG(recordDate, 1) OVER (ORDER BY recordDate) AS prev_date,
           LAG(temperature, 1) OVER (ORDER BY recordDate) AS prev_temperature
    FROM Weather
) t
WHERE prev_date = recordDate - INTERVAL 1 DAY
AND temperature > prev_temperature;
