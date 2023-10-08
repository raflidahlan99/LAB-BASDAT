USE classicmodels;
SELECT * FROM customers 
SELECT * FROM products
SELECT * FROM orderdetails
SELECT * FROM orders
SELECT * FROM payments
-- 1
SELECT c.customerName 'Nama Customer', c.country 'Negara', p.paymentDate 'Tanggal'
FROM customers c
JOIN payments p 
ON c.customerNumber = p.customerNumber
WHERE paymentDate > '2004-12-31'
ORDER BY paymentDate ;

-- 2
SELECT DISTINCT c.customerName, p.productname, pl.TextDescription
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails o2 ON o.orderNumber = o2.orderNumber
JOIN products p ON o2.productCode = p.productCode
JOIN productLines pl ON p.productLine = pl.productLine
WHERE p.productName = 'The Titanic' 

-- 3
ALTER TABLE products 
ADD `status` VARCHAR (20);

SELECT * FROM orderdetails
ORDER BY quantityOrdered DESC;

UPDATE products
SET `status` = 'best selling'
WHERE productCode = 'S12_4675'

SELECT p.productCode, p.productName, o2.quantityOrdered, p.`status`
FROM products p
JOIN orderdetails o2
ON o2.productCode = p.productCode 
ORDER BY quantityOrdered DESC 
LIMIT 1; 

-- 4
SELECT * FROM customers;
SELECT * FROM orders
WHERE status = 'cancelled';
SELECT * FROM orderdetails;

ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_1;
ALTER TABLE orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE;

DELETE FROM orders
WHERE status = 'cancelled';

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE orders ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1;
ALTER TABLE payments ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

DELETE customers FROM customers
JOIN orders
USING (customerNumber)
WHERE STATUS = 'cancelled';

SET FOREIGN_key_checks = 1

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices WHERE country = 'japan';

SELECT c.customerName, c.country, e.firstName, o.country AS 'Negara employee'
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices o
USING (officeCode)
WHERE o.country = 'japan';