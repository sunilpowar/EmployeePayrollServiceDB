--Welcome To The Employee PayRoll Service DataBase--

--#UC 1  Create Payroll_Service Database--

create database Payroll_Service;
use PayRoll_Service;

--#UC 2  Create Table--

CREATE TABLE Employee_Payroll (
    Id int identity(1,1) primary key,
    Name varchar(255) not null,
    Salary float,
    StartDate date,
); 

--#UC 3   Insert Values in Table--

insert into employee_payroll (Name, Salary, StartDate) values
('Sunil', 25000.00, '2012-05-09'),
('Sushama', 35000.00, '2014-12-06'),
('Karan', 40000.00, '2010-07-05'),
('Prafull', 65000.00, '2008-12-25'),
('Rohan', 22000.00, '2016-01-31'),
('Snehal', 60000.00, '2021-11-19');

--# UC 4  Retreive Records Using Select--

SELECT * FROM Employee_Payroll;

--#UC 5   Retrieve Salary data from particular Emplyoyee--

SELECT Salary FROM Employee_Payroll WHERE NAME='Karan' 
SELECT Salary,Name FROM Employee_Payroll WHERE Name LIKE 'K%';
SELECT Salary,Name FROM Employee_Payroll WHERE StartDate between CAST('2010-07-05' as Date) and getdate(); 
SELECT Salary,Name FROM Employee_Payroll WHERE Salary between 35000 and 45000; 

--#UC 6  Alter And Update Data

Alter Table Employee_Payroll Add Gender	char(1);
update Employee_Payroll set Gender='M' where Id IN (1,3,4,5);
update Employee_Payroll set Gender='F' where Id IN (2,6);

--UC 7  Aggregate Functions and Group by Gender
select SUM(Salary) as TotalSalary from Employee_Payroll;
select SUM(Salary) as TotalSalary,Gender from Employee_Payroll group by Gender;
select Max(Salary) as MaxEmployeeSalary from Employee_Payroll;
select Max(Salary) as MaxSalary,Gender from Employee_Payroll group by Gender;
select Min(Salary) as MinEmployeeSalary from Employee_Payroll;
select Min(Salary) as MinSalary,Gender from Employee_Payroll group by Gender;

 --UC 8 Add column department,PhoneNumber and Address

ALTER TABLE Employee_Payroll ADD Department varchar(20) not null default 'Software Developer';
ALTER TABLE Employee_Payroll ADD PhoneNumber bigint;
UPDATE Employee_Payroll SET PhoneNumber=6514279584 where name='Sunil';
UPDATE Employee_Payroll SET PhoneNumber=9465213478 where name='Sushama';
UPDATE Employee_Payroll SET PhoneNumber=6145479856 where name='Karan';
UPDATE Employee_Payroll SET PhoneNumber=6148976457 where name='Prafull';
UPDATE Employee_Payroll SET PhoneNumber=9871621542 where name='Rohan';
UPDATE Employee_Payroll SET PhoneNumber=9784621478 where name='Snehal';

UPDATE Employee_Payroll SET Department='Purchasing' where Id IN (1);
UPDATE Employee_Payroll SET Department='Finance' where Id IN (3,4);
UPDATE Employee_Payroll SET Department='Marketing' where Id IN (5);
UPDATE Employee_Payroll SET Department='Software Developmernt' where Id IN (2,6);