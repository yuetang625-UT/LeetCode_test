CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT salary FROM (SELECT salary, dense_rank() over(ORDER BY salary DESC) r FROM Employee) T WHERE r=N
  );
END