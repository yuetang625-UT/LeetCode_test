# Write your MySQL query statement below
SELECT product_name, Products.product_id, order_id, order_date FROM Products JOIN (SELECT product_id,order_id, order_date,rank() over (partition by product_id order by order_date DESC) r FROM Customers JOIN Orders USING (customer_id)) T ON T.product_id=Products.product_id
WHERE r=1
ORDER BY product_name, Products.product_id, order_id