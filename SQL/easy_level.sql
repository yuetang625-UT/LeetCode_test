problem with * is worth to check more times


####No.595 (amazon,adobe,google)
SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >=25000000;

####No.1757 (facebook)
SELECT product_id FROM Products
WHERE low_fats='Y' AND recyclable='Y';

*####No.584
SELECT name FROM Customer
WHERE NOT referee_id=2 OR referee_id IS NULL;
(WHERE referee_id<>2)

*####No.183
method1
SELECT name AS Customers FROM Customers LEFT JOIN Orders ON Customers.id=Orders.customerID
WHERE Orders.customerID IS NULL
method2
SELECT Customers.name AS 'Customers'
FROM Customers
WHERE Customers.id NOT IN
(SELECT customerID from Orders)

*####No.1873  IF(condition, value_if_true, value_if_false)
method1
SELECT employee_id,
CASE 
    WHEN employee_id%2!=0 AND name NOT LIKE 'M%' THEN salary
    ELSE 0
END AS bonus FROM Employees
ORDER BY employee_id;
method2 faster
SELECT employee_id,
IF (employee_id%2 != 0  AND name NOT LIKE 'M%', salary, 0) AS bonus
FROM Employees ORDER BY employee_id;

*####No.627(amazon, apple)
method1
UPDATE Salary SET sex=
CASE WHEN sex='f' THEN 'm'
    ELSE 'f'
END;
method2 faster
UPDATE Salary SET sex=if(sex='m',f,m);

*####No.196(amazon, facebook, uber)
DELETE p1 FROM Person p1,Person p2
WHERE p1.email=p2.email AND p1.id>p2.id;

*####No.1667
SELECT user_id, CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2))) AS
name FROM Users ORDER BY user_id;

*####No.1484 (adobe)
SELECT sell_data, COUNT(DISTINCT(product)) AS num_sold, GROUP_CONCAT(DISTINCT(product))
FROM Activities GROUP BY sell_date ORDER BY sell_date;


####No.1527 (% represents zero or more characters)
SELECT * FROM Patients
WHERE conditions LIKE 'DIAB1%' OR LIKE '% DIAB%';

####No.1965
SELECT employee_id FROM Employees LEFT JOIN Salaries USING (employee_id)
WHERE salary IS NULL
UNION
SELECT employee_id FROM Employees RIGHT JOIN Salaries USING (employee_id)
WHERE name IS NULL
ORDER BY employee_id
method2 is faster, union then condition
SELECT employee_id FROM
(SELECT * FROM  Employees 
LEFT JOIN Salaries USING (employee_id)
UNION
SELECT * FROM  Employees
RIGHT JOIN Salaries USING (employee_id))
AS Combine
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id;

*####No.1795 (Amazon) Good union case
SELECT product_id, 'store1' AS store, store1 AS price FROM Products WHERE store1 IS NOT NULL
UNION
SELECT product_id, 'store2' AS store, store2 AS price FROM Products WHERE store2 IS NOT NULL
UNION
SELECT product_id, 'store3' AS store, store3 AS price FROM Products WHERE store3 IS NOT NULL

*####No.608 (Uber, Amazon, Twitter)
SELECT id, CASE WHEN p_id IS NULL THEN 'Root'
    WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
    ELSE 'Leaf'
    END AS type FROM Tree
ORDER BY id

*####No.176 (Amazon, Infosys, Apple) select twice for none record
SELECT (SELECT DISTINCT salary FROM Employee
ORDER BY salary DESC
LIMIT 1, OFFSET 1) AS SecondHighestSalary

####No.175 (apple)
SELECT firstName, lastName, city, state FROM Person
LEFT JOIN Address On Person.personId=Addrdss.personId

####No.1581 (nerdwallet)
SELECT customer_id, COUNT(customer_id) AS count_no_trans FROM Visits
LEFT JOIN Transactions On Visits.visit_id=Transactions.visit_id
WHERE amount IS NULL
GROUP BY customer_id

####No.1148 (LinkedIn)
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id=viewer_id
ORDER BY id

