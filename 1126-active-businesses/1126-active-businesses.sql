# Write your MySQL query statement below
WITH T as(SELECT event_type, avg(occurences) avg_event FROM Events GROUP BY event_type)
SELECT business_id FROM Events JOIN T USING (event_type) 
WHERE occurences>avg_event
GROUP BY business_id
having count(distinct event_type) > 1 