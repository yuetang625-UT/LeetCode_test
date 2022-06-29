# Write your MySQL query statement below
SELECT dept_name, COUNT(student_id) student_number FROM Student RIGHT JOIN Department USING(dept_id)
GROUP BY dept_name
ORDER BY student_number DESC, dept_name