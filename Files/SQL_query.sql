-- SQL Queries to analyze sales data
-- Sales, Customer, Product, SalesTerritory, Geography, Calendar

-- First, we will describe the structure of each table to understand the schema

DESCRIBE Sales;
DESCRIBE Customer;
DESCRIBE Product;
DESCRIBE SalesTerritory;
DESCRIBE Geography;
DESCRIBE Calendar;

-- Retrieve values from each table

select * from customer limit 10;
select * from calendar limit 10;
select * from geography limit 10;
select * from product limit 10;
select * from salesterritory limit 10;
select * from sales limit 10;

-- Q.1 Find the total revenue per year

SELECT 
    EXTRACT(YEAR FROM orderdate) AS SalesYear,
    SUM(SalesAmount * OrderQuantity) AS TotalRevenue
FROM
    sales
GROUP BY SalesYear
ORDER BY SalesYear ASC;

--  Q.2 Get total revenue, cost, and profit per productname 

SELECT 
    p.EnglishProductName,
    SUM(s.SalesAmount * s.OrderQuantity) AS Revenue,
    SUM(s.ProductStandardCost * s.OrderQuantity) AS Cost,
    SUM(s.SalesAmount * s.orderquantity - s.ProductStandardCost * s.OrderQuantity) AS Profit
FROM
    sales s
        JOIN
    product p ON s.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName;

-- Q.3 Get Total Tax and freight collected per product

SELECT 
    productkey,
    SUM(TaxAmt) AS TotalTax,
    SUM(Freight) AS Totalfreight
FROM
    sales
GROUP BY productkey;

-- Q.4 Which customers places more than 20 orders

SELECT 
    customerkey, COUNT(DISTINCT SalesOrderNumber) AS TotalOrders
FROM
    sales
GROUP BY customerkey
HAVING TotalOrders > 20;

-- Q.5 Find total revenue per country.

SELECT 
    st.SalesTerritoryCountry,
    SUM(s.SalesAmount * s.orderquantity) AS TotalRevenue
FROM
    sales s
        JOIN
    salesterritory st ON s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY st.SalesTerritoryCountry;

-- Q.6 List top 5 cities with highest total sales.

SELECT 
    g.City, SUM(s.SalesAmount * s.orderquantity) AS TotalSales
FROM
    sales s
        JOIN
    customer c ON s.CustomerKey = c.CustomerKey
        JOIN
    geography g ON c.GeographyKey = g.GeographyKey
GROUP BY g.City
ORDER BY TotalSales DESC
LIMIT 5;

-- Q.7 Find customers whose total sales are more than average customer total sales.

WITH CustomerSales AS (
  SELECT CustomerKey, SUM(SalesAmount * orderquantity) AS TotalSales
  FROM sales
  GROUP BY CustomerKey
),
AverageSales AS (
  SELECT AVG(TotalSales) AS AvgSales
  FROM CustomerSales
)
SELECT CustomerKey
FROM CustomerSales
WHERE TotalSales > (SELECT AvgSales FROM AverageSales);

-- Q.8 List customers with their total sales and lebel 'High', 'Medium', and 'Low'

SELECT 
    customerkey,
    SUM(SalesAmount * OrderQuantity) AS Total_Spent,
    CASE
        WHEN SUM(SalesAmount * OrderQuantity) >= 100000 THEN 'High'
        WHEN SUM(SalesAmount * OrderQuantity) > 50000 THEN 'Medium'
        ELSE 'Low'
    END AS CustomerCategory
FROM
    sales
GROUP BY CustomerKey;

-- Q.9 Calculate the running total of revenue for each product over time

WITH DailyRevenue AS (
  SELECT
    p.ProductKey,
    p.EnglishProductName,
    s.OrderDate,
    SUM(s.SalesAmount * s.OrderQuantity) AS RevenuePerDay
  FROM sales s
  JOIN product p ON s.ProductKey = p.ProductKey
  GROUP BY p.ProductKey, p.EnglishProductName, s.OrderDate
)
SELECT
  EnglishProductName,
  OrderDate,
  SUM(RevenuePerDay) OVER (
    PARTITION BY ProductKey
    ORDER BY OrderDate
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS CumulativeRevenue
FROM DailyRevenue
ORDER BY EnglishProductName, OrderDate;

-- Q.10 Rank each product based on Total revenue with its country

WITH RankedProducts AS (
  SELECT 
    st.SalesTerritoryCountry,
    p.EnglishProductName,
    SUM(s.SalesAmount * s.OrderQuantity) AS Revenue,
    RANK() OVER (
      PARTITION BY st.SalesTerritoryCountry 
      ORDER BY SUM(s.SalesAmount * s.OrderQuantity) DESC
    ) AS CountryRank
  FROM sales s
  JOIN product p ON s.ProductKey = p.ProductKey
  JOIN salesterritory st ON s.SalesTerritoryKey = st.SalesTerritoryKey
  GROUP BY st.SalesTerritoryCountry, p.EnglishProductName
)

SELECT *
FROM RankedProducts
WHERE CountryRank <= 3;


-- Q.11 Calculate the difference in revenue between the current and next day for each product 

WITH ProductDailyRevenue AS (
  SELECT
    ProductKey,
    OrderDate,
    SUM(SalesAmount * OrderQuantity) AS RevenuePerDay
  FROM sales
  GROUP BY ProductKey, OrderDate
)
SELECT
  ProductKey,
  OrderDate,
  RevenuePerDay,
  LEAD(RevenuePerDay) OVER (
    PARTITION BY ProductKey ORDER BY OrderDate
  ) AS NextDayRevenue,
  LEAD(RevenuePerDay) OVER (
    PARTITION BY ProductKey ORDER BY OrderDate
  ) - RevenuePerDay AS RevenueChange
FROM ProductDailyRevenue
ORDER BY ProductKey, OrderDate;

