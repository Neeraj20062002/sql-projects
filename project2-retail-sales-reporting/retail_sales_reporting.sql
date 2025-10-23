CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATETIME,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Smartphone', 'Electronics', 500.00),
(3, 'Headphones', 'Accessories', 150.00),
(4, 'Mouse', 'Accessories', 25.00);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
(1, 'John', 'Doe', 'johndoe@email.com'),
(2, 'Jane', 'Smith', 'janesmith@email.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@email.com');

INSERT INTO Sales (SalesID, ProductID, CustomerID, SaleDate, Quantity)
VALUES
(1, 1, 1, '2023-08-01', 2),
(2, 2, 2, '2023-08-02', 1),
(3, 3, 1, '2023-08-03', 3),
(4, 4, 3, '2023-08-04', 4),
(5, 1, 3, '2023-08-05', 1);

SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Sales;

SELECT CustomerID, FirstName, LastName, Email FROM Customers;

SELECT
s.SalesID,
p.ProductName,
c.FirstName,
c.LastName,
s.Quantity,
s.TotalAmount
FROM
Sales s
INNER JOIN
Products p ON s.ProductID = p.ProductID
INNER JOIN
Customers c ON s.CustomerID = c.CustomerID
ORDER BY
s.SaleDate;

SELECT
p.ProductName,
SUM(s.TotalAmount) AS TotalSales
FROM
Sales s
INNER JOIN
Products p ON s.ProductID = p.ProductID
GROUP BY
p.ProductName
ORDER BY
TotalSales DESC;

SELECT
c.FirstName,
c.LastName,
COUNT(s.SalesID) AS NumberOfPurchases
FROM
Sales s
INNER JOIN
Customers c ON s.CustomerID = c.CustomerID
GROUP BY
c.FirstName, c.LastName
ORDER BY
NumberOfPurchases DESC;

SELECT
ProductName
FROM
Products
WHERE
ProductID IN (
SELECT ProductID
FROM Sales
GROUP BY ProductID
HAVING SUM(TotalAmount) > 1000
);

SELECT
p.ProductName,
COUNT(s.SalesID) AS SalesCount
FROM
Sales s
INNER JOIN
Products p ON s.ProductID = p.ProductID
GROUP BY
p.ProductName
HAVING
COUNT(s.SalesID) > 5
ORDER BY
SalesCount DESC;

SELECT
s.SalesID,
p.ProductName,
c.FirstName,
c.LastName,
s.Quantity,
s.TotalAmount
FROM
Sales s
INNER JOIN
Products p ON s.ProductID = p.ProductID
INNER JOIN
Customers c ON s.CustomerID = c.CustomerID
ORDER BY
s.SaleDate
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT
p.Category,
COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
SUM(s.TotalAmount) AS TotalSales,
MAX(p.ProductName) AS TopSellingProduct
FROM
Sales s
INNER JOIN
Products p ON s.ProductID = p.ProductID
INNER JOIN
Customers c ON s.CustomerID = c.CustomerID
GROUP BY
p.Category
ORDER BY
TotalSales DESC;


