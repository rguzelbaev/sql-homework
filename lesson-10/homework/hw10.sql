--🟢 Easy-Level Tasks (10)
--Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName
--Task 1: Employees with Salary > 50000 and Department Names
SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 50000;
--Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
--🔁 Expected Columns: FirstName, LastName, OrderDate
--Task 2: Customers and Orders in 2023
SELECT C.FirstName, C.LastName, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE Year(O.OrderDate) = 2023;
--Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
--🔁 Expected Columns: EmployeeName, DepartmentName
--Task 3: All Employees with (or without) Department Names
SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;
--Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
--🔁 Expected Columns: SupplierName, ProductName
--Task 4: All Suppliers, including suppliers who don’t supply any products
select s.SupplierName, p.ProductName 
from Products p
right join Suppliers s on p.SupplierID = s.SupplierID;
--Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
--Task 5: Orders and Payments (include unmatched from both sides)
SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;
--Using the Employees table, write a query to show each employee's name along with the name of their manager.
--🔁 Expected Columns: EmployeeName, ManagerName
--Task 6: Employees with their Manager Names
SELECT E.Name AS EmployeeName, M.Name AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;
--Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
--🔁 Expected Columns: StudentName, CourseName
--Task 7: Students enrolled in Math 101
SELECT S.Name as StudentName, C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Math 101';
--Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
--🔁 Expected Columns: FirstName, LastName, Quantity
--Task 8: Customers who placed orders with more than 3 items
SELECT C.FirstName, C.LastName, O.Quantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;
--Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
--🔁 Expected Columns: EmployeeName, DepartmentName
--Task 9: Employees working in Human Resources
SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human Resources';
--🟠 Medium-Level Tasks (9)
--Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
--🔁 Expected Columns: DepartmentName, EmployeeCount
--Task 10: Departments with more than 5 employees
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Departments D
JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;
--Using the Products and Sales tables, write a query to find products that have never been sold.
--🔁 Expected Columns: ProductID, ProductName
select p.ProductID, p.ProductName 
from Products p
left join Sales s on p.ProductID = s.ProductID
where s.SaleID is null
--Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--🔁 Expected Columns: FirstName, LastName, TotalOrders
select c.FirstName, c.LastName, count(o.OrderID) as TotalOrders 
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName;
--Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.Name as EmployeeName, d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID

--Using the Employees table, write a query to find pairs of employees who report to the same manager.
--🔁 Expected Columns: Employee1, Employee2, ManagerID

--Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
--🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName
select o.OrderID, o.OrderDate, c.FirstName, c.LastName 
from Orders o
inner join Customers c on o.CustomerID = c.CustomerID
where year(o.OrderDate) = 2022;

--Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName
select e.Name as EmployeeName, e.Salary, d.DepartmentName 
from Employees e
join Departments as d on e.DepartmentID = d.DepartmentID
where e.Salary > 60000
--Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM 
    Orders o
INNER JOIN 
    Payments p ON o.OrderID = p.OrderID;
--Using the Products and Orders tables, write a query to find products that were never ordered.
--🔁 Expected Columns: ProductID, ProductName
SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Orders o ON p.ProductID = o.ProductID
WHERE 
    o.ProductID IS NULL;
--🔴 Hard-Level Tasks (9)
--Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
--🔁 Expected Columns: EmployeeName, Salary
SELECT 
    e.Name as EmployeeName,
    e.Salary
FROM 
    Employees e
WHERE 
    e.Salary > (
        SELECT 
            AVG(e2.Salary)
        FROM 
            Employees e2
        WHERE 
            e2.DepartmentID = e.DepartmentID
    );
--Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate
SELECT 
    o.OrderID,
    o.OrderDate
FROM 
    Orders o
LEFT JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE 
    o.OrderDate < '2020-01-01'
    AND p.OrderID IS NULL;
--Using the Products and Categories tables, write a query to return products that do not have a matching category.
--🔁 Expected Columns: ProductID, ProductName
SELECT 
    p.ProductID,
    p.ProductName as ProductName
FROM 
    Products p
LEFT JOIN 
    Categories c ON p.Category = c.CategoryID
WHERE 
    c.CategoryID IS NULL;
--Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
--🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary
SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.ManagerID,
    e1.Salary
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE 
    e1.EmployeeID < e2.EmployeeID  -- avoid duplicates and self-pairing
    AND e1.Salary > 60000
    AND e2.Salary > 60000;
SELECT * FROM Employees
--Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
--🔁 Expected Columns: EmployeeName, DepartmentName
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName LIKE 'M%';
--Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
--🔁 Expected Columns: SaleID, ProductName, SaleAmount
SELECT 
    s.SaleID,
    p.ProductName,
    s.SaleAmount
FROM 
    Sales s
INNER JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    s.SaleAmount > 500;
--Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
--🔁 Expected Columns: StudentID, StudentName
SELECT s.StudentID, s.Name AS StudentName
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.StudentID = s.StudentID
      AND c.CourseName = 'Math 101'
);
--Using the Orders and Payments tables, write a query to return orders that are missing payment details.
--🔁 Expected Columns: OrderID, OrderDate, PaymentID
SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
--Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
--🔁 Expected Columns: ProductID, ProductName, CategoryName
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
