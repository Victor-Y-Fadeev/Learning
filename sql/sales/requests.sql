/*
SELECT COUNT(*)
FROM Employees
*/

/*
SELECT COUNT(*)
FROM Products
WHERE Price < 10
*/

/*
SELECT TOP(1) Price
FROM Products
ORDER BY Price DESC
*/

/*
SELECT TOP(1) WITH TIES Price
FROM Products
ORDER BY Price DESC
*/

/*
SELECT COUNT(Name)
FROM Products
WHERE Name LIKE 'Metal Plate%'
*/

/*
SELECT AVG(Price)
FROM Products
WHERE Name LIKE '%silver%'
*/

/*
SELECT COUNT(FirstName)
FROM Customers
WHERE FirstName LIKE 'Alicia'
*/

/*
SELECT COUNT(DISTINCT FirstName)
FROM Customers
*/

/*
SELECT COUNT(MiddleINitial)
FROM Customers
*/

/*
SELECT TOP(1) MiddleINitial
FROM Customers
GROUP BY MiddleINitial
ORDER BY COUNT(MiddleINitial) DESC
*/

/*
SELECT COUNT(*)
FROM Customers
WHERE MiddleINitial IS NULL
*/

/*
SELECT FirstName
	, COUNT(*)
FROM Customers
GROUP BY FirstName
*/

/*
SELECT FirstName
	, MiddleINitial
	, COUNT(*)
FROM Customers
GROUP BY FirstName
	, MiddleINitial
ORDER BY FirstName
*/

/*
SELECT LastName
	, COUNT(*)
FROM Employees
GROUP BY LastName
*/

/*
SELECT COUNT(*)
FROM Employees
JOIN Sales
ON Employees.EmployeeID = Sales.SalesPersONID
WHERE FirstName IN ('Ann')
*/

/*
SELECT COUNT(DISTINCT ProductID)
FROM Employees
JOIN Sales
ON Employees.EmployeeID = Sales.SalesPersONID
WHERE FirstName IN ('Ann')
*/

/*
SELECT Sales.SalesPersonID, COUNT(Sales.SalesID)
FROM Sales
GROUP BY SalesPersonID
*/

/*
SELECT Sales.CustomerID, COUNT(Sales.SalesID)
FROM Sales
GROUP BY CustomerID
*/

/*
SELECT Sales.SalesPersonID, COUNT(DISTINCT Sales.CustomerID)
FROM Sales
GROUP BY SalesPersonID
*/

/*
WITH Things AS (
		SELECT Sales.SalesPersonID
			, Sales.ProductID
			, SUM(Sales.Quantity) AS Quantity
		FROM Sales
		GROUP BY SalesPersonID
			, ProductID
	)
SELECT Employees.FirstName
	, Employees.LastName
	, Products.Name
	, Things.Quantity * Products.Price AS Value
FROM Things
JOIN Products
ON Things.ProductID = Products.ProductID
JOIN Employees
ON Things.SalesPersonID = Employees.EmployeeID
WHERE Quantity * Price IN (
		SELECT MAX(Things.Quantity * Products.Price)
		FROM Things
		JOIN Products
		ON Things.ProductID = Products.ProductID
		WHERE EmployeeID = SalesPersonID
		GROUP BY SalesPersonID
	)
*/


WITH Product_quantity AS 
	(
		SELECT CustomerID, ProductID, SUM(Quantity) AS Quantity
		From Sales
		GROUP BY CustomerID, ProductID
	), 
	Price1 AS
	(
		SELECT CustomerID, MAX(Quantity * Price) AS Cost
		From Product_quantity JOIN Products 
		ON Product_quantity.ProductID = Products.ProductID
		GROUP BY CustomerID
	)

SELECT FirstName, LastName, Name, Quantity * Price AS Cost
From Product_quantity JOIN Customers 
ON Product_quantity.CustomerID = Customers.CustomerID
JOIN Products
ON Product_quantity.ProductID = Products.ProductID
WHERE Quantity * Price IN (SELECT Cost From Price1 WHERE CustomerID = Customers.CustomerID)

