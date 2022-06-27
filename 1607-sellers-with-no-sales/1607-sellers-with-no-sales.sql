# Write your MySQL query statement below
SELECT seller_name FROM Seller 
WHERE seller_id not in (SELECT seller_id FROM Customer LEFT JOIN Orders USING(customer_id)
WHERE sale_date>'2020-01-01' AND sale_date<'2020-12-31') 
ORDER BY seller_name