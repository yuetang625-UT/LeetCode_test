# Write your MySQL query statement below
SELECT e2.name Employee FROM Employee e1 JOIN Employee e2
ON e1.id=e2.managerID AND
e2.salary > e1.salary