SELECT *FROM Employees;


--task 3
SELECT MAX(Salary) AS salary 
FROM Employees 
WHERE salary <> (SELECT MAX(Salary) 
FROM Employees);


--task 4
--  To perform the SQL statement for to lists the number of employees in each department.
Alter table Employees
Add DName varchar(50);

update Employees
set Dname='HR'
where EmployeeID=1;

update Employees
set Dname='Sales'
where EmployeeID=2;

update Employees
set Dname='Sales'
where EmployeeID=3;

select * from Employees;

Select count(firstName),DName
From Employees
Group By DName;