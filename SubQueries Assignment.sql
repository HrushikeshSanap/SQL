Create Database Assignment2;
use Assignment2;

Create table Employee (
emp_id int,
emp_name varchar(20),
department_id varchar(20),
salary int
);
select * from employee;
Insert into Employee (emp_id,emp_name,department_id,salary)
values
(101,'Abhishek','D01',62000),
(102,'Shubham','D01',58000),
(103,'Priya','D02',67000),
(104,'Rohit','D02',64000),
(105,'Neha','D03',72000),
(106,'Aman','D03',55000),
(107,'Ravi','D04',60000),
(108,'Sneha','D04',75000),
(109,'Kiran','D05',70000),
(110,'Tanuja','D05',65000);

select * from Employee;
drop table employee;
Create Table Department(
department_id varchar(10),
department_name varchar(10),
location  varchar(15)
);

Insert into Department(department_id,department_name,location)
values
('D01','Sales','Mumbai'),
('D02','Marketing','Delhi'),
('D03','Finance','Pune'),
('D04','HR','Bengaluru'),
('D05','IT','Hyderabad');

select * from Department;

Create table Sales (
sale_id int,
emp_id int,
sale_amount int,
sale_date date);

Insert into Sales (sale_id,emp_id,sale_amount,sale_date)
values
(201,101,4500,'2025-01-05'),
(202,102,7800,'2025-01-10'),
(203,103,6700,'2025-01-14'),
(204,104,12000,'2025-01-20'),
(205,105,9800,'2025-02-02'),
(206,106,10500,'2025-02-05'),
(207,107,3200,'2025-02-09'),
(208,108,5100,'2025-02-15'),
(209,109,3900,'2025-02-20'),
(210,110,7200,'2025-03-01');

select * from Sales;

##Basic Level
#Retrieve the names of employees who earn more than the average salary of all employees.

select emp_name from Employee
where salary > (select avg (salary) from employee);


#Find the employees who belong to the department with the highest average salary.

select * from employee where department_id in (
select department_id from employee
group by department_id
having avg(salary) = (
select MAX(avg_sal) from (select avg(salary) as avg_sal from employee
group by department_id) a
));

#List all employees who have made at least one sale.

select distinct e.emp_id, e.emp_name from employee e join (select emp_id from sales group by emp_id) as s on e.emp_id = s.emp_id;

#Find the employee with the highest sale amount.

select e.emp_id,e.emp_name,s.sale_amount from employee e join sales s on e.emp_id = s.emp_id 
where s.sale_amount = (select max(sale_amount) from sales);

#Retrieve the names of employees whose salaries are higher than Shubham’s salary.

select emp_name,salary from employee
where salary > (select salary from employee where emp_name='Shubham');



##Intermediate Level
#Find employees who work in the same department as Abhishek.

select emp_name from employee where department_id = (select department_id from employee where emp_name='Abhishek');

#List departments that have at least one employee earning more than ₹60,000.

select department_name from Department where department_id in
(select department_id from employee where salary>60000);

#Find the department name of the employee who made the highest sale.

select department_name from department where department_id = (
select department_id from employee where emp_id = (
select emp_id from sales where sale_amount = (select max(sale_amount) from sales) ) );

#Retrieve employees who have made sales greater than the average sale amount
select e.emp_id,e.emp_name from employee as e where emp_id in (
(select s.emp_id from sales as s where s.sale_Amount >
(select avg(sale_amount) from sales) ) );

#Find the total sales made by employees who earn more than the average salary.

select sum(sale_amount) from sales 
where emp_id in(
select emp_id from employee where salary > (
select avg(salary) from employee) );

##Advanced Level
#Find employees who have not made any sales.

select emp_id,emp_name from employee where emp_id not in
(select emp_id from sales);

#List departments where the average salary is above ₹55,000.

select department_name from department where department_id in (
select department_id from employee group by department_id having avg(salary) > 55000);

#Retrieve department names where the total sales exceed ₹10,000.

	select department_name from department where department_id in(
	select department_id from employee where emp_id in(
	select emp_id from sales group by emp_id having sum(sale_amount) > 10000) );

#Find the employee who has made the second-highest sale.

select emp_id,emp_name from employee where emp_id = (
select emp_id from sales where sale_amount = (
select max(sale_amount) from sales where sale_amount <(
select max(sale_amount) from sales) ) );

#Retrieve the names of employees whose salary is greater than the highest sale amount recorded.

select emp_name from employee where salary > (
select max(sale_amount) from sales);