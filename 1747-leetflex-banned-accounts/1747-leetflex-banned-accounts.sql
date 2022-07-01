# Write your MySQL query statement below
select DISTINCT a.account_id from loginfo a 
inner join loginfo b 
on a.login between b.login and b.logout
WHERE a.ip_address != b.ip_address AND 
a.account_id = b.account_id