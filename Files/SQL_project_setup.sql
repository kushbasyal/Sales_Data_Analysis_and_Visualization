create database Projectsales;

use projectsales;
CREATE TABLE Customer (
    CustomerKey INT primary key,
    GeographyKey INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BirthDate DATE,
    MaritalStatus VARCHAR(20),
    Gender varchar(10),
    YearlyIncome DECIMAL(10,2),
    NumberChildrenAtHome INT,
    EnglishEducation VARCHAR(100),
    EnglishOccupation VARCHAR(100),
    HouseOwnerFlag INT,
    NumberCarsOwned INT,
    CommuteDistance VARCHAR(50)
);

-- make sure the data is imported correctly
select * from customer;

-- creating calendar table and importing data
CREATE TABLE Calendar (
    FullDate DATE primary key,
    StartOfWeek DATE,
    StartOfMonth DATE
);

select * from calendar;

-- creating geography table and inserting data
CREATE TABLE Geography (
  GeographyKey INT PRIMARY KEY,
  City VARCHAR(100),
  StateProvinceName VARCHAR(100),
  EnglishCountryRegionName VARCHAR(100),
  SalesTerritoryKey INT
);

select * from geography limit 10;

-- creating product table

CREATE TABLE Product (
  ProductKey INT PRIMARY KEY,
  EnglishProductName VARCHAR(255),
  StandardCost DECIMAL(12, 2),
  ListPrice DECIMAL(12, 2)
);

select * from product limit 10;

-- creating sales terriotry table 

CREATE TABLE SalesTerritory (
  SalesTerritoryKey INT PRIMARY KEY,
  SalesTerritoryRegion VARCHAR(100),
  SalesTerritoryCountry VARCHAR(100),
  SalesTerritoryGroup VARCHAR(100)
);

select * from salesTerritory;

-- creating fact table sales table
CREATE TABLE Sales (
    ProductKey INT,
    CustomerKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(20),
    OrderQuantity INT,
    ProductStandardCost DECIMAL(12, 2),
    SalesAmount DECIMAL(12, 2),
    TaxAmt DECIMAL(12, 2),
    Freight DECIMAL(12, 2),
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE,
    
    CONSTRAINT fk_sales_product FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
    CONSTRAINT fk_sales_customer FOREIGN KEY (CustomerKey) REFERENCES Customer(CustomerKey),
    CONSTRAINT fk_sales_territory FOREIGN KEY (SalesTerritoryKey) REFERENCES SalesTerritory(SalesTerritoryKey),
    CONSTRAINT fk_sales_orderdate FOREIGN KEY (OrderDate) REFERENCES Calendar(FullDate)
);

-- We missed the link between the customer key and geography key so update it and linked with a foreign key
ALTER TABLE Customer
ADD CONSTRAINT fk_customer_geography
FOREIGN KEY (GeographyKey) REFERENCES Geography(GeographyKey);


select * from sales;
select count(*) from sales;




