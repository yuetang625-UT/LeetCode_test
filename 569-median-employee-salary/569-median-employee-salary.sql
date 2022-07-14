# Write your MySQL query statement below
SELECT id, company, salary FROM (SELECT id, company, salary, ROW_NUMBER() over(partition by company order by salary, id) r_a, ROW_NUMBER() over(partition by company order by salary DESC, id DESC) r_d FROM Employee) T 
WHERE r_a between r_d-1 and r_d+1

