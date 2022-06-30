# Write your MySQL query statement below
SELECT (CASE WHEN MOD(id,2)!=0 AND total != id  THEN id+1
       WHEN MOD(id,2)!=0 AND total = id  THEN id
        ELSE id-1
        END) AS id, student FROM Seat,
(SELECT COUNT(id) total FROM Seat) Seat_count
ORDER BY id