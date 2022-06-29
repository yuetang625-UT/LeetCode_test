# Write your MySQL query statement below
SELECT Department.name 'Department', Employee.name 'Employee', Salary FROM Employee
JOIN Department ON Employee.DepartmentId = Department.Id 
WHERE (Employee.departmentId,Salary) IN
(SELECT departmentId , max(salary)FROM Employee GROUP BY departmentId) 

