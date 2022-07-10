# Write your MySQL query statement below
WITH T as (SELECT transaction_id,amount ,DATE(day) dtime FROM Transactions)
SELECT transaction_id FROM (SELECT transaction_id, rank() over (partition by dtime order by amount DESC) r FROM T) T2
WHERE r=1 ORDER BY 1