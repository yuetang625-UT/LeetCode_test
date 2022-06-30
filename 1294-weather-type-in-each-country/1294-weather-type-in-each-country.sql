# Write your MySQL query statement below
SELECT country_name, (CASE 
                      WHEN avg(weather_state) <= 15 THEN 'Cold'
                      WHEN avg(weather_state) >=25 THEN 'Hot'
                      ELSE 'Warm'
                      END) weather_type FROM (SELECT * FROM Countries JOIN Weather USING (country_id)
WHERE Weather.day >= '2019-11-01' AND Weather.day <='2019-11-30') AS T
GROUP BY country_name