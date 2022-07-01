# Write your MySQL query statement below
SELECT e2.reports_to employee_id,e1.name,count(e1.name) reports_count, round(avg(e2.age),0) average_age FROM Employees e1 JOIN Employees e2 
ON e1.employee_id=e2.reports_to
GROUP BY e2.reports_to
ORDER BY employee_id