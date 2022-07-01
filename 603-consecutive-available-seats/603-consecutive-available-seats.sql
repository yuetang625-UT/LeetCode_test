# Write your MySQL query statement below
SELECT DISTINCT a.seat_id FROM cinema a join cinema b
on abs(a.seat_id-b.seat_id)=1
and a.free = true and b.free = true
ORDER BY a.seat_id