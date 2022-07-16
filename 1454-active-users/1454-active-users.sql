# Write your MySQL query statement below
WITH ECT AS(SELECT l1.id FROM Logins l1, Logins l2 
WHERE l1.id=l2.id AND 
DATEDIFF(l1.login_date,l2.login_date) between 1 and 4
GROUP BY l1.id, l1.login_date
HAVING COUNT(DISTINCT l2.login_date)>=4)
SELECT * FROM Accounts 
WHERE id in (SELECT id FROM ECT)
ORDER BY id

