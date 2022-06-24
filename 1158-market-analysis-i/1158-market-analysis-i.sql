# Write your MySQL query statement below
####No.1158 poshmark
SELECT Users.user_id AS buyer_id, join_date, IFNULL(COUNT(order_id),0) AS orders_in_2019
FROM Users LEFT JOIN (SELECT * FROM Orders 
WHERE order_date >='2019-01-01' AND order_date <='2019-12-31') AS Order2019
ON Users.user_id=Order2019.buyer_id
GROUP BY user_id