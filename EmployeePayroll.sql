--Creating DataBase
create Database EmployeePayroll

--Creating Employee Table
Create Table Employee(EmployeeId Int Primary Key identity(1,1), 
FirstName varchar(20),SecondName varchar(20), 
DateofBirth Date, Gender char(1), Addrress varchar(100),
ContactNumber varchar(10),Email varchar(50), HireDate Date,
DesignationID Int ,
Foreign Key(DesignationID) References dbo.Employee(EmployeeId));
select * from Employee

--Inserting Records into EmployeeTable
Insert into Employee(FirstName,SecondName,DateofBirth,Gender,Addrress,ContactNumber,Email,HireDate,DesignationID)
values('Soma','Shekar','1998-01-01','M','Banglore','7867677868','soma@gmail.com','2020-01-01', 1),
('Anil','Kumar','1996-04-02','M','Kolar','9898777861','anil@gmail.com','2021-06-06',2),
('Varun', 'Kumar', '1997-06-04', 'M', 'Mulbagal', '7878779978', 'varun@gmail.com', '2019-06-09', 3),
('Chandra', 'Shekar', '1996-05-01', 'M', 'KGF', '9878876767', 'chandra@gmail.com', '2021-08-05',4),
('Monika','Rani','1998-03-05','F','Banglore','9977887866','monika@gmail.com','2020-01-01',5),
('Sandhya','Rani','1998-08-04','F','Kolar','8999897897','sandhya@gmail.com','2022-05-05',6),
('sahana','Rani','1999-04-08','F','Hyderabad','8899798765','shana@gmail.com','2022-06-09',7),
('Ganesh','Kumar','1997-06-15','M','Manglore','7897678678','ganesh@gmail.com','2018-05-06',8),
('Sanjay','Kumar','1996-08-26','M','Banglore','8899778673','sanjay@gmail.com','2019-05-06',9),
('Sunil','Kumar','1997-12-19','M','Manglore','9809879098','Sunil@gmail.com','2019-04-12',10),
('Vidhya','Shree','1999-02-14','F','KGF','8988898978','vidhya@gmail.com','2018-04-06',11),
('Prathima','Priya','1999-06-23','F','KGF','8989876978','prathima@gmail.com','2021-06-28',12);
select * from Employee

--Create Department Table
Create Table Department(DepartmentId Int Primary Key Identity(1,1),
DepartmentName varchar(30),
EmployeeId Int Foreign Key References dbo.Employee(EmployeeId));
select * from Department;
--Inserting Records into Table Department
Insert	into Department (DepartmentName,EmployeeId) values('Finance',1),
('Sales',2),('Design',3),('Production',4),('Quality',5),('Service',6),('Production',7),
('Sales',8),('Quality',9),('Service',10),('Production',11),('Sales',12);

--Ceate Designation Table 
Create Table Designation(DesignationID int Primary Key identity(1,1),
DesignationName varchar(100));
Insert into Designation(DesignationName) values('FullStack Developers'),('BackEnd Developers'),
('Front Developers'),('Manager'),('Assistance Manager'),('Team Leader'),('Finance Manager '),
('Production Manager'),('Quality Manager'),('Team Leader'),('BackEnd Developers'),('Front Developers');
Select * from Designation;

--Create PayrollPeriod Table
Create Table PayrollPeriod(PayrollPeriodID Int Primary Key Identity (1,1),
StartDate DateTime,
EndDate DateTime);
Insert into PayrollPeriod(StartDate, EndDate) values('2020-01-01', '2023-01-31'),
('2021-06-06', '2023-01-31'),('2019-06-09', '2023-03-31'),('2021-08-05', '2023-04-30'),
('2020-01-01', '2023-01-31'),('2022-05-05', '2023-01-31'),('2022-06-09', '2023-01-31'),
('2018-05-06', '2023-01-31'),('2019-05-06', '2023-01-31'),('2019-04-12', '2023-01-31'),
('2018-04-06', '2023-01-31'),('2021-06-28', '2023-01-31');

Select * from PayrollPeriod;

