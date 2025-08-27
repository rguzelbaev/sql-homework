create database hw_lesson_16;
use hw_lesson_16;

--Вопросы
# Lesson-16: CTEs and Derived Tables

> **Notes before doing the tasks:**
> - Tasks should be solved using **SQL Server**.
> - Case insensitivity applies.
> - Alias names do not affect the score.
> - Scoring is based on the **correct output**.
> - One correct solution is sufficient.

---
# Easy Tasks

1. Create a numbers table using a recursive query from 1 to 1000.
2. Write a query to find the total sales per employee using a derived table.(Sales, Employees)
3. Create a CTE to find the average salary of employees.(Employees)
4. Write a query using a derived table to find the highest sales for each product.(Sales, Products)
5. Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.
6. Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)
7. Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)
8. Create a CTE to find employees with salaries above the average salary.(Employees)


# Medium Tasks
1. Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)
2. Write a query using a derived table to find the sales per product category.(Sales, Products)
3. Write a script to return the factorial of each value next to it.(Numbers1)
4. This script uses recursion to split a string into rows of substrings for each character in the string.(Example)
5. Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)
6. Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)


# Difficult Tasks
1. This script uses recursion to calculate Fibonacci numbers
2. Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)
3. Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)
4. Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)
5. Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)

```sql

CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);
```



--Ответы
✅ Easy Task 1: Create a numbers table using a recursive query from 1 to 1000
WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1 FROM Numbers WHERE Num < 1000
)
SELECT * FROM Numbers
OPTION (MAXRECURSION 1000);

✅ Easy Task 2: Find total sales per employee using a derived table
select * from employees
select * from sales

SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    DT.TotalSales
FROM Employees E
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS DT ON E.EmployeeID = DT.EmployeeID;


✅ Easy Task 3: CTE to find the average salary of employees
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AverageSalary FROM Employees
)
SELECT * FROM AvgSalary;

✅ Easy Task 4: Highest sales for each product using derived table
SELECT 
    P.ProductID,
    P.ProductName,
    MaxSales.MaxSale
FROM Products P
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) AS MaxSales ON P.ProductID = MaxSales.ProductID;

✅ Easy Task 5: Double the number until max value is < 1,000,000
WITH Doubles AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num * 2 FROM Doubles WHERE Num * 2 < 1000000
)
SELECT * FROM Doubles;

✅ Easy Task 6: CTE to get employee names who made more than 5 sales
WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName
FROM Employees E
JOIN SalesCount SC ON E.EmployeeID = SC.EmployeeID
WHERE SC.SaleCount > 5;

✅ Easy Task 7: CTE to find products with sales > $500
WITH HighSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
    HAVING SUM(SalesAmount) > 500
)
SELECT 
    P.ProductID,
    P.ProductName,
    HS.TotalSales
FROM Products P
JOIN HighSales HS ON P.ProductID = HS.ProductID;

✅ Easy Task 8: CTE to find employees with salaries above average
WITH AvgSal AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT E.*
FROM Employees E
CROSS JOIN AvgSal
WHERE E.Salary > AvgSal.AvgSalary;

✅ Medium Task 1: Top 5 employees by number of orders using a derived table
SELECT TOP 5 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    S.OrderCount
FROM Employees E
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) AS S ON E.EmployeeID = S.EmployeeID
ORDER BY S.OrderCount DESC;

✅ Medium Task 2: Sales per product category using a derived table
SELECT 
    P.CategoryID,
    SUM(S.SalesAmount) AS TotalSales
FROM (
    SELECT ProductID, SalesAmount
    FROM Sales
) AS S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.CategoryID;

✅ Medium Task 3: Return the factorial of each value in Numbers1
WITH FactorialCTE AS (
    SELECT Number, 1 AS Factorial, Number AS Counter
    FROM Numbers1
    UNION ALL
    SELECT f.Number, f.Factorial * f.Counter, f.Counter - 1
    FROM FactorialCTE f
    WHERE f.Counter > 1
)
SELECT 
    Number,
    MAX(Factorial) AS FactorialResult
FROM FactorialCTE
GROUP BY Number
ORDER BY Number
OPTION (MAXRECURSION 1000);