*####No.197 (Adobe) (date difference)
SELECT Weather.id AS id FROM Weather JOIN Weather w
ON datediff(Weather.recordDate, w.recordDate) =1 
WHERE Weather.temperature > w.temperature

***####No.607 (Amazon) when there is a null value, try not in instead of equal 
SELECT SalesPerson.name FROM SalesPerson 
WHERE SalesPerson.sales_id NOT IN
(SELECT Orders.sales_id FROM Orders LEFT JOIN Company USING (com_id) 
WHERE name LIKE 'RED')

####No.1141 (Facebook)
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users FROM Activity
WHERE activity_date <= '2019-07-27' AND activity_date > '2019-06-27'
GROUP BY activity_date;

####No.1693
SELECT date_id, make_name, COUNT(DISTINCT lead_id) AS unique_leads, COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id,make_name

####No.1729 (Tesla)
SELECT user_id, COUNT(follower_id) AS followers_count FROM Followers
GROUP BY user_id
ORDER BY user_id

####No.586 (Google)
SELECT customer_number FROM (SELECT customer_number, COUNT(order_number) AS order_counts FROM Orders
GROUP BY customer_number
ORDER BY order_counts DESC
LIMIT 1) AS Tmp

SELECT customer_number FROM (SELECT COUNT(order_number) AS total, customer_number FROM Orders
GROUP BY customer_number) AS Summary
ORDER BY total DESC
LIMIT 1;

####No.511 (Amazon)
SELECT player_id, min(event_data) AS first_login FROM Activity
GROUP BY player_id

####No.1890 max/min also works for time
select user_id, max(time_stamp) AS last_stamp FROM logins
WHERE time_stamp >= '2020-01-01' AND time_stamp <= '2020-12-31'
GROUP BY user_id

####No.1741 (Amazon)
SELECT event_day AS day, emp_id, sum(out_time-in_time) AS total_time
FROM Employees
GROUP BY day, emp_id

*####No.1383 (robinhood)
SELECT stock_name, SUM(CASE
WHEN operation='Buy' THEN -price
WHEN operation='Sell' THEN +price
END) AS capital_gain_loss FROM Stocks
GROUP BY stock_name

*####No.1407 (point72) different people might have same name, group by users.id
SELECT name, IFNULL(SUM(distance),0) AS travelled_distance FROM Users
LEFT JOIN Rides ON Users.id=Rides.user_id
GROUP BY Users.id
ORDER BY travelled_distance DESC, name

*####No.1158 poshmark
SELECT Users.user_id AS buyer_id, join_date, IFNULL(COUNT(order_id),0) AS orders_in_2019
FROM Users LEFT JOIN (SELECT * FROM Orders 
WHERE order_date >='2019-01-01' AND order_date <='2019-12-31') AS Order2019
ON Users.user_id=Order2019.buyer_id
GROUP BY user_id

SELECT user_id AS buyer_id,join_date, IFNULL(orders_in_2019,0) AS orders_in_2019  FROM Users LEFT JOIN
(SELECT buyer_id, COUNT(order_id) AS orders_in_2019 FROM Orders
WHERE order_date>='2019-01-01' AND order_date<='2019-12-31'
GROUP BY buyer_id) AS Ordercount ON Users.user_id=Ordercount.buyer_id

####No.182 if first group by, then having instead of where
SLEECT email AS Email FROM Person
GROUP BY email HAVING COUNT(email)>1

*####No.1050 (AMAZON)
SELECT actor_id, director_id FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp)>=3

####No.1587 ### using is faster
SELECT NAME, sum(amount) AS balance FROM Users
LEFT JOIN Transactions ON Users.account=Transactions.account
GROUP BY name HAVING balance>10000

SELECT name, SUM(amount) AS balance FROM Users 
LEFT JOIN Transactions USING (account)
GROUP BY name
HAVING balance > 10000

####No.1084 (Amazon)
SELECT product_id, product_name FROM Product
LEFT JOIN Sales USING (product_id)
GROUP BY product_id
HAVING min(sale_date)>='2019-01-01' AND max(sale_date)<='2019-03-31'
