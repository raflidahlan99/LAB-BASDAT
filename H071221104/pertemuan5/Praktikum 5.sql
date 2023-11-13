USE classicmodels

-- 1

SELECT c.customerName, p.productName, pa.paymentDate, o.`status`
FROM payments pa
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE p.productName LIKE '%Ferrari%' AND o.`status` = 'shipped'
AND c.customerName LIKE 'Signal%';

-- 2

-- a

SELECT c.customerName, p.paymentDate, CONCAT (e.firstName, ' ', e.lastName) AS 'Nama karyawan', p.amount
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE MONTH (p.paymentDate) = 11;

-- b

SELECT c.customerName, p.paymentDate, CONCAT (e.firstName,' ', e.lastName) AS 'Nama karyawan', p.amount
FROM payments p
JOIN customers  c
USING (customerNumber)
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE MONTH (p.paymentDate) = 11
ORDER BY p.amount DESC
LIMIT 1;

-- c

SELECT c.customerName, pr.productName
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products pr
USING (productCode)
WHERE MONTH (p.paymentDate) = 11 AND customerName LIKE ('Corporate%');

-- d

SELECT c.customerName, GROUP_CONCAT(pr.productName) AS 'Nama Produk'
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products pr
USING (productCode)
WHERE MONTH (p.paymentDate) = 11 AND customerName LIKE ('Corporate%');

-- 3

SELECT c.customerName, o.orderDate, o.shippedDate, DATEDIFF (o.shippedDate, o.orderDate) AS 'Lama Hari'
FROM customers c
JOIN orders o
USING (customerNumber)
WHERE customerName LIKE ('GiftsFor%') AND o.orderDate IS NOT  'NULL' AND o.shippedDate IS NOT  'NULL';

-- 4

USE world

SELECT * FROM country

SELECT `code`, `name`, lifeExpectancy
FROM country
WHERE `code` LIKE ('C%K') AND lifeExpectancy <> 'NULL';


-- 5 
SELECT * FROM payments;
SELECT c.customerName, SUM(p.amount), COUNT(o.orderNumber)
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o 
USING (customerNumber)
GROUP BY customerName
ORDER BY SUM(p.amount) DESC;
