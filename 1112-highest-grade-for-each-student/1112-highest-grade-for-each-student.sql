# Write your MySQL query statement below
SELECT student_id, course_id, grade FROM (select student_id, course_id, grade, row_number() over (partition by student_id order by grade DESC, course_id ASC) AS r
from enrollments) AS Temp
WHERE r=1;