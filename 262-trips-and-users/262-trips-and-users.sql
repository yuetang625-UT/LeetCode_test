# Write your MySQL query statement below
SELECT request_at Day, round(sum(if(status='cancelled_by_driver' or status='cancelled_by_client',1,0))/count(status),2) 'Cancellation Rate' FROM (SELECT * FROM (SELECT * FROM Trips JOIN Users ON Users.users_id=Trips.client_id OR Users.users_id=Trips.driver_id
WHERE banned='No' AND request_at>='2013-10-01' AND request_at<='2013-10-03' ) T 
GROUP BY id HAVING count(id)=2) T1 GROUP BY request_at