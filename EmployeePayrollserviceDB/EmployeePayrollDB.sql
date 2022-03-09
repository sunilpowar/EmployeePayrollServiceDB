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
ALTER TABLE Employee_Payroll ADD Address varchar(255) default 'NIL';

UPDATE Employee_Payroll SET PhoneNumber=6514279584 where name='Sunil';
UPDATE Employee_Payroll SET PhoneNumber=9465213478 where name='Sushama';
UPDATE Employee_Payroll SET PhoneNumber=6145479856 where name='Karan';
UPDATE Employee_Payroll SET PhoneNumber=6148976457 where name='Prafull';
UPDATE Employee_Payroll SET PhoneNumber=9871621542 where name='Rohan';
UPDATE Employee_Payroll SET PhoneNumber=9784621478 where name='Snehal';

UPDATE Employee_Payroll SET Department='Purchasing' where Id IN (1);
UPDATE Employee_Payroll SET Department='Finance' where Id IN (3,4);
UPDATE Employee_Payroll SET Department='Marketing' where Id IN (5);
UPDATE Employee_Payroll SET Department='Software Developmernt' where Id IN (2);
UPDATE Employee_Payroll SET Department='Sales' where Id IN (6);

UPDATE Employee_Payroll SET Address='Kolhapur' WHERE Id IN (1,3);
UPDATE Employee_Payroll SET Address='Pune' WHERE Id IN (6,4);
UPDATE Employee_Payroll SET Address='Mumbai' WHERE Id IN (5,2);

--UC 9  Extended The Table With BasicPay,Deductions,TaxablePay,IncomeTax,NetPay Columns

EXEC SP_RENAME 'Employee_Payroll.Salary','BasicPay','COLUMN';
ALTER TABLE Employee_Payroll ADD Deductions float,TaxablePay float,IncomeTax float,NetPay float;

UPDATE Employee_Payroll SET Deductions=2000 WHERE Gender='F';
UPDATE Employee_Payroll SET Deductions=2500 WHERE Gender='M';
UPDATE Employee_Payroll SET NetPay=(BasicPay - Deductions)
UPDATE Employee_Payroll SET TaxablePay=0,IncomeTax=0
SELECT * FROM employee_payroll;

--UC 10  Terissa as part of Sales and Marketing Department

INSERT INTO Employee_Payroll VALUES ('Terissa', 60000.00,'2018-01-03','F','Marketing', 9874646543, 2000, 0, 0, 58000, 'Pune'),
('Terissa', 50000.00,'2019-01-01','F','Sales', 9576164256, 2000, 0, 0, 48000, 'Kolhapur');
SELECT * FROM Employee_Payroll;

--# UC 11 Implement the ER Diagram into Payroll Service Database

--Creating Table for Company--
CREATE TABLE Company(
	CompanyId INT IDENTITY(1,1) PRIMARY KEY,
	CompanyName VARCHAR(100)
	);

--Creating Deptartment table
CREATE TABLE Department(
	DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
	DepartmentName VARCHAR(50)
);

--Creating Employee Table
CREATE TABLE Employee(
	EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
	CompanyId INT FOREIGN KEY REFERENCES Company(CompanyId),
	EmployeeName VARCHAR(30),
	PhoneNumber BIGINT,
	EmployeeAddress VARCHAR(50),
	StartDate DATE,
	Gender CHAR(1)
);

--Creating Payroll Table
CREATE TABLE Payroll(
	EmployeeId INT FOREIGN KEY REFERENCES Employee(EmployeeId),
	BasicPay FLOAT,
	TaxablePay FLOAT,
	IncomeTax FLOAT,
	NetPay FLOAT,
	Deductions FLOAT
);

--Creating Employee Department Table
CREATE TABLE EmployeeDepartment(
	EmployeeId int FOREIGN KEY REFERENCES Employee(EmployeeId),
	DepartmentId int FOREIGN KEY REFERENCES Department(DepartmentId),
);

--Inserting Value Into Company Table
INSERT INTO Company VALUES('TECH MAHINDRA'),('SLK'),('TCS');
SELECT * FROM Company;

--Inserting Value Into Department Table
INSERT INTO Department VALUES('FINANCE'),('SALES'),('MARKETING'),('SOFTWARE DEVELPOER'),('HR');
SELECT * FROM Department;

--Inserting Value Into Employee Table
INSERT INTO Employee VALUES
(1,'Sunil',9564176218,'Kolhapur','2014-05-30','M'),
(2,'Prafull',9614864723,'Satara','2018-01-23','M'),
(1,'Sushama',6221489725,'Pune','2015-09-14','F'),
(2,'Harish',9321478413,'Mumbai','2011-03-19','M'),
(1,'Snehal',6247952454,'Belguam','2021-04-17','F'),
(2,'Karan',9130309244,'Kagal','2021-11-27','M');

--Inserting Value Into Payroll Table
INSERT INTO Payroll(EmployeeId,BasicPay,IncomeTax,Deductions) Values (1,50000,2000,500),(2,50000,3000,800),(3,55000,5000,1000),(4,70000,5000,1500);
UPDATE Payroll SET EmployeeId = 4 where BasicPay = 70000;

--Updating TaxablePay Based On BasicPay - Deductions
UPDATE Payroll SET TaxablePay = (BasicPay-Deductions);

--Updating Netpay Based On Taxablepay-incometax
UPDATE Payroll SET NetPay = (TaxablePay-IncomeTax);
SELECT * FROM Payroll

--Inserting Value Into Employee Department Table
INSERT INTO EmployeeDepartment VALUES(1,2),(4,2),(2,3),(1,4);
SELECT * FROM EmployeeDepartment;


	
