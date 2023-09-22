-- nomor 1
SELECT customerName, city, country
FROM customers
WHERE country ='USA';

-- nomor 2
SELECT DISTINCT productScale, productLine 
FROM products;

-- nomor 3
SELECT customerNumber,checkNumber, paymentDate,Amount
FROM payments
ORDER BY paymentDate DESC;

-- nomor 4
SELECT productname AS "nama produk", buyprice AS "harga beli", quantityinstock AS "jumlah dalam stock"
FROM products
WHERE quantityinstock > 1000 AND quantityinstock < 3000
ORDER BY buyprice 
LIMIT 5, 10;

-- nomor 5
SELECT contactLastName, contactFirstName, country, creditLimit
FROM customers
WHERE creditLimit <100000 AND (country = 'Japan'OR country='USA' OR country=  'Australia')