✅ Medium Task 4: Recursively split a string into characters (from Example)
WITH SplitCTE AS (
    SELECT 
        Id,
        CAST(LEFT(String, 1) AS VARCHAR(1)) AS Char,
        RIGHT(String, LEN(String) - 1) AS Remaining
    FROM Example
    WHERE LEN(String) > 0

    UNION ALL

    SELECT 
        Id,
        CAST(LEFT(Remaining, 1) AS VARCHAR(1)) AS Char,
        RIGHT(Remaining, LEN(Remaining) - 1)
    FROM SplitCTE
    WHERE LEN(Remaining) > 0
)
SELECT Id, Char
FROM SplitCTE
ORDER BY Id
OPTION (MAXRECURSION 1000);

✅ Medium Task 5: CTE to calculate sales difference between current and previous month
WITH MonthlySales AS (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesDiff AS (
    SELECT 
        SaleMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PrevMonthSales
    FROM MonthlySales
)
SELECT 
    SaleMonth,
    TotalSales,
    PrevMonthSales,
    TotalSales - ISNULL(PrevMonthSales, 0) AS SalesDifference
FROM SalesDiff;

✅ Medium Task 6: Employees with sales over $45000 in each quarter (using derived table)
SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    Q.Quarter,
    Q.TotalSales
FROM Employees E
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS Q ON E.EmployeeID = Q.EmployeeID;


✅ Difficult Task 1: Recursive Fibonacci numbers

Let’s assume you want the first 20 Fibonacci numbers:

WITH Fibonacci AS (
    SELECT 1 AS Position, 0 AS Value
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT Position + 1, 
           (SELECT Value FROM Fibonacci WHERE Position = F.Position - 1) +
           (SELECT Value FROM Fibonacci WHERE Position = F.Position - 2)
    FROM Fibonacci F
    WHERE Position < 20
)
SELECT * FROM Fibonacci
ORDER BY Position
OPTION (MAXRECURSION 1000);

✅ Difficult Task 2: Find strings with all same characters and length > 1 (FindSameCharacters)
SELECT *
FROM FindSameCharacters
WHERE 
    Vals IS NOT NULL AND
    LEN(Vals) > 1 AND
    LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;

✅ Difficult Task 3: Recursive pattern like 1, 12, 123... up to n = 5
DECLARE @n INT = 5;

WITH NumSeq AS (
    SELECT 1 AS Level, CAST('1' AS VARCHAR(20)) AS Value
    UNION ALL
    SELECT Level + 1, Value + CAST(Level + 1 AS VARCHAR)
    FROM NumSeq
    WHERE Level < @n
)
SELECT * FROM NumSeq;

✅ Difficult Task 4: Employees who made the most sales in last 6 months (use derived table)

Assuming "today" is '2025-08-27':

SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    DT.TotalSales
FROM Employees E
JOIN (
    SELECT TOP 1 WITH TIES 
        EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, '2025-08-27')
    GROUP BY EmployeeID
    ORDER BY SUM(SalesAmount) DESC
) AS DT ON E.EmployeeID = DT.EmployeeID;

✅ Difficult Task 5: Remove duplicate integers and single-digit integers from string column (RemoveDuplicateIntsFromNames)

We need to:

Extract only digits.

Remove digits that occur more than once.

Remove digits that appear only once.

So only repeated characters of length > 1 should be removed — leaving only non-repeating multi-digit numbers.

This is quite tricky without CLR or regex. Here’s a practical way using string manipulation:

WITH ExtractedDigits AS (
    SELECT 
        PawanName,
        Pawan_slug_name,
        RIGHT(Pawan_slug_name, CHARINDEX('-', REVERSE(Pawan_slug_name)) - 1) AS DigitsOnly
    FROM RemoveDuplicateIntsFromNames
),
Cleaned AS (
    SELECT 
        PawanName,
        Pawan_slug_name,
        DigitsOnly,
        CASE 
            WHEN LEN(DigitsOnly) = 1 THEN NULL
            ELSE 
                (
                    SELECT STRING_AGG(Val, '') 
                    FROM (
                        SELECT Val
                        FROM (
                            SELECT SUBSTRING(DigitsOnly, number, 1) AS Val
                            FROM master..spt_values
                            WHERE type = 'P' AND number BETWEEN 1 AND LEN(DigitsOnly)
                        ) AS chars
                        GROUP BY Val
                        HAVING COUNT(*) = 1
                    ) AS unique_digits
                )
        END AS CleanedDigits
    FROM ExtractedDigits
)
SELECT 
    PawanName,
    Pawan_slug_name,
    CleanedDigits
FROM Cleaned;

