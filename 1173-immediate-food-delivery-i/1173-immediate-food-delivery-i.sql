# Write your MySQL query statement below
SELECT round(sum(if(order_date=customer_pref_delivery_date,1,0))/count(delivery_id)*100,2) immediate_percentage FROM Delivery