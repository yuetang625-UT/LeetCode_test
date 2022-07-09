# Write your MySQL query statement below
SELECT user1_id, user2_id FROM (SELECT rank() over(ORDER BY count(follower_id) DESC) r,r1.user_id user1_id, r2.user_id user2_id FROM Relations r1 JOIN Relations r2 USING (follower_id) GROUP BY r1.user_id, r2.user_id
having r1.user_id < r2.user_id) T WHERE r=1
