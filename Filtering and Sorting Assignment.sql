##Create the following dummy table in MySQL Workbench using CREATE FUNCTION-Sample Table:Employees
#Answer:-
create database Assignment;

Use Assignment;

Create Table Employees (
EmpID Int,
EmpName Varchar(20),
Department Varchar (10),
City Varchar (10),
Salary Int,
HireDate date );

Select * from Employees;

Insert into Employees (EmpID,EmpName,Department,City,Salary,HireDate)
Values
(101,'Rahul Mehta','Sales','Delhi',55000,'2020-04-12'),
(102,'Priya Sharma','HR','Mumbai',62000,'2019-09-25'),
(103,'Aman Singh','IT','Bengaluru',72000,'2021-03-10'),
(104,'Neha Patel','Sales','Delhi',48000,'2022-01-14'),
(105,'Karan Joshi','Marketing','Pune',45000,'2018-07-22'),
(106,'Divya Nair','IT','Chennai',81000,'2019-12-11'),
(107,'Raj Kumar','HR','Delhi',60000,'2020-05-28'),
(108,'Simran Kaur','Finance','Mumbai',58000,'2021-08-03'),
(109,'Arjun Reddy','IT','Hyderabad',70000,'2022-02-18'),
(110,'Anjali Das','Sales','Kolkata',51000,'2023-01-15') ;

##Question 1 : Show employees working in either the ‘IT’ or ‘HR’ departments.
#Answer:-
Select * from Employees where Department ='IT' or 'HR';

##Question 2 : Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.
#Answer:-
Select * from Employees where Department in ('IT','HR','Finance');

##Question 3 : Display employees whose salary is between ₹50,000 and ₹70,000
#Answer:-
Select * from Employees where Salary between 50000 and  70000;

##Question 4 : List employees whose names start with the letter ‘A’.
#Answer:-
Select * from Employees WHERE Empname like 'A%';

##Question 5 : Find employees whose names contain the substring ‘an’.
#Answer:-
Select * from Employees WHERE Empname like '%an%';


##Question 6 : Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.
#Answer:-
Select * from Employees WHERE city in ('Delhi','Mumbai') and salary >55000;


##Question 7 : Display all employees except those from the ‘HR’ department.
#Answer:-
Select * from Employees where Department not in ('HR');
##or
Select * from Employees where Department <> 'HR';


##Question 8 : Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).
#Answer:-
Select * from Employees where hiredate between '2019-01-01' and '2022-01-01' order by hiredate asc;








