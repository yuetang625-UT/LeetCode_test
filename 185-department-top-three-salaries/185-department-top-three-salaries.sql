# Write your MySQL query statement below
WITH ect AS(SELECT Department.name Department, Employee.name Employee, Salary, dense_rank() over (partition by departmentId ORDER BY salary DESC) r FROM Employee JOIN Department ON Employee.departmentId=Department.id)
SELECT Department, Employee, Salary FROM ect 
WHERE r<=3