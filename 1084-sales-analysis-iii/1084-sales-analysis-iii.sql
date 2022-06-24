# Write your MySQL query statement below
SELECT product_id, product_name FROM Product
LEFT JOIN Sales USING (product_id)
GROUP BY product_id
HAVING min(sale_date)>='2019-01-01' AND max(sale_date)<='2019-03-31'