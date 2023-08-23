[dbo].[Employees]

select * from Employees;
select * from Departments;

update Employees
set DepartmentID=1
where EmployeeID=1;

update Employees
set DepartmentID=2
where EmployeeID=2;

update Employees
set DepartmentID=3
where EmployeeID=3;

update Employees
set DepartmentID=4
where EmployeeID=4;

update Employees
set DepartmentID=5
where EmployeeID=5;

alter table Employees
drop column Department;

--inner join--
select Departments.DepartmentName,Employees.FirstName,Employees.LastName
from   Employees
inner join Departments on Departments.DepartmentID=Employees.DepartmentID;

--left join--
select Employees.FirstName,Employees.LastName,Departments.DepartmentName
from   Employees
left join Departments on Departments.DepartmentID=Employees.DepartmentID;

--right join--
select Departments.DepartmentName,Employees.FirstName,Employees.LastName
from   Employees
right join Departments on Departments.DepartmentID=Employees.DepartmentID;

--full outer join
select Departments.DepartmentName,Employees.FirstName,Employees.LastName
from   Employees
full outer join Departments on Departments.DepartmentID=Employees.DepartmentID;

--self join
select e1.FirstName as Employee1,e2.FirstName as Employee2
from Employees e1
inner join Employees e2 on e1.DepartmentID = e2.DepartmentID AND e1.EmployeeID <> e2.EmployeeID;