--Create Salary Table
Create Table Salary(SalaryID Int Primary Key identity(1,1),
EmployeeId Int Foreign Key References dbo.Employee(EmployeeId),
PayrollPeriodID Int Foreign Key References dbo.PayrollPeriod(PayrollPeriodID),
BasicSalary BigInt,
Allowances BigInt,
Deductions BigInt,
NetSalary BigInt);
Insert into Salary(EmployeeId,PayrollPeriodID,BasicSalary,Allowances,Deductions,NetSalary)values
(1, 1, 50000, 5000, 2000, 53000),(2, 2, 45000, 4000, 1500, 46900),(3, 3, 55000, 6000, 2500, 56500),
(4, 4, 60000, 7000, 3000, 60000),(5, 5, 50000, 5000, 2000, 53000),(6, 6, 55000, 6000, 2500, 56500),
(7, 7, 55000, 6000, 2500, 56500),(8, 8, 60000, 7000, 3000, 60000),(9, 9, 50000, 5000, 2000, 53000),
(10, 10, 45000, 4000, 1500, 46900),(11, 11, 55000, 6000, 2500, 56500),(12, 12, 60000, 7000, 3000, 60000);
Select * from Salary;

--Create Table Attendance
Create Table Attendance(AttendanceID Int Primary Key identity(1,1),
EmployeeId Int Foreign Key References dbo.Employee(EmployeeId),
AttendanceDate DateTime,
ClockIn DateTime,
ClockOut DateTime);
Insert into Attendance(EmployeeId,AttendanceDate,ClockIn,ClockOut) values
(1, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 18:00:00'),
(2, '2023-01-01', '2023-01-01 09:30:00', '2023-01-01 17:40:00'),
(3, '2023-01-01', '2023-01-01 08:45:00', '2023-01-01 18:45:00'),
(4, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 18:30:00'),
(5, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 17:00:00'),
(6, '2023-01-01', '2023-01-01 09:30:00', '2023-01-01 18:00:00'),
(7, '2023-01-01', '2023-01-01 08:45:00', '2023-01-01 16:45:00'),
(8, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 18:30:00'),
(9, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 17:00:00'),
(10, '2023-01-01', '2023-01-01 09:30:00', '2023-01-01 18:00:00'),
(11, '2023-01-01', '2023-01-01 08:45:00', '2023-01-01 17:45:00'),
(12, '2023-01-01', '2023-01-01 09:00:00', '2023-01-01 18:30:00');
Select * from Attendance;

--Create Table Leave
Create Table Leave(LeaveID Int Primary key identity(1,1),
EmployeeId Int Foreign Key References dbo.Employee(EmployeeId),
LeaveType varchar(20),
StartDate DateTime,
EndDate DateTime);
Insert into Leave(EmployeeId, LeaveType,StartDate,EndDate) values
(1,'Sick Leave','2023-01-10','2023-01-12'),
(2,'Annual  Leave','2023-01-08', '2023-01-12'),
(3,'Personal  Leave','2023-01-15','2023-01-16'),
(4,'Casual  Leave','2023-01-19','2023-01-20'),
(5,'Sick Leave','2023-01-16','2023-01-18'),
(6,'Sick Leave','2023-01-22','2023-01-25'),
(7,'Personal Leave','2023-01-10','2023-01-11'),
(8,'Sick Leave','2023-01-01','2023-01-03'),
(9,'Personal Leave','2023-01-13','2023-01-15'),
(10,'Casual Leave','2023-01-19','2023-01-21'),
(11,'Casual Leave','2023-01-21','2023-01-22'),
(12,'Annual Leave','2023-01-26','2023-01-28');
Select * from Leave;

--Create Table Training
Create Table Training(TrainingID Int Primary Key identity(1,1),
TrainingName varchar(100),
Descriptions varchar(1000), 
Trainer varchar(20),
StartDate DateTime,
EndDate DateTime,
EmployeeId Int Foreign Key References dbo.Employee(EmployeeId));

Insert Into Training(TrainingName,Descriptions,Trainer,StartDate,EndDate,EmployeeId) values
('Team Building','Building effective teams','Ankith','2022-04-14','2022-04-16',1),
('Communication Skills', 'Improving verbal and written communication', 'Manish', '2022-06-10', '2022-06-12', 2),
('Leadership Development', 'Enhancing leadership qualities', 'Gunjan', '2022-12-15', '2022-12-18', 3),
('Technical Workshop', 'Deep dive into new technologies', 'Nagendra', '2023-01-20', '2023-01-22', 4),
('Team Building','Building effective teams','Ankith','2022-04-14','2022-04-16',5),
('Communication Skills', 'Improving verbal and written communication', 'Manish', '2022-06-10', '2022-06-12', 6),
('Leadership Development', 'Enhancing leadership qualities', 'Gunjan', '2022-12-15', '2022-12-18', 7),
('Technical Workshop', 'Deep dive into new technologies', 'Nagendra', '2023-01-20', '2023-01-22', 8),
('Team Building','Building effective teams','Ankith','2022-04-14','2022-04-16',9),
('Communication Skills', 'Improving verbal and written communication', 'Manish', '2022-06-10', '2022-06-12', 10),
('Leadership Development', 'Enhancing leadership qualities', 'Gunjan', '2022-12-15', '2022-12-18', 11),
('Technical Workshop', 'Deep dive into new technologies', 'Nagendra', '2023-01-20', '2023-01-22', 12);
Select * from Training;

--1)Query to display last 5 Records from table
Select Top 5 * from Employee;

--2)Query to fetch last record from the table
Select Top 1 * from Employee Order By EmployeeId Desc;

--3)Query to fetch monthly Salary of Employee if annual salary is given
Select EmployeeId,BasicSalary/12 As MonthlySalary from Salary where EmployeeId=2;
select Sum(NetSalary)/12 As MonthalSalary from Salary ;
--4)Display Even rows in Employee table
Select * from Employee where EmployeeId%2=0;

--5)Display last 50% records from Employee table
Select * from 
(Select Top 50 PERCENT * from Employee Order By EmployeeId Desc) var 
Order By EmployeeId;
Select Top 50 Percent * from Employee order By EmployeeId Desc;
--6)get distinct records from the table without using distinct keyword
Select Distinct * from Employee;
Select * from Employee order By EmployeeId;

