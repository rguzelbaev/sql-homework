--🟢 Easy (10 puzzles)

--Using Products, Suppliers table List all combinations of product names and supplier names.
select p.ProductName, s.SupplierName 
from Products p
cross join Suppliers s
--Using Departments, Employees table Get all combinations of departments and employees.
select d.DepartmentName, e.Name
from Departments d
cross join Employees e
--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
select s.SupplierName, p.ProductName from Products p
join suppliers s
on p.SupplierID=s.SupplierID;
--Using Orders, Customers table List customer names and their orders ID.
select c.FirstName, c.LastName, o.orderID 
from Orders o
join Customers c
on o.CustomerID = c.CustomerID;
--Using Courses, Students table Get all combinations of students and courses.
select s.Name, c.CourseName from Students s
cross join Courses c;
--Using Products, Orders table Get product names and orders where product IDs match.
select p.ProductName, o.OrderID from Products p
join Orders o
on p.ProductID=o.ProductID;
--Using Departments, Employees table List employees whose DepartmentID matches the department.
select e.EmployeeID, e.Name, d.DepartmentName 
from Departments d
join Employees e
on d.DepartmentID=e.DepartmentID;
--Using Students, Enrollments table List student names and their enrolled course IDs.
select s.StudentID, s.Name, e.CourseID from Students s
join Enrollments e
on s.StudentID=e.StudentID;
--Using Payments, Orders table List all orders that have matching payments.
select o.OrderID, o.OrderDate, p.PaymentID, p.PaymentDate, p.Amount from Payments p
join Orders o
on o.OrderID=p.OrderID
--Using Orders, Products table Show orders where product price is more than 100.
select o.OrderID, o.OrderDate, p.ProductName, p.Price from Orders o
join Products p on o.ProductID=p.ProductID 
where p.Price > 100;
--🟡 Medium (10 puzzles)
--Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
select e.Name, d.DepartmentName 
from Employees e
cross join Departments d 
where e.DepartmentID<>d.DepartmentID;
--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select o.OrderID, o.productID, o.Quantity as OrderedQuantity, p.ProductName, p.StockQuantity 
from Orders o
join Products p on o.ProductID=p.ProductID
where o.Quantity > p.StockQuantity;
--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
select c.FirstName, c.LastName, s.ProductID, s.SaleAmount from Customers c
join Sales s
on c.CustomerID=s.CustomerID
where s.SaleAmount > 500;
--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
select s.Name, c.CourseName 
from Students s
join Enrollments e on s.StudentID = e.StudentID
join Courses c on c.CourseID = e.CourseID;
--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
select p.ProductName, s.SupplierName from Products p
join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName like '%Tech%';
--Using Orders, Payments table Show orders where payment amount is less than total amount.
select o.OrderID, o.TotalAmount, p.Amount as PaymentAmount
from Orders o
join Payments p on o.OrderID = p.OrderID
where p.Amount < o.TotalAmount;
--Using Employees and Departments tables, get the Department Name for each employee.
select e.EmployeeID, e.Name, d.DepartmentName 
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;
--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
select p.ProductName, c.CategoryName
from Products p
join Categories c on p.Category = c.CategoryID
where c.CategoryName in ('Electronics', 'Furniture');
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
select s.SaleID, s.ProductID, s.SaleAmount, c.FirstName, c.LastName, c.Country
from Sales s
join Customers c on s.CustomerID = c.CustomerID
where c.Country = 'USA';
--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select o.OrderID, o.OrderDate, o.TotalAmount, c.FirstName, c.LastName, c.Country 
from Orders o
join Customers c on o.CustomerID = c.CustomerID
where c.Country = 'Germany' 
	and o.TotalAmount > 100;
--🔴 Hard (5 puzzles)(Do some research for the tasks below)
--Using Employees table List all pairs of employees from different departments.
SELECT 
  e1.EmployeeID AS Employee1_ID,
  e1.Name AS Employee1_Name,
  e1.DepartmentID AS Dept1,
  
  e2.EmployeeID AS Employee2_ID,
  e2.Name AS Employee2_Name,
  e2.DepartmentID AS Dept2

FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;
--Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select p.PaymentID, p.OrderID, p.Amount as PaidAmount, o.Quantity, pr.ProductName, pr.Price, (o.Quantity*pr.Price) as ExpectedAmount
from Payments p
join Orders o on p.OrderID = p.OrderID
join Products pr on o.ProductID = pr.ProductID
where p.Amount <> o.Quantity * pr.Price;
--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
select s.StudentID, s.Name 
from Students s
left join Enrollments e on s.StudentID = e.StudentID
where e.CourseID is null;
--Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.

select 
	m.EmployeeID as ManagerID,
	m.Name as ManagerName,
	m.Salary as ManagerSalary,

	e.EmployeeID as EmployeeID,
	e.Name as EmployeeName,
	e.Salary as EmployeeSalary
from Employees e
join Employees m on e.ManagerID = m.EmployeeID
where m.Salary <= e.Salary

--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
select distinct c.CustomerID, c.FirstName, c.LastName, o.OrderID
from Orders o
join Customers c on o.CustomerID=c.CustomerID
left join Payments p on o.OrderID=p.OrderID
where p.OrderID is null;
