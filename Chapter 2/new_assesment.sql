-- A. Show all data in each of the tables
SELECT * FROM CUSTOMER;
SELECT * FROM INVOICE;
SELECT * FROM INVOICE_ITEM;

-- B. List the LastName, FirstName, and Phone of all customers
SELECT LastName, FirstName, Phone
FROM CUSTOMER;

-- C. List the LastName, FirstName, and Phone for all customers with a FirstName of ‘Nikki’
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = 'Nikki';

-- D. List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00
SELECT c.LastName, c.FirstName, c.Phone, i.DateIn, i.DateOut
FROM CUSTOMER c, INVOICE i
WHERE c.CustomerID = i.CustomerID
  AND i.TotalAmount > 100.00;

-- E. List the LastName, FirstName, and Phone of all customers whose first name starts with ‘B’
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName LIKE 'B%';

-- F. List the LastName, FirstName, and Phone of all customers whose last name includes the characters ‘cat’
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE '%cat%';

-- G. List the LastName, FirstName, and Phone for all customers whose second and third digits (from the left) of their phone number are 23
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE Phone LIKE '_23%';

-- H. Determine the maximum and minimum TotalAmount
SELECT MAX(TotalAmount) AS MaxAmount,
       MIN(TotalAmount) AS MinAmount
FROM INVOICE;

-- I. Determine the average TotalAmount
SELECT AVG(TotalAmount) AS AvgAmount
FROM INVOICE;

-- J. Count the number of customers
SELECT COUNT(*) AS TotalCustomers
FROM CUSTOMER;

-- K. Group customers by LastName and then by FirstName
SELECT LastName, FirstName
FROM CUSTOMER
ORDER BY LastName, FirstName;

-- L. Count the number of customers having each combination of LastName and FirstName
SELECT LastName, FirstName, COUNT(*) AS CountPerName
FROM CUSTOMER
GROUP BY LastName, FirstName;

-- M. Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a subquery. Present results sorted by LastName ASC and FirstName DESC
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN (
    SELECT CustomerID
    FROM INVOICE
    WHERE TotalAmount > 100.00
)
ORDER BY LastName ASC, FirstName DESC;

-- N. Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName ASC and FirstName DESC
SELECT c.LastName, c.FirstName, c.Phone
FROM CUSTOMER c, INVOICE i
WHERE c.CustomerID = i.CustomerID
  AND i.TotalAmount > 100.00
ORDER BY c.LastName ASC, c.FirstName DESC;

-- O. Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use JOIN ON syntax. Present results sorted by LastName ASC and FirstName DESC
SELECT c.LastName, c.FirstName, c.Phone
FROM CUSTOMER c
JOIN INVOICE i ON c.CustomerID = i.CustomerID
WHERE i.TotalAmount > 100.00
ORDER BY c.LastName ASC, c.FirstName DESC;

-- P. Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ‘Dress Shirt’. Use a subquery. Present results sorted by LastName ASC and FirstName DESC
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN (
    SELECT i.CustomerID
    FROM INVOICE i
    WHERE i.InvoiceNumber IN (
        SELECT InvoiceNumber
        FROM INVOICE_ITEM
        WHERE Item = 'Dress Shirt'
    )
)
ORDER BY LastName ASC, FirstName DESC;

-- Q. Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ‘Dress Shirt’. Use a join without JOIN ON syntax
SELECT DISTINCT c.LastName, c.FirstName, c.Phone
FROM CUSTOMER c, INVOICE i, INVOICE_ITEM ii
WHERE c.CustomerID = i.CustomerID
  AND i.InvoiceNumber = ii.InvoiceNumber
  AND ii.Item = 'Dress Shirt'
ORDER BY c.LastName ASC, c.FirstName DESC;

-- R. Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ‘Dress Shirt’. Use JOIN ON syntax
SELECT DISTINCT c.LastName, c.FirstName, c.Phone
FROM CUSTOMER c
JOIN INVOICE i ON c.CustomerID = i.CustomerID
JOIN INVOICE_ITEM ii ON i.InvoiceNumber = ii.InvoiceNumber
WHERE ii.Item = 'Dress Shirt'
ORDER BY c.LastName ASC, c.FirstName DESC;

-- S. Who referred each customer to Marcia’s Dry Cleaning? Include customers not referred by anyone
SELECT 
    c.LastName AS CustomerLastName,
    c.FirstName AS CustomerFirstName,
    r.LastName AS ReferredByLastName,
    r.FirstName AS ReferredByFirstName
FROM CUSTOMER c
LEFT JOIN CUSTOMER r
ON c.ReferredBy = r.CustomerID;

-- T. Show customers who had an order with ‘Dress Shirt’ using JOIN ON + subquery
SELECT DISTINCT c.LastName, c.FirstName, c.Phone
FROM CUSTOMER c
JOIN INVOICE i ON c.CustomerID = i.CustomerID
WHERE i.InvoiceNumber IN (
    SELECT InvoiceNumber
    FROM INVOICE_ITEM
    WHERE Item = 'Dress Shirt'
)
ORDER BY c.LastName ASC, c.FirstName DESC;

-- U. Show all customers and orders with Dress Shirt, include all other customers as well
SELECT 
    c.LastName,
    c.FirstName,
    c.Phone,
    i.TotalAmount
FROM CUSTOMER c
LEFT JOIN INVOICE i
ON c.CustomerID = i.CustomerID
AND i.InvoiceNumber IN (
    SELECT InvoiceNumber
    FROM INVOICE_ITEM
    WHERE Item = 'Dress Shirt'
)
ORDER BY i.TotalAmount ASC, c.LastName ASC, c.FirstName DESC;