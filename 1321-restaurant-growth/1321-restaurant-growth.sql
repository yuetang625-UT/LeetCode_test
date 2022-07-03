# Write your MySQL query statement below
SELECT C1.visited_on, SUM(C2.day_sum) amount,round(avg(C2.day_sum),2) average_amount FROM (SELECT visited_on,sum(amount) day_sum FROM Customer group by visited_on) C1, (SELECT visited_on,sum(amount) day_sum FROM Customer group by visited_on) C2 
WHERE datediff(C1.visited_on,C2.visited_on) BETWEEN 0 AND 6
GROUP BY C1.visited_on
HAVING COUNT(C2.visited_on)=7

