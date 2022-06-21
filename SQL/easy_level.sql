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