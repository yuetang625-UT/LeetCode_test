####No.595 (amazon,adobe,google)
SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >=25000000;

####No.1757 (facebook)
SELECT product_id FROM Products
WHERE low_fats='Y' AND recyclable='Y';

####No.584
SELECT name FROM Customer
WHERE NOT referee_id=2 OR referee_id IS NULL;
(WHERE referee_id<>2)

####No.183
method1
SELECT name AS Customers FROM Customers LEFT JOIN Orders ON Customers.id=Orders.customerID
WHERE Orders.customerID IS NULL
method2
SELECT Customers.name AS 'Customers'
FROM Customers
WHERE Customers.id NOT IN
(SELECT customerID from Orders)

####1873  IF(condition, value_if_true, value_if_false)
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

####627(amazon, apple)
method1
UPDATE Salary SET sex=
CASE WHEN sex='f' THEN 'm'
    ELSE 'f'
END;
method2 faster
UPDATE Salary SET sex=if(sex='m',f,m);

####196(amazon, facebook, uber)
DELETE p1 FROM Person p1,Person p2
WHERE p1.email=p2.email AND p1.id>p2.id;






