#Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?
##Answer:-
-- A Common Table Expression (CTE) is a temporary named result set defined using the WITH clause that can be referenced within a single SQL query.
-- It improves readability by:-
-- Breaking complex queries into smaller, logical parts.
-- Reducing the need for nested subqueries.
-- Making the query easier to understand and maintain.
-- Also Allows reuse of the same result set within the query.

#Q2. Why are some views updatable while others are read-only? Explain with an example.
##Answer:-
-- A view is updatable if it:
-- Is based on a single table
-- Does not use GROUP BY, DISTINCT, JOIN, aggregate functions
-- Includes primary key columns
-- e.g:-
Use world;
Select * from city;
SELECT Name, Countrycode, District
FROM city;

-- A view is read-only if it:
-- Uses joins, aggregate functions, groupby or distinct.
-- e.g:-
Select countrycode, count(distinct countrycode) from city group by countrycode;

#Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?
##Answer:- Following are the advantages:-
-- Code reusability
-- Better performance
-- Improved security (restrict direct table access)
-- Easier maintenance and Reduces network traffic

#Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
##Answer:-
-- Triggers are special database objects that automatically execute (fire) when a specific event occurs on a table, such as INSERT, UPDATE, or DELETE.
-- Purpose of Triggers:-
-- Enforce business rules and Maintain data integrity
-- Automatically log changes
-- Perform automatic actions based on data changes
-- e.g:- An audit trigger that automatically records changes whenever a row in the employees table is updated.
-- This is essential for tracking who changed what and when, especially in banking or enterprise systems.

#Q5. Explain the need for data modelling and normalization when designing a database.
## Answer:- 
-- Data Modeling helps to Design structured database schema, defining relationships and improve the clarity.
-- Whereas Normalization helps to Reduce data redundancy,Prevent update anomalies,Improve data integrity.

-- Practical questions:-
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2) );

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATE,
FOREIGN KEY (ProductID) REFERENCES Products (ProductID) );

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3,3, 2, '2024-01-10'),
(4,4, 1, '2024-01-11');

#Q6. Write a CTE to calculate the total revenue for each product (Revenues = Price × Quantity), and return only products where  revenue > 3000.
##Answer:-
select * from Products;
With ProductRevenue as (
select p.ProductID, p.ProductName,
SUM(p.Price * s.Quantity) as Revenue from Products p
Join Sales s on p.ProductID=s.ProductID
Group by p.ProductID, p.ProductName)
SELECT ProductID,ProductName,Revenue
FROM ProductRevenue
WHERE Revenue > 3000;

#Q7. Create a view named that shows:Category, TotalProducts, Avera
##Answer:- 
CREATE VIEW CategorySummary AS
SELECT Category, COUNT(*) AS TotalProducts,
AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;
SELECT * FROM CategorySummary;

#Q8. Create an updatable view containing ProductID, ProductName, and Price.Then update the price of Product
##Answer:-
CREATE VIEW ProductView AS
SELECT ProductID,ProductName,Price FROM Products;
UPDATE ProductView SET Price = 1500
WHERE ProductID = 1;
SELECT * FROM Products;

#Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category
## Answer:-

DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN cat_name VARCHAR(50))
BEGIN
    SELECT 
        ProductID,
        ProductName,
        Category,
        Price
    FROM Products
    WHERE Category = cat_name;
END //
CALL GetProductsByCategory('Electronics');

#Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a newtable ProductArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.
## Answer:-
-- Step 1: Create the Archive Table (compatible with your Products table)
CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt DATETIME);
   -- Step 2: Create the AFTER DELETE Trigger on Products 
    DELIMITER //
CREATE TRIGGER after_delete_products
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
INSERT INTO ProductArchive (ProductID,ProductName,Category,Price,DeletedAt) VALUES 
(OLD.ProductID,OLD.ProductName,OLD.Category,OLD.Price,NOW());
END //
-- Step 3: Test Using Your Existing Data
DELETE FROM Products
WHERE ProductID = 1;
-- Step 4: Verify Archived Rows
SELECT * FROM ProductArchive;


