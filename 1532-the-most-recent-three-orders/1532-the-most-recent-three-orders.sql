# Write your MySQL query statement below
SELECT customer_name, customer_id, order_id, order_date FROM (SELECT name customer_name, customer_id, order_id,order_date, rank() over (partition by customer_id order by order_date DESC) r FROM Customers JOIN Orders USING(customer_id)) T WHERE r<=3 ORDER BY customer_name, customer_id, order_date DESC