--7)add the email validation using only one query
Select * from Employee where Email Like '%@gmail.com';
Select * from Employee where Email Not Like '%,__%.__%.__%gmail.com';

--Joins(Inner Join)
SELECT e.EmployeeId, e.FirstName, e.SecondName, d.DepartmentName, des.DesignationName
FROM Employee e
INNER JOIN Department d ON e.EmployeeId = d.EmployeeId
INNER JOIN Designation des ON e.DesignationID = des.DesignationID;

--Left Join
Select e.EmployeeId,e.FirstName,e.SecondName,s.BasicSalary,s.Allowances,s.Deductions,s.NetSalary
From Employee e
Left Join Salary s ON e.EmployeeId=s.EmployeeId;

--Right Join
Select e.EmployeeId, e.FirstName, e.SecondName, s.BasicSalary, s.Allowances, s.Deductions, s.NetSalary
FROM Salary s
RIGHT JOIN Employee e ON e.EmployeeId = s.EmployeeId;

--Full Outer Join
Select e.EmployeeId, e.FirstName, e.SecondName, s.BasicSalary, s.Allowances, s.Deductions, s.NetSalary
FROM Employee e
FULL OUTER JOIN Salary s ON e.EmployeeId = s.EmployeeId;

--Self Join
Select e.EmployeeId, e.FirstName As ManagerFirstName ,e.SecondName As ManagerSecondName,d.DesignationName as Designation
From Employee e
Join Designation d ON e.EmployeeId=d.DesignationID;

--Cartesian Join(Cross Join)
Select E.FirstName, E.SecondName, E.Gender,E.DateofBirth,T.TrainingID,T.TrainingName
From Employee E
Cross Join Training T;

--Stored Procedure(Exception Handling)
Create Procedure dbo_DB_Errors
As
Select
ERROR_NUMBER() AS Error,
ERROR_SEVERITY() AS ErrorSeverity,
ERROR_STATE() AS ErrorState,
ERROR_LINE() AS ErrorLine,
ERROR_PROCEDURE() AS ErrorProcedure,
ERROR_MESSAGE() AS ErrorMeaasge;
GO

--1)Assuming we want to create a stored procedure to calculate the total salary for a specific employee based on their EmployeeID and a provided PayrollPeriodID.(handle exceptions in SP)
CREATE PROCEDURE CalculateTotalSalary
@EmployeeID INT,
@PayrollPeriodID INT,
@TotalSalary BIGINT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRY
DECLARE @BasicSalary BIGINT, @Allowances BIGINT, @Deductions BIGINT;
-- Fetch the basic salary, allowances, and deductions for the employee and the provided payroll period
SELECT @BasicSalary = BasicSalary, @Allowances = Allowances, @Deductions = Deductions
FROM Salary
WHERE EmployeeID = @EmployeeID AND PayrollPeriodID = @PayrollPeriodID;
IF @BasicSalary IS NULL
BEGIN
RAISERROR('Employee or PayrollPeriod not found in Salary table', 16, 1);
RETURN;
END 
-- Calculate the total salary
SET @TotalSalary = @BasicSalary + @Allowances - @Deductions;
END TRY
BEGIN CATCH
 -- Handle exceptions and return an error message
