# Write your MySQL query statement below
SELECT round(count(DISTINCT A1.player_id)/(select COUNT(DISTINCT player_id) FROM Activity),2) fraction FROM (SELECT player_id,min(event_date) mindate FROM Activity GROUP BY player_id) A1
JOIN Activity A2 ON A1.player_id=A2.player_id AND datediff(A2.event_date,A1.mindate)=1