# Write your MySQL query statement below
SELECT customer_number FROM (SELECT customer_number, COUNT(order_number) AS order_counts FROM Orders
GROUP BY customer_number
ORDER BY order_counts DESC
LIMIT 1) AS Tmp