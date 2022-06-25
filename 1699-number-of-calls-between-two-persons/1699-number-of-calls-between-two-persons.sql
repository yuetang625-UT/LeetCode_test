# Write your MySQL query statement below
SELECT 
    CASE WHEN from_id>to_id THEN to_id
    else from_id 
    END AS person1,
    CASE WHEN from_id>to_id THEN from_id
    else to_id 
    END AS person2, COUNT(duration) AS call_count,
    sum(duration) AS total_duration FROM Calls
GROUP BY person1, person2