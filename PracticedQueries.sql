-----Practice Quries----
Select * from Employee Order By FirstName;
Select * from Employee where Gender='M';
Select SUM(NetSalary) as Total_Salary from Salary;
Select * from Salary where BasicSalary >50000 and EmployeeId=3;
Select FirstName from Employee where Addrress='Banglore';
Select Distinct BasicSalary,EmployeeId,SalaryID,NetSalary from Salary where SalaryID%2=0;
Select (Count(Gender)-COUNT(Distinct Gender)) from Employee;

Select COUNT(Addrress) as MaximumLength ,MAX(Addrress) as LongestWord from Employee where EmployeeId=2;
Select Len(Addrress)as Length from Employee;

SELECT TOP 1 WITH TIES Addrress, LEN(Addrress) AS Length FROM Employee
ORDER BY LEN(Addrress), Addrress;

SELECT TOP 1 WITH TIES Addrress,  LEN(Addrress) AS Length FROM Employee
ORDER BY LEN(Addrress) DESC, Addrress;

SELECT DISTINCT Addrress 
from Employee 
where Addrress LIKE 'A%' OR Addrress LIKE 'E%' or Addrress LIKE 'I%' or Addrress LIKE 'O%' or Addrress LIKE 'U%';

SELECT DISTINCT SecondName
FROM Employee
WHERE UPPER(SUBSTRING(SecondName, 1, 1)) IN ('A', 'E', 'I', 'O', 'U')
AND UPPER(SUBSTRING(SecondName, LEN(SecondName), 1)) IN ('A', 'E', 'I', 'O', 'U');

SELECT DISTINCT SecondName
FROM Employee
WHERE UPPER(SUBSTRING(SecondName, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
AND UPPER(SUBSTRING(SecondName, LEN(SecondName), 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
--Joins
--stored procedure
Create or Alter Procedure Validate
@username varchar(20),
@password varchar(20)
As
Begin
set nocount on;
Begin Try
Select @username=Username,@password=Passwords  From Users;
If Exists (Select 1 From Users where @username=Username)
Begin
RaisError ('Username already Exits',16,1);
Return;
End
Insert into Users(Username,Passwords) values(@username,@password);
End Try
Begin Catch
Select ERROR_MESSAGE() As ErrorMessage;
End Catch
End;

Declare @username varchar(20) ='Monday';
Declare @password varchar(10) ='6575688';
Exec Validate @username,@password;
Select * from Users
-----Functions----
--LEN, SUBSTRING, REPLACE, CONCAT, TRIM(LTRIM and RTRIM),datetime, datetime2, smalldatetime,COUNT, MAX, MIN, SUM,
--AVG,ABS, POWER, PI, EXP, LOG,RANK, DENSE_RANK, ROW_NUMBER, NTILE
Select LEN(FirstName) from Employee;
Select (SUBSTRING(FirstName,1,3))as SubStringofFirstName,(SUBSTRING(SecondName,2,3)) as SubStringofFirstName from Employee;
Select REPLACE(FirstName,'Soma','M') As Replacedchar from Employee;
Select CONCAT(FirstName,' Dummy') as ConcatedMessage from Employee;
Select TRIM(FirstName) as Trimmed from Employee;
Select HireDate from Employee;
Select ABS(BasicSalary) as AbsoluteValue from Salary;
Select FirstName,SecondName,DATEDIFF(year,DateofBirth,GETDATE()) as Age from Employee;
-----Views------
--Single view
Create or Alter View SingleViewData As
Select EmployeeId,FirstName,SecondName,Addrress From Employee
Where EmployeeId >5;
Select * from SingleViewData;
--Multiple view
Create or Alter View MultipleViewData As
Select Employee.EmployeeId,Employee.FirstName,Employee.SecondName,Leave.LeaveType from Employee,Leave
Where Employee.EmployeeId=Leave.EmployeeId;
Select * from MultipleViewData where EmployeeId=2;
--Indexes----
Create Index UniqueIndex_Employee
On Training(Trainer);

Select * from Training Where Trainer='Manish';

------Triggers-----
