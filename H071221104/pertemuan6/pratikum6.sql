/No.1/
SELECT CONCAT(e.firstName,' ', e.lastName) 'Nama Karyawan', group_concat(od.orderNumber) 'Nomor Orderan', od.quantityOrdered 'Jumlah Pesanan'
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY CONCAT(e.firstName,' ', e.lastName)
HAVING COUNT(quantityOrdered) > 10;

/No.2/
SELECT p.productCode, p.productName, p.quantityInStock, o.orderDate
FROM orders o
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE p.quantityInStock > 5000
GROUP BY p.productCode
ORDER BY o.orderDate ASC;

/No.3/
SELECT o.addressLine1, CONCAT(LEFT(o.phone, 5), '***') 'No. Telp', COUNT(DISTINCT e.employeeNumber) 'Jumlah Karyawan', COUNT(DISTINCT c.customerNumber) 'Jumlah Pelanggan', p.amount 'Rata - rata Penghasilan'
FROM offices o
JOIN employees e
USING (officeCode)
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING (customerNumber)
GROUP BY o.addressLine1
HAVING AVG(p.amount);

/No.4/
SELECT c.customerName 'Nama Customer', YEAR(o.orderDate) 'Tahun Order', MONTH(o.orderDate) 'Bulan Order', COUNT(od.orderNumber) 'Jumlah Pesanan', SUM(p.amount) 'Uang Total Penjumlahan'
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
WHERE YEAR(o.orderDate) = 2003
GROUP BY c.customerName,  YEAR(o.orderDate), MONTH(o.orderDate);

-- 5
SELECT 
	p.productLine AS 'Jenis Produk',
	count(p.quantityInStock) AS 'Banyak Produk',
	SUM((p.MSRP - p.buyPrice) * p.quantityInstock) AS 'Total Keuntungan',
	group_CONCAT(p.productName," : ",p.MSRP-p.buyprice SEPARATOR ",") AS 'Keuntungan Tiap Produk'
FROM products AS p
GROUP BY p.productLine