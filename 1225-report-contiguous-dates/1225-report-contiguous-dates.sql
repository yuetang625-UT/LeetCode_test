# Write your MySQL query statement below
with ect as (select fail_date day, "failed" as state, RANK() OVER (ORDER BY fail_date) AS rk FROM Failed
WHERE fail_date>='2019-01-01' and fail_date<='2019-12-31'
UNION 
select success_date day, "succeeded" as state, RANK() OVER (ORDER BY success_date) AS rk FROM Succeeded
WHERE success_date>='2019-01-01' and success_date<='2019-12-31')
SELECT state AS period_state, MIN(day) AS start_date, MAX(day) AS end_date FROM (SELECT day, rank() OVER (ORDER BY day) AS overall_ranking, 
state, rk, (RANK() OVER (ORDER BY day) - rk) AS inv FROM 
ect) c 
GROUP BY inv, state
ORDER BY start_date