# Write your MySQL query statement below

SELECT Warehouse.name warehouse_name, sum(units*volume) volume FROM
Warehouse LEFT JOIN (SELECT product_id, product_name, width*length*height volume FROM Products) AS NProducts USING (product_id) 
GROUP BY Warehouse.name