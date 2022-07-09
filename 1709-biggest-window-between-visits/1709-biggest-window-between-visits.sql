# Write your MySQL query statement below
SELECT user_id, max(diff) biggest_window FROM (SELECT user_id,DATEDIFF(LEAD(visit_date,1,'2021-1-1') over (partition by user_id order by visit_date), visit_date) diff FROM UserVisits) T
GROUP BY user_id
ORDER BY user_id