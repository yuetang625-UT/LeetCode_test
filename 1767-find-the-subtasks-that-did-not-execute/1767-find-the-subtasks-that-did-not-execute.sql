# Write your MySQL query statement below
WITH RECURSIVE tast_seq AS (
    SELECT * FROM Tasks 
    UNION 
    SELECT task_id, subtasks_count -1 FROM tast_seq
    WHERE subtasks_count >=2 )
SELECT tast_seq.task_id, tast_seq.subtasks_count subtask_id FROM tast_seq LEFT JOIN Executed 
ON tast_seq.task_id=Executed.task_id and tast_seq.subtasks_count=Executed.subtask_id
WHERE Executed.task_id is null
