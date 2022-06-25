# Write your MySQL query statement below
SELECT Prices.product_id, round(sum(units*price)/sum(units),2) AS average_price FROM Prices LEFT JOIN UnitsSold
ON Prices.product_id=UnitsSold.product_id 
AND purchase_date<=end_date AND purchase_date>=start_date
GROUP BY product_id