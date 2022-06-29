# Write your MySQL query statement below
SELECT student_id, student_name, subject_name, IFNULL(attended_exams,0) attended_exams FROM Students
CROSS JOIN Subjects
LEFT JOIN (SELECT student_id, subject_name,COUNT(subject_name) attended_exams FROM Examinations 
          GROUP BY student_id,subject_name) AS T USING(student_id, subject_name)
ORDER BY student_id,subject_name