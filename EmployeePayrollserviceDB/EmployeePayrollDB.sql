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