Welcome To The Employee PayRoll Service DataBase

#UC 1  Create Payroll_Service Database

create database Payroll_Service;
use PayRoll_Service;

#UC 2  Create Table

CREATE TABLE Employee_Payroll (
    Id int identity(1,1) primary key,
    Name varchar(255) not null,
    Salary float,
    StartDate date,
); 

#UC 3   Insert Values in Table

insert into employee_payroll (Name, Salary, StartDate) values
('Sunil', 25000.00, '2012-05-09'),
('Sourabh', 35000.00, '2014-12-06'),
('Karan', 40000.00, '2010-07-05'),
('Prafull', 65000.00, '2008-12-25'),
('Rohan', 22000.00, '2016-01-31');