# Write your MySQL query statement below
SELECT project_id, employee_id FROM (SELECT project_id, employee_id,rank() over(partition by project_id ORDER BY experience_years DESC) r FROM Project JOIN Employee USING(employee_id)) T
WHERE r=1