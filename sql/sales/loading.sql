BULK INSERT Customers
FROM 'C:\Users\admin\Documents\Learning\sql\sales\customers.csv'
WITH (fieldterminator = ';', rowterminator = '\n');

BULK INSERT Employees
FROM 'C:\Users\admin\Documents\Learning\sql\sales\employees.csv'
WITH (fieldterminator = ';', rowterminator = '\n');

BULK INSERT Products
FROM 'C:\Users\admin\Documents\Learning\sql\sales\products.csv'
WITH (fieldterminator = ';', rowterminator = '\n');

BULK INSERT Sales
FROM 'C:\Users\admin\Documents\Learning\sql\sales\sales100k.csv'
WITH (fieldterminator = ';', rowterminator = '\n');
