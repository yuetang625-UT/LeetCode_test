# Write your MySQL query statement below
SELECT e.left_operand,e.operator, e.right_operand, (CASE
WHEN e.operator=">" AND v1.value>v2.value then 'true'
WHEN e.operator="<" AND v1.value<v2.value then 'true'
WHEN v1.value=v2.value AND e.operator="=" then 'true'
else 'false' END) AS value FROM Expressions e JOIN Variables v1 ON e.left_operand=v1.name
JOIN Variables v2 ON e.right_operand=v2.name