SELECT ERROR_MESSAGE() AS ErrorMessage;
SET @TotalSalary = 0;
END CATCH;
END;

--Executing (CalculateTotalSalary) StoredProcedure
DECLARE @EmployeeID INT = 10;
DECLARE @PayrollPeriodID INT = 10;
DECLARE @TotalSalary BIGINT;
EXEC CalculateTotalSalary @EmployeeID, @PayrollPeriodID, @TotalSalary  OUTPUT ;
SELECT @TotalSalary as TotalSalary;

Select * from Salary;

--2)Write a Stored Procedure to validate username and password raise error if the data already present.
Create Table Users(Id int Primary key identity (1,1),Username varchar(30),
Passwords varchar(8));
Insert into Users(Username,Passwords) values('Somu','12345678'),('Vicky','87654321'),('Rocky','99886644');
Select * from Users;

CREATE PROCEDURE ValidateUsernameAndPassword
@Username VARCHAR(50),
@Passwords VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS (SELECT 1 FROM Users WHERE Username = @Username)
BEGIN
RAISERROR('Username already exists', 16, 1);
RETURN;
END
-- Insert the new record if the username is not already present
INSERT INTO Users (Username, Passwords) VALUES (@Username, @Passwords);
END;

--Executing(ValidateUsernameandPassword) stored procedure
Declare @Username varchar(50)='Rockstar';
Declare @Passwords varchar(50)='85665656';
BEGIN TRY
    EXEC ValidateUsernameAndPassword @Username, @Passwords;
    PRINT 'User added successfully';
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

Select * from Users;

--create a stored procedure that will take the Employee ID of a person and checks if it is in the table. There are two conditions
--1)It will create a new record if the Employee ID is not stored in the table
--2)If the record is already in the table, it will update that
CREATE or ALTER PROCEDURE CreateOrUpdateEmployee
@EmployeeId INT,
@FirstName varchar(50),
@SecondName varchar(50),
@DateofBirth Date,
@Gender char(1),
@Addrress varchar(100),
@ContactNumber varchar(100),
@Email varchar(50),
@HireDate Date,
@DesignationID Int
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS (SELECT 1 FROM Employee WHERE EmployeeId = @EmployeeId)
BEGIN
-- Update the existing record
UPDATE Employee
SET FirstName = @FirstName, SecondName = @SecondName,DateofBirth=@DateofBirth,Gender=@Gender,Addrress=@Addrress,
ContactNumber=@ContactNumber,Email=@Email,HireDate=@HireDate,DesignationID=@DesignationID
WHERE EmployeeId = @EmployeeId;
END
ELSE
BEGIN
--Insert a new record
INSERT INTO Employee (EmployeeId, FirstName, SecondName)
VALUES (@EmployeeID, @FirstName, @SecondName);
END;
END;

--Execute (CreateOrUpdateEmployee) stored Procedure
Declare @EmployeeId INT=11;
Declare @FirstName VARCHAR(50)='Shilpa';
Declare @SecondName VARCHAR(50)='Shetty';
Declare @DateofBirth Date='1994-04-23';
Declare @Gender char(1)='F';
Declare @Addrress varchar(100)='KGF';
Declare @ContactNumber varchar(100)='6786786787';
Declare @Email varchar(50)='shilpa@gmail.com';
Declare @HireDate Date='2018-05-23';
Declare @DesignationID Int=11;
Exec CreateOrUpdateEmployee @EmployeeId,@FirstName,@SecondName,@DateofBirth,@Gender,
@Addrress,@ContactNumber,@Email,@HireDate,@DesignationID;

Select * from Employee;

-----Functions------
--1)Calculate Age
CREATE or ALTER FUNCTION CalculateAge 
(@DateofBirth Date)
RETURNS INT
AS
BEGIN
RETURN DATEDIFF(Year,@DateofBirth,GetDate());
END;

Select FirstName,SecondName,dbo.CalculateAge(DateofBirth) as Age from Employee ;

