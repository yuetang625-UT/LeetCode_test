# Write your MySQL query statement below
WITH score_t AS (SELECT exam_id, max(score) maxs, min(score) mins FROM Exam
GROUP BY exam_id)
SELECT * FROM (SELECT * FROM Student 
WHERE student_id in (select DISTINCT student_id FROM Exam)) T1
WHERE student_id not in (SELECT DISTINCT student_id FROM Exam JOIN score_t USING(exam_id)
WHERE score=maxs or score=mins)
