# Write your MySQL query statement below
SELECT query_name,round(SUM((rating/position))/COUNT(rating),2) quality, round(sum(if(rating<3,1,0))/COUNT(rating)*100,2) poor_query_percentage FROM Queries
GROUP BY query_name