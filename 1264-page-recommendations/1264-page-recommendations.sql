# Write your MySQL query statement below
SELECT DISTINCT l.page_id AS recommended_page
FROM Friendship f
INNER JOIN Likes l
ON (l.user_id = f.user2_id AND f.user1_id = 1) OR (l.user_id = f.user1_id AND f.user2_id = 1)
WHERE l.page_id NOT IN (SELECT DISTINCT page_id FROM Likes WHERE user_id = 1)