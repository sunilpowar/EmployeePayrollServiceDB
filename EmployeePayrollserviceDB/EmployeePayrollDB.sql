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
('Sourabh', 35000.00, '2014-12-06'),
('Karan', 40000.00, '2010-07-05'),
('Prafull', 65000.00, '2008-12-25'),
('Rohan', 22000.00, '2016-01-31');

--# UC 4  Retreive Records Using Select--

SELECT * FROM Employee_Payroll;

--#UC 5   Retrieve Salary data from particular Emplyoyee--

SELECT Salary FROM Employee_Payroll WHERE NAME='Karan' 
SELECT Salary,Name FROM Employee_Payroll WHERE Name LIKE 'K%';
SELECT Salary,Name FROM Employee_Payroll WHERE StartDate between CAST('2010-07-05' as Date) and getdate(); 
SELECT Salary,Name FROM Employee_Payroll WHERE Salary between 35000 and 45000; 