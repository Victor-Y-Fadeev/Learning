CREATE TABLE Customers (
    CustomerID  integer,
    FirstName   varchar(40) NOT NULL,
    MiddleInitial varchar(40) NULL,
    LastName varchar(40) NOT NULL,
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID  integer,
    FirstName   varchar(40) NOT NULL,
    MiddleInitial varchar(40) NULL,
    LastName varchar(40) NOT NULL,
    PRIMARY KEY(EmployeeID)
);

CREATE TABLE Products (
    ProductID integer,
    Name varchar(50) NOT NULL,
    Price money NULL,
    PRIMARY KEY(ProductID)
);

CREATE TABLE Sales (
    SalesID integer,
    SalesPersonID integer NOT NULL,
    CustomerID integer NOT NULL,
    ProductID integer NOT NULL,
    Quantity integer NOT NULL,
    PRIMARY KEY(SalesID)
);
