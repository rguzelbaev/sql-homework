--Lesson 5: Aliases, Unions, and Conditional columns


--Easy-Level Tasks
--Write a query that uses an alias to rename the ProductName column as Name in the Products table.
SELECT  
    ProductName AS Name
FROM
    Products;
--Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT * FROM Customers AS Client;
--Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
--Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
SELECT ProductID FROM Products
intersect
SELECT ProductID FROM Products_Discounted;
--Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT FirstName, LastName, Country FROM Customers
--Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
select ProductID, ProductName, Price,
case 
	when Price > 1000 then 'Hign'
	else  'Low'
end as PriceCategory
from Products;
--Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
SELECT 
    ProductID,
    ProductName,
    StockQuantity,
    IIF(StockQuantity > 100, 'Yes', 'No') AS InStockOver100
FROM Products_Discounted;
--Medium-Level Tasks
--Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
select ProductName from Products
union
select ProductName from Products_Discounted
--Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
select ProductName from Products
except
select ProductName from Products_Discounted
--Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
select ProductID, ProductName, Price,
IIF (Price >1000, 'Expensive', 'Affordable') as PriceCategory
from Products
--Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
select * from Employees
where Age < 25 or Salary > 60000
--Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
update Employees
set Salary = Salary * 1.10
where DepartmentName='HR' or EmployeeID=5;
--Hard-Level Tasks
--Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
select *,
	case
		when SaleAmount >500 then 'Top Tier'
		when SaleAmount between 200 and 500 then 'Mid Tier'
		else 'Low Tier'
		end as Tier
from Sales
--Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Sales table.
SELECT CustomerID FROM Orders
except
SELECT CustomerID FROM Sales;
--Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
select CustomerID, Quantity,
	case
		when Quantity=1 then 0.03
		when Quantity between 1 and 3 then 5
		else 0.07
	end as discount
from orders


