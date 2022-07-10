# Write your MySQL query statement below
with friends as (

    select user1_id as owner,
           user2_id as friend
    from friendship
    
    union
    
    select user2_id,
           user1_id
    from friendship

) select a.owner as user1_id,
       b.owner as user2_id,
       count(1) as common_friend from friends a inner join friends b on a.owner <> b.owner
                                    and a.friend = b.friend
                                    where a.owner < b.owner
   and exists (select 1 from friends c where a.owner = c.owner and b.owner = c.friend)
group by 1, 2
having count(1) >= 3