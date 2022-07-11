# Write your MySQL query statement below
with recursive cte as
(
select employee_id from employees where manager_id=1 and employee_id!=1
union all
select a.employee_id from employees a join cte b on (b.employee_id=a.manager_id) 
)
select employee_id from cte