--🟢 Easy-Level Tasks (10)
--Write a query to find the minimum (MIN) price of a product in the Products table.
SELECT MIN(Price) AS MinPrice
FROM Products;
--Write a query to find the maximum (MAX) Salary from the Employees table.
SELECT MAX(Salary) AS MaxSalary
FROM Employees;
--Write a query to count the number of rows in the Customers table.
SELECT COUNT(*) AS TotalCustomers
FROM Customers;
--Write a query to count the number of unique product categories from the Products table.
SELECT COUNT(DISTINCT Category) AS UniqueCategoryCount
FROM Products;
--Write a query to find the total sales amount for the product with id 7 in the Sales table.
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;
--Write a query to calculate the average age of employees in the Employees table.
SELECT AVG(Age) AS AverageAge
FROM Employees;
--Write a query to count the number of employees in each department.
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;
--Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
SELECT Category, 
       MIN(Price) AS MinPrice, 
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;
--Write a query to calculate the total sales per Customer in the Sales table.
SELECT CustomerID, 
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;
--Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).
SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;
--🟠 Medium-Level Tasks (9)
--Write a query to calculate the total sales and average sales for each product category from the Sales table.
--имеется ошибка в задании, в таблице Sales нет информации о категориях
Select ProductCategory, sum(SaleAmount) as total_sales, avg(SaleAmount) as avg_sales from Sales
group by ProductCategory

--Write a query to count the number of employees from the Department HR.
SELECT COUNT(*) AS employee_count
FROM Employees
WHERE DepartmentName = 'HR';

--Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
SELECT 
    DepartmentName,
    MAX(Salary) AS highest_salary,
    MIN(Salary) AS lowest_salary
FROM 
    Employees
GROUP BY 
    DepartmentName;
--Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
SELECT 
    DepartmentName,
    AVG(Salary) AS average_salary
FROM 
    Employees
GROUP BY 
    DepartmentName;
--Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
SELECT 
    DepartmentName,
    AVG(Salary) AS average_salary,
    COUNT(*) AS employee_count
FROM 
    Employees
GROUP BY 
    DepartmentName;
--Write a query to filter product categories with an average price greater than 400.
SELECT 
    Category,
    AVG(price) AS average_price
FROM 
    Products
GROUP BY 
    Category
HAVING 
    AVG(price) > 400;
--Write a query that calculates the total sales for each year in the Sales table.
SELECT 
    YEAR(SaleDate) AS sales_year,
    SUM(SaleAmount) AS total_sales
FROM 
    Sales
GROUP BY 
    YEAR(SaleDate)
ORDER BY 
    sales_year;
	
--Write a query to show the list of customers who placed at least 3 orders.
SELECT 
    customer_id,
    COUNT(*) AS order_count
FROM 
    Orders
GROUP BY 
    customer_id
HAVING 
    COUNT(*) >= 3;
--Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).
SELECT 
    DepartmentName,
    AVG(Salary) AS average_salary
FROM 
    Employees
GROUP BY 
    DepartmentName
HAVING 
    AVG(Salary) > 60000;
--🔴 Hard-Level Tasks (6)
--Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.
SELECT 
	Category,
	AVG(Price) as AvgPrice
FROM
	Products
GROUP BY 
	Category
HAVING
	AVG(Price) > 150;
--Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.
SELECT
	CustomerID,
	SUM(SaleAmount) as TotalSales
FROM 
	Sales
GROUP BY
	CustomerID
HAVING 
	SUM(SaleAmount) > 1500;

--Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.
SELECT 
    DepartmentName,
    SUM(Salary) AS total_salary,
    AVG(Salary) AS average_salary
FROM 
    Employees
GROUP BY 
    DepartmentName
HAVING 
    AVG(Salary) > 65000;
--Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
SELECT * from
    customer_id,
    SUM(CASE WHEN freight > 50 THEN freight ELSE 0 END) AS total_freight_over_50,
    MIN(freight) AS least_freight
FROM 
    tsql2012.sales.orders
GROUP BY 
    customer_id;
--Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)
SELECT 
    YEAR(OrderDate) AS sales_year,
    MONTH(OrderDate) AS sales_month,
    SUM(TotalAmount) AS total_sales,
    COUNT(DISTINCT ProductID) AS unique_products_sold
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate)
HAVING 
    COUNT(DISTINCT ProductID) >= 2
ORDER BY 
    sales_year,
    sales_month;
--Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:
SELECT 
    YEAR(OrderDate) AS order_year,
    MIN(Quantity) AS min_quantity,
    MAX(Quantity) AS max_quantity
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate)
ORDER BY 
    order_year;
