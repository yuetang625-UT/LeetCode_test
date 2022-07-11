# Write your MySQL query statement below
WITH ect AS (SELECT username, activity, startDate, endDate , rank() over (partition by username ORDER BY startDate DESC) r FROM UserActivity) 
SELECT username,activity,startDate,endDate FROM ect
WHERE r=2
UNION 
SELECT * FROM UserActivity
GROUP BY username
HAVING count(username)=1