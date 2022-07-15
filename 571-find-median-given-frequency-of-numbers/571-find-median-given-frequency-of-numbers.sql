# Write your MySQL query statement below
with t as (select *, sum(frequency) over(order by num) freq, (sum(frequency) over())/2 median_num
           from numbers)
select avg(num) as median
from t
where median_num between (freq-frequency) and freq