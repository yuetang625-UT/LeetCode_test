# Write your MySQL query statement below
SELECT date_format(trans_date,'%Y-%m') month, country, count(amount) trans_count, 
sum(if(state='approved',1,0)) approved_count, sum(amount) trans_total_amount, sum(if(state='approved',amount,0)) approved_total_amount FROM Transactions
GROUP BY month,country