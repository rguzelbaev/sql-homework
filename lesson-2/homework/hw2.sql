--1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
--2.Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
--single-row insert
insert into Employees values (1, 'Ivan', 50000000) --Пример 1, ставка первой строки
insert into Employees (Name,  Salary, EmpID) values ('Vladimir', 10000000, 2) --Пример 2, вставка второй строки
insert into Employees select 3, 'Anton', 70000000 --Пример 3, вставка третьей строки
--multiple-row insert, пример 1
insert into Employees (Name,  Salary, EmpID) values 
('Ivan', 50000000, 1),
('Vladimir', 10000000, 2),
('Anton', 70000000, 3);
--multiple-row insertб --пример 2
insert into Employees
select 1,  'Ivan', 50000000
UNION ALL
select 2, 'Vladimir', 10000000
UNION ALL
select 3, 'Anton', 70000000;
--3. Update the Salary of an employee to 7000 where EmpID = 1.
Update Employees
set Salary = 7000
where EmpID=1;
--4. Delete a record from the Employees table where EmpID = 2.
delete from Employees
where EmpID=2;
--5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
--delete предназначен для удаления данных (записей). Данные в освновном удалются по заданному условию, если не поставить условия удаляться все данные таблицы.
--truncate удаляет все записи таблицы, сохраняя ее структуру (не требуя условия), drop удаляет всю таблицу или базу данных.
--6. Modify the Name column in the Employees table to VARCHAR(100).
alter table Employees
alter column Name varchar(100);
--7.Add a new column Department (VARCHAR(50)) to the Employees table.
alter table Employees
add Department varchar(50)
--8.Change the data type of the Salary column to FLOAT.
alter table Employees
alter column Salary FLOAT
--9.Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
create table Departments (id int primary key, DepartmentName VARCHAR(50))
--10.Remove all records from the Employees table without deleting its structure.
truncate table Employees
--11 Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
insert into Departments
select 1, 'Cred'
Union all
select 2, 'Monitoring'
Union all
select 3, 'Finance'
Union all
select 4, 'HR'
Union all
select 5, 'Acounting';
--12 Update the Department of all employees where Salary > 5000 to 'Management'.
update Employees
set Department = 'Management'
where Salary>5000;
--13 Write a query that removes all employees but keeps the table structure intact.
truncate table Employees
--или
delete from Employees
--14 Drop the Department column from the Employees table.
alter table Employees
drop column Department
--15 Rename the Employees table to StaffMembers using SQL commands.
EXEC sp_rename 'Employees', 'StaffMembers'
--или можно создать копию таблицы с новым именем, а потом удалить оригинал таблицы
select * into StaffMembers from Employees Employees;
drop table Employees;
--16 Write a query to completely remove the Departments table from the database.
drop table Departments
--17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
create table Products (ProductID int Primary Key, ProductName VARCHAR(50), Category VARCHAR(50), Price DECIMAL, Branch varchar(10))
--18. Add a CHECK constraint to ensure Price is always greater than 0.
alter table Products
add constraint ck_price check (Price > 0)
--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
alter table Products
add StockQuantity int default 50;
--20. Rename Category to ProductCategory
ALTER TABLE Products
RENAME COLUMN Category TO ProductCategory;

--21. Insert 5 records into the Products table using standard INSERT INTO queries.
insert into Products values 
(1, 'cred', 'bank', 190, 'head', null),
(2, 'dep', 'bank', 150, 'filial', 60),
(3, 'cred', 'bank', 190, 'head', default),
(4, 'dep', 'bank', 250, 'head', 70),
(5, 'cred', 'lizing', 400, 'head', 80);
--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
select * into Products_Backup from Products;
--23. Rename the Products table to Inventory.
EXEC sp_rename 'Products', 'Inventory'
--24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
ALTER TABLE Inventory
Alter COLUMN Price FLOAT;
--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
ALTER TABLE Inventory
add ProductCode int identity(1000,5)