--2)Calcualte Total Salary
CREATE or ALTER FUNCTION CalculateSalary(
@BasicSalary BigInt,
@Allowances BigInt,
@Deductions BigInt
)
RETURNS BigInt
AS
BEGIN
RETURN (@BasicSalary+@Allowances-@Deductions);
END;

Select SalaryID,EmployeeId,BasicSalary,Allowances,Deductions,
dbo.CalculateSalary(BasicSalary,Allowances,Deductions) As TotalSalaryofEmployee from Salary;

--3)Number of Employee in Specific Department
CREATE or ALTER FUnction EmployeesInSpecificDepartment
(@DepartmentName varchar(30))
RETURNS Int
AS
BEGIN
DECLARE @CountEmployees Int;
Select @CountEmployees=COUNT(EmployeeId) From Department Where DepartmentName=@DepartmentName;
RETURN @CountEmployees;
END;

select * from Department;

DECLARE @DepartmentName VARCHAR(30) = 'Finance';
DECLARE @EmployeeCount INT;
Set @EmployeeCount = dbo.EmployeesInSpecificDepartment(@DepartmentName);
Select @EmployeeCount AS NumberOfEmployeesInDepartment;

--4)NumberOfLeavesByEmployee
CREATE or ALTER FUNCTION NumberOfLeavesByEmployee
(@EmployeeId Int)
RETURNS Int
AS
BEGIN
DECLARE @TotalLeaveDays Int;
Select @TotalLeaveDays=SUM(DATEDIFF(day,StartDate,EndDate)) from Leave where EmployeeId=@EmployeeId;
RETURN @TotalLeaveDays;
END;

Select * from Leave;

DECLARE @EmployeeId Int =6;
DECLARE @TotalLeaveDays Int;
Set @TotalLeaveDays=dbo.NumberOfLeavesByEmployee(@EmployeeId);
Select @TotalLeaveDays As NumberOfLeaves;

-----Views------
--Query using the EmployeeDetails view to get employee details along with department and manager information
CREATE or ALTER VIEW EmployeeDetails AS
Select E.EmployeeId,E.FirstName As ManagerFirstName,E.SecondName As ManagerSecondName,E.DateofBirth,E.Gender,E.Addrress,
E.ContactNumber,E.Email,E.HireDate,E.DesignationID,
D.DepartmentId AS EmployeeDepartmentId,D.DepartmentName,D.EmployeeId AS DepartmentEmployeeId
From 
Employee E,Department D 
Where E.EmployeeId=D.DepartmentId;
Select * from EmployeeDetails;

--Query using a view to get employees who have taken leaves within a specific date range
CREATE OR ALTER VIEW EmployeeLeavesSpecificDateRange AS
Select E.EmployeeId,E.FirstName,E.SecondName,
L.LeaveID,L.LeaveType,L.StartDate,L.EndDate
From
Employee E,Leave L
Where E.EmployeeId=L.LeaveID;

Select * from Leave;
Select * from EmployeeLeavesSpecificDateRange where StartDate>='2023-01-10' AND EndDate<='2023-01-20';

--Query using a view to get employees with their respective department and designation names
CREATE or ALTER VIEW EmployeeDeapartmentAndDesignationName As
Select E.EmployeeId,E.FirstName,E.SecondName,
D.DepartmentId,D.DepartmentName,DS.DesignationID,DS.DesignationName
from Employee E
Join Department D on E.EmployeeId=D.DepartmentId
Join Designation DS on E.EmployeeId= DS.DesignationID;

Select * from EmployeeDeapartmentAndDesignationName;
Select * from Department;
Select * from Designation;

--Query using a view to get employees who are managers along with their department names
CREATE or ALTER VIEW EmployeeWhoAreManagers As
Select E.EmployeeId,E.FirstName,E.SecondName,
D.DepartmentId,D.DepartmentName,DS.DesignationID,DS.DesignationName
from Employee E
Join Department D on E.EmployeeId=D.DepartmentId
Join Designation DS on E.EmployeeId= DS.DesignationID;
Select * from EmployeeWhoAreManagers where DesignationName='Manager';

----------Indexes-----------
--Query using the IX_Employee_EmployeeID index to retrieve an employee by their ID
CREATE INDEX IX_Employee_EmployeeID ON Employee(EmployeeId);
DECLARE @EmpID Int =9;
Select * from Employee where EmployeeId=@EmpID;

