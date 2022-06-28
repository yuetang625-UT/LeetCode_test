# Write your MySQL query statement below
SELECT Employee.name FROM Employee JOIN (SELECT * FROM Employee GROUP BY managerId HAVING count(managerId)>=5) AS M
ON Employee.id=M.managerID