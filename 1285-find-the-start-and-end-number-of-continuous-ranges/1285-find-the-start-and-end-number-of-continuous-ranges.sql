# Write your MySQL query statement below
SELECT min(log_id) start_id, max(log_id) end_id FROM (SELECT log_id, row_number() over (order by log_id) as rn from logs) T GROUP BY log_id-rn