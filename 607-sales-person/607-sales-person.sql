# Write your MySQL query statement below

SELECT SalesPerson.name FROM SalesPerson WHERE SalesPerson.sales_id NOT IN 
(SELECT sales_id FROM Orders LEFT JOIN Company USING(com_id)
WHERE name ='RED') 