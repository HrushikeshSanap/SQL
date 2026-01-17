##Q1. Create a New Database and  Table for Employees 
##Task: Create a new database named company_db and Create a table employees named with the following columns
##Data given in question paper refered for solution
#Answer:-
Create database company_db;

use company_db;

Create table employees (
employee_id int primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE);

##Q2. Insert Data into Employees Table
##Task: Insert the following sample records into the employees table.
#Answer:-
select * from employees;

insert into employees (employee_id,first_name,last_name,department,salary,hire_date)
values 
(101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-22'),
(103,'Raj','Mehta','IT',90000,'2018-07-11'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');

##Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
##Hint: Use the ORDER BY clause on the salary column.
#Answer:-
select * from employees order by salary asc;

##Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)
#Answer:-
select * from employees order by  department asc, salary desc ;

##Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
#Answer:-
select * from employees where department = 'IT' ORDER BY hire_date desc;

##Q6. Create and Populate a Sales Table
##Task: Create a table sales to track sales data
#Answer:-
create table sales (
sale_id int,
customer_name varchar(10),
amount int,
sale_date date );

insert into sales (sale_id,customer_name,amount,sale_date)
values
(1,'Aditi',1500,'2024-08-01'),
(2,'Rohan',2200,'2024-08-03'),
(3,'Aditi',3500,'2024-09-05'),
(4,'Meena',2700,'2024-09-15'),
(5,'Rohan',4500,'2024-09-25');


##Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)
## Hint: Use ORDER BY amount DESC.
#Answer:-
select * from sales;

select * from sales order by amount desc;

##Q8. Show All Sales Made by Customer “Aditi”
#Hint: Use #WHERE customer_name = 'Aditi'.
#Answer:-
select * from sales where customer_name = 'aditi';

### Q9. What is the Difference Between a Primary Key and a Foreign Key?
##Answer:-

##PRIMARY KEY:-
# A Primary Key is a column (or a set of columns) that uniquely identifies each row/record in a table.
# Primary key must contain unique values, meaning no duplicate values are allowed, and it cannot contain NULL values.
# A table can have only one primary key, which may consist of a single column or multiple columns.
# It does not establish a relationship with another table.
# When multiple columns/fields are used as a primary key, they are called a composite key.
# It ensures entity integrity (each record is unique).

## FOREIGN KEY:-
# A Foreign Key is a column or set of columns in table that refers to the primary key of another table.
# Foreign key can contain duplicate and NULL values.
# A table can have multiple foreign keys.
# It establishes a relationship/link between two or more tables.
# The table that contains the foreign key is called the child table and the table with the primary key is called the parent table or referenced table.
# It ensures referential integrity (ensures consistency between related tables).


##Q10. What Are Constraints in SQL and Why Are They Used?
#Answer:- 
#Constraints are rules applied to table column to enforce data integrity.
#It is used to ensure the accuracy and reliability of the data in a database.
#They restrict the type of data that can be inserted into a table.
#Constraints can be specified when a table is created with the CREATE TABLE statement or you can use the ALTER TABLE statement to create constraints even after the table is created.

 




