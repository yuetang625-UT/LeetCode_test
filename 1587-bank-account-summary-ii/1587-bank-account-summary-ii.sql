# Write your MySQL query statement below
SELECT name, SUM(amount) AS balance FROM Users 
LEFT JOIN Transactions USING (account)
GROUP BY name
HAVING balance > 10000