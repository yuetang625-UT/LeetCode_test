# Write your MySQL query statement below
SELECT product_id, ifnull(new_price,10) price FROM (SELECT product_id,new_price,row_number() over(partition by product_id ORDER BY change_date DESC) as r FROM Products
WHERE change_date<='2019-08-16') T RIGHT JOIN (SELECT DISTINCT product_id FROM Products)
AS Pid_t USING (product_id)
WHERE r=1 or r is null