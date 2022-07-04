# Write your MySQL query statement below
(SELECT Users.name results FROM Users JOIN MovieRating USING (user_id) GROUP BY user_id ORDER BY COUNT(movie_id) DESC,Users.name LIMIT 1)
UNION
(SELECT Movies.title results FROM Movies JOIN MovieRating USING (movie_id) WHERE created_at LIKE '2020-02%' GROUP BY Movies.title ORDER BY avg(rating) DESC ,Movies.title LIMIT 1)
