# Write your MySQL query statement below
SELECT contest_id, round(count(user_id)/(select count(user_name) from Users)*100,2) percentage FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
