Use Assignment;

Create Table Customers (
CustomerID int,
CustomerName varchar(50),
City varchar(50)
);

Describe Customers;
Insert into Customers (CustomerID,CustomerName,City)
values (1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami') ;

select * from Customers;

Create Table Orders (
OrderID int,
CustomerID int,
OrderDate date,
Amount int );

Insert into Orders (OrderID,CustomerID,OrderDate,Amount)
values (101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,6,'2024-10-12',400) ;

select * from Orders;

Create table Payments(
PaymentID varchar(10),
CustomerID int,
PaymentDate date,
Amount int );

Insert into Payments (PaymentID,CustomerID,PaymentDate,Amount)
Values ('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200) ;

select * from Payments;

## I have already table name employees in this database hence creating database named 'Employee'.

DROP TABLE employee;

Create table Employee (
EmployeeID Int,
EmployeeName varchar(20),
ManagerID  varchar(20) );

Insert into Employee (EmployeeID,EmployeeName,ManagerID)
values (1,'Alex Green','NULL'),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2) ;
select * from Employee;

##Question 1:-Retrieve all customers who have placed at least one order.

select distinct c.CustomerName,c.CustomerId,c.City
from Customers as c INNER join Orders as o on c.CustomerID = o.CustomerID;

##Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount
from Customers as c left join Orders as o on c.CustomerID = o.CustomerID;

##Question 3.Retrieve all orders and their corresponding customers, including orders placed by unknown customers.

select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount
from Customers as c right join Orders as o on c.CustomerID = o.CustomerID;

##Question 4. Display all customers and orders, whether matched or not.

select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount
from Customers as c left join Orders as o on c.CustomerID = o.CustomerID
union
select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount
from Customers as c right join Orders as o on c.CustomerID = o.CustomerID;

## Question 5. Find customers who have not placed any orders.

select c.CustomerName,c.CustomerId,c.City
from Customers as c left join Orders as o on c.CustomerID = o.CustomerID where o.OrderId is Null;

##Question 6. Retrieve customers who made payments but did not place any orders.

select c.CustomerName,c.CustomerId,c.City
from Customers as c inner join Payments as p on c.CustomerID = p.CustomerID 
left join
Orders as o on c.CustomerID = o.CustomerID where o.OrderId is Null;

##Question 7. Generate a list of all possible combinations between Customers and Orders.

select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount
from Customers as c cross join Orders as o;

## Question 8. Show all customers along with order and payment amounts in one table.

select c.CustomerName,c.CustomerId,c.City,o.OrderID,o.OrderDate,o.Amount as Order_Amount, p.PaymentID,p.PaymentDate,p.Amount as Payment_Amount
from Customers as c LEFT join Orders as o  on c.CustomerID = o.CustomerID
LEFT JOIN Payments as p
on c.CustomerID = p.CustomerID;

##Question 9. Retrieve all customers who have both placed orders and made payments.

select distinct c.CustomerName,c.CustomerId,c.City
from Customers as c inner join Orders as o on c.CustomerID = o.CustomerID 
inner join
Payments as p on c.CustomerID = p.CustomerID;









