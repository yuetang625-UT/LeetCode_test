# Write your MySQL query statement below
SELECT p2.id p1,p1.id p2,
(abs(p1.x_value-p2.x_value)*abs(p1.y_value-p2.y_value)) area
FROM Points p1 CROSS JOIN Points p2 
GROUP BY if(p1.id<p2.id,p1.id,p2.id), if(p1.id<p2.id,p2.id,p1.id)
HAVING area !=0
ORDER BY area DESC, p1, p2


