# Write your MySQL query statement below
SELECT max(num) num FROM (SELECT num, COUNT(num) num_time  FROM MyNumbers
GROUP BY num
HAVING num_time=1) AS Fin