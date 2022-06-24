# Write your MySQL query statement below
SELECT NAME, sum(amount) AS balance FROM Users
LEFT JOIN Transactions ON Users.account=Transactions.account
GROUP BY name HAVING balance>10000