--Query using an index on the StartDate column to improve performance in searching for leaves within a specific date range
CREATE INDEX IX_Leave_StartDate ON Leave(StartDate);
DECLARE @Start Date='2023-01-10';
DECLARE @EndDate Date='2023-01-20';
Select * from Leave where StartDate Between @Start AND @EndDate;

--Query using an index on the DepartmentID column to optimize filtering employees by their department
CREATE INDEX IX_Department_DepartmentId ON Department(DepartmentId);
DECLARE @DepartmentId Int=4;
Select * from Department where DepartmentId=@DepartmentId;

--Query using an index on the NetSalary column to speed up searching for employees with specific salary ranges
CREATE INDEX IX_NetSalary ON Salary(NetSalary);
DECLARE @MinSalary BigInt =40000 
DECLARE @MaxSalary Bigint = 55000;
Select * from Salary where NetSalary Between @MinSalary and @MaxSalary;

--Query using an index on the DesignationName column to quickly search for employees with a specific job designation
CREATE INDEX IX_DesignationName ON Designation(DesignationName);
DECLARE @DesignationName Varchar(100)='Team Leader';
Select * from Designation Where DesignationName=@DesignationName;

----Triggers------
--Trigger to automatically update the HireDate of an employee when their record is inserted

Update Employee Set HireDate='2021-05-30' Where EmployeeId=5;

--Trigger to update the ModifiedDate of an employee when their record is updated
CREATE or ALTER TRIGGER UpdateHireDateDate  
On Employee AFTER UPDATE
AS
BEGIN
If UPDATE(HireDate)
BEGIN
UPDATE E Set HireDate=I.HireDate 
From Employee As E JOIN inserted As I ON E.EmployeeId=I.EmployeeId;
END
END;

Select * from Employee;
Update Employee Set HireDate='2021-05-30' Where EmployeeId=5;

--Trigger to delete salary records of an employee when they are deleted from the Employee table
CREATE OR ALTER TRIGGER DeleteSalaryRecords ON Employee
AFTER DELETE
AS
BEGIN
DELETE FROM Salary Where SalaryID IN (Select SalaryID From DELETED);
END;

Select * from Salary;
Delete from Salary Where SalaryID=12;

--Trigger to enforce a constraint where the EndDate of a leave must be greater than or equal to the StartDate
CREATE or ALTER TRIGGER EnforceLeaveConstraints
ON Leave AFTER INSERT,UPDATE
AS
BEGIN 
IF EXISTS (Select 1 From INSERTED Where EndDate <= StartDate  )
BEGIN
RAISERROR('End Date must be greater than or equal to StartDate', 16, 1);
ROLLBACK TRANSACTION;  -- Rollback the transaction to prevent invalid data insertion or update
RETURN;
END
END;

Select * from Leave;
Insert Into Leave(EmployeeId,LeaveType,StartDate,EndDate) values(13,'Annual','2023-01-09','2023-01-11' );
UPDATE Leave Set EndDate='2023-01-06',StartDate='2023-01-02' where LeaveID=12;

--!!Trigger to automatically insert a new record in the Salary table with default values when a new employee is added to the Employee table
CREATE or ALTER TRIGGER InsertDefaultedValuesInSalary
ON Employee AFTER INSERT 
AS
BEGIN
INSERT Into Salary (SalaryID,EmployeeId,PayrollPeriodID,BasicSalary,Allowances,Deductions,NetSalary) 
SELECT SalaryID,EmployeeId,1,0,0,0,0 FROM inserted;
END;
Insert Into Employee(FirstName,SecondName,DateofBirth,Gender,Addrress,ContactNumber,Email,HireDate,DesignationID)
Values ('Sam','Lucky','1998-08-30','M','US','8978678676','sam@gmail.com','2021-04-23',14);
Select * from Employee;
Select * from Salary;

--Trigger to update the ModifiedDate column of the Employee table when an employee's record is updated
CREATE or ALTER TRIGGER UpdateModifiedDate
ON Employee AFTER UPDATE
AS
BEGIN
IF UPDATE(FirstName) OR UPDATE(SecondName) OR UPDATE(DateOfBirth) OR UPDATE(Gender) OR UPDATE(Addrress) OR 
UPDATE(ContactNumber) OR UPDATE(Email) OR UPDATE(HireDate) 
BEGIN
Declare @ModifiedDate DateTime;
UPDATE Employee SET @ModifiedDate = GETDATE()
FROM Employee E INNER JOIN INSERTED I ON E.EmployeeId = I.EmployeeId;
END
END;

UPDATE Employee SET FirstName='Bharat',SecondName='Kumar' where EmployeeId=13;
Select * from Employee;

------Cursors-------
--Query using a cursor to fetch and display all employees' names
DECLARE @EmployeeName varchar(100);
DECLARE EmployeeCursor CURSOR For Select FirstName +''+SecondName AS EmployeeName From Employee;
OPEN EmployeeCursor;
FETCH NEXT FROM EmployeeCursor INTO @EmployeeName;
WHILE @@FETCH_STATUS = 0
BEGIN 
Print @EmployeeName;
FETCH NEXT FROM EmployeeCursor INTO @EmployeeName;
END
CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;

--Query using a cursor to update the basic salary of all employees by a certain percentage
DECLARE @SalaryID INT;
DECLARE @Percentage FLOAT;
DECLARE SalaryCursor CURSOR For Select SalaryID From Salary;
OPEN SalaryCursor;
FETCH NEXT FROM SalaryCursor INTO @SalaryID;
SET @Percentage=1.1;--10% Increase
WHILE @@FETCH_STATUS=0
BEGIN 
PRINT @SalaryID;
UPDATE Salary Set BasicSalary=BasicSalary*@Percentage Where SalaryID=@SalaryID;
FETCH NEXT FROM SalaryCursor INTO @SalaryID;
END
CLOSE SalaryCursor;
DEALLOCATE SalaryCursor;
Select * from Salary;

Alter Table Employee Drop Column LeftOrganization;
Select * from Employee;

--!!Query using a cursor to delete all employees who have left the organization
DECLARE @EmployeeId INT;
DECLARE @HireDate Date;
DECLARE @EndDate Date;
DECLARE EmployeeLeftCursor CURSOR FOR
SELECT E.EmployeeId,E.HireDate,MAX(P.EndDate) As LastUpdateDay From Employee E,PayrollPeriod P
LEFT JOIN PayrollPeriod  ON E.EmployeeId=P.PayrollPeriodID
GROUP BY E.EmployeeId,E.HireDate;
OPEN EmployeeLeftCursor;
FETCH NEXT FROM EmployeeLeftCursor INTO @EmployeeID, @HireDate,@EndDate;
While @@FETCH_STATUS =0
BEGIN
IF @HireDate = '2022-12-31' AND @EndDate < '2022-12-31'
BEGIN
DELETE FROM Employee WHERE EmployeeID = @EmployeeID;
END
FETCH NEXT FROM EmployeeLeftCursor INTO @EmployeeID, @HireDate, @EndDate;
END
CLOSE EmployeeLeftCursor;
DEALLOCATE EmployeeLeftCursor;

Select * from PayrollPeriod


--!!!Query using a cursor to update employee designations based on their years of service
DECLARE @EmployeeID INT;
DECLARE @YearsOfService INT;
DECLARE @NewDesignation VARCHAR(100);
DECLARE YearOfServiceCursor CURSOR FOR
SELECT EmployeeID, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService FROM Employee;
OPEN YearOfServiceCursor;
FETCH NEXT FROM YearOfServiceCursor INTO @EmployeeID, @YearsOfService;
WHILE @@FETCH_STATUS = 0
BEGIN
IF @YearsOfService >= 5 SET @NewDesignation = 'Senior ';
ELSE
SET @NewDesignation = 'Same Designation';
UPDATE Designation SET DesignationName = @NewDesignation
WHERE DesignationID = @EmployeeID;
FETCH NEXT FROM YearOfServiceCursor INTO @EmployeeID, @YearsOfService;
END
CLOSE YearOfServiceCursor;
DEALLOCATE YearOfServiceCursor;

Select * from Designation

--Query using a cursor to calculate the total salary for each employee and display the results
DECLARE @SalaryID Int;
DECLARE @TotalSalary BIGINT;
DECLARE TotalSalaryCursor CURSOR FOR SELECT SalaryID FROM Salary;
OPEN TotalSalaryCursor;
FETCH NEXT FROM TotalSalaryCursor INTO @SalaryID;
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @TotalSalary = SUM(BasicSalary+Allowances+Deductions) FROM Salary
WHERE SalaryID = @SalaryID;
PRINT 'SalaryID: ' + CAST(@SalaryID AS VARCHAR(10)) + ', Total Salary: ' + CAST(@TotalSalary AS VARCHAR(20));
FETCH NEXT FROM TotalSalaryCursor INTO @SalaryID;
END
CLOSE TotalSalaryCursor;
DEALLOCATE TotalSalaryCursor;
Select * from Salary;

--6.!!!Cursor to update the salary of employees based on their performance rating:
--Suppose we have an EmployeePerformance table that contains the EmployeeID and their corresponding PerformanceRating.
--We want to update the salary of employees based on their PerformanceRating. 
--Employees with a PerformanceRating of 'Excellent' will receive a 10% salary increase,
--'Good' will receive a 5% increase, and 'Average' will receive a 2% increase
Create Table EmployeePerformance(PerformanceId Int Primary Key identity(1,1),
EmployeeId Int Foreign key dbo.Employee(EmployeeId),





DECLARE @SalaryID INT, @PerformanceRating VARCHAR(20), @SalaryIncreasePercent DECIMAL(5, 2);
DECLARE UpdateSalaryBasedOnPerformanceCursor CURSOR FOR
SELECT SalaryID, PerformanceRating FROM EmployeePerformance;
OPEN EmployeeCursor;
FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @PerformanceRating;
WHILE @@FETCH_STATUS = 0
BEGIN
IF @PerformanceRating = 'Excellent'
 SET @SalaryIncreasePercent = 0.10; -- 10% increase for Excellent performance
ELSE IF @PerformanceRating = 'Good'
 SET @SalaryIncreasePercent = 0.05; -- 5% increase for Good performance
ELSE IF @PerformanceRating = 'Average'
 SET @SalaryIncreasePercent = 0.02; -- 2% increase for Average performance
ELSE
 SET @SalaryIncreasePercent = 0; -- No increase for other performance ratings   
UPDATE Salary
SET BasicSalary = BasicSalary + (BasicSalary * @SalaryIncreasePercent)
WHERE EmployeeID = @EmployeeID;
FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @PerformanceRating;
END
CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;

--7.!!!Cursor to assign a default department for employees who don't have one:
--Suppose we have a Department table with a default department (DepartmentID = 1) representing employees without an assigned department.
--We want to check if any employees have a NULL DepartmentID and assign them to the default department.
DECLARE @DepartmentId INT;
DECLARE @EmployeeId INT;
DECLARE DefaultDepartmentCursor CURSOR FOR
SELECT DepartmentId FROM Department WHERE DepartmentId IS NULL;
OPEN DefaultDepartmentCursor;
FETCH NEXT FROM DefaultDepartmentCursor INTO @DepartmentId;
WHILE @@FETCH_STATUS = 0
BEGIN
SET @DepartmentId = 1; -- Default department ID for employees without an assigned department    
UPDATE Department SET DepartmentId = @DepartmentID WHERE EmployeeID = @EmployeeId;  
FETCH NEXT FROM DefaultDepartmentCursor INTO @DepartmentId;
END
CLOSE DefaultDepartmentCursor;
DEALLOCATE DefaultDepartmentCursor;

-------Subquery--------
--Query to get employees who have salaries greater than the average salary in their department
Select E.EmployeeId,E.FirstName,E.SecondName,S.SalaryID,S.NetSalary From Employee E,Salary S
Where NetSalary >(Select AVG(NetSalary) From Salary 
Where E.EmployeeId=S.SalaryID);

Select AVG(NetSalary) As AverageSalary from Salary;

--Query to retrieve employees who have taken leaves longer than the average leave duration
Select E.EmployeeId,E.FirstName,E.SecondName,L.LeaveID,DATEDIFF(Day,L.StartDate,L.EndDate ) As LeavesDuration
from Employee E,Leave L
Where DATEDIFF(DAY,StartDate,EndDate)>(Select AVG(DATEDIFF(DAY,StartDate,EndDate)) From Leave);

Select AVG(DATEDIFF(Day,StartDate,EndDate ))As AverageLeaves from Leave;

--Query to get employees whose salary is within 10% of the highest salary in their department
Select E.EmployeeId,E.FirstName,E.SecondName,S.SalaryID,S.BasicSalary,D.DepartmentId,D.DepartmentName From Employee E,Salary S,Department D
Where BasicSalary >= (Select MAX(BasicSalary) * 0.9  From Salary 
Where E.EmployeeId=S.SalaryID And D.DepartmentId=S.SalaryID);

Select MAX(BasicSalary)*0.1 As AverageBasicPay from Salary;
Select *  from Salary;

