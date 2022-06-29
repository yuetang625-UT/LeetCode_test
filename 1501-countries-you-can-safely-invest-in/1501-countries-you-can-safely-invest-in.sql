# Write your MySQL query statement below
SELECT Country.name country FROM Country JOIN
(SELECT * FROM Person JOIN Calls ON Person.id in (Calls.caller_id,Calls.callee_id)) AS T
ON SUBSTRING(phone_number,1,3)=country_code
GROUP BY country_code
HAVING avg(duration)>(SELECT avg(duration) FROM Calls)