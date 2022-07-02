# Write your MySQL query statement below
SELECT school_id, IFNULL(score,-1) score FROM Schools LEFT JOIN (SELECT school_id, score,rank() over (partition by school_id ORDER BY score) r FROM Schools,Exam
WHERE capacity >=student_count) T USING (school_id)
WHERE r=1 or r is null