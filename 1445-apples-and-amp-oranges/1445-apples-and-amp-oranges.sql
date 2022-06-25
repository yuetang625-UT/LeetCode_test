# Write your MySQL query statement below
SELECT sale_date, sum(if(fruit='apples',sold_num,-sold_num)) diff 
FROM sales
GROUP BY sale_date