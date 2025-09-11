--вопросы:
# Lesson-20: Practice

> **Notes before doing the tasks:**
> - Tasks should be solved using **SQL Server**.
> - Case insensitivity applies.
> - Alias names do not affect the score.
> - Scoring is based on the **correct output**.
> - One correct solution is sufficient.

```sql
CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');
```

# 1. Find customers who purchased at least one item in March 2024 using EXISTS
# 2. Find the product with the highest total sales revenue using a subquery.
# 3. Find the second highest sale amount using a subquery
# 4. Find the total quantity of products sold per month using a subquery
# 5. Find customers who bought same products as another customer using EXISTS

# 6. Return how many fruits does each person have in individual fruit level

```sql
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')
```

**Expected Output**
```
+-----------+-------+--------+--------+
| Name      | Apple | Orange | Banana |
+-----------+-------+--------+--------+
| Francesko |   3   |   2    |   1    |
| Li        |   2   |   1    |   1    |
| Mario     |   3   |   1    |   2    |
+-----------+-------+--------+--------+
```

# 7. Return older people in the family with younger ones
```sql
create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)
```

**1 Oldest person in the family --grandfather**
**2 Father**
**3 Son**
**4 Grandson**

**Expected output**
```
+-----+-----+
| PID |CHID |
+-----+-----+
|  1  |  2  |
|  1  |  3  |
|  1  |  4  |
|  2  |  3  |
|  2  |  4  |
|  3  |  4  |
+-----+-----+

```

# 8. Write an SQL statement given the following requirements. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas
```sql
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);
```

---
# 9. Insert the names of residents if they are missing

```sql
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')
```
---
# 10. Write a query to return the route to reach from Tashkent to Khorezm. The result should include the cheapest and the most expensive routes

```sql
CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);
```

**Expected Output**
```
|             Route                                 |Cost |
|Tashkent - Samarkand - Khorezm                     | 500 |
|Tashkent - Jizzakh - Samarkand - Bukhoro - Khorezm | 650 |
```
---
# 11. Rank products based on their order of insertion.

```sql
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')
```

---
# Question 12
# Find employees whose sales were higher than the average sales in their department

```sql
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);
```

---
# 13. Find employees who had the highest sales in any given month using EXISTS
---
# 14. Find employees who made sales in every month using NOT EXISTS

```sql
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);
```
---
# 15. Retrieve the names of products that are more expensive than the average price of all products.
---
# 16. Find the products that have a stock count lower than the highest stock count.
---
# 17. Get the names of products that belong to the same category as 'Laptop'.
---
# 18. Retrieve products whose price is greater than the lowest price in the Electronics category.
---
# 19. Find the products that have a higher price than the average price of their respective category.
```sql
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');
```
---
# 20. Find the products that have been ordered at least once.
---
# 21. Retrieve the names of products that have been ordered more than the average quantity ordered.
---
# 22. Find the products that have never been ordered.
---
# 23. Retrieve the product with the highest total quantity ordered.

--ответы:
✅ Solutions — Lesson-20
1. Customers who purchased in March 2024 using EXISTS
SELECT DISTINCT s.CustomerName
FROM #Sales s
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.CustomerName = s.CustomerName
      AND MONTH(s2.SaleDate) = 3
      AND YEAR(s2.SaleDate) = 2024
);

2. Product with highest total sales revenue
SELECT TOP 1 Product, SUM(Quantity * Price) AS TotalRevenue
FROM #Sales
GROUP BY Product
ORDER BY TotalRevenue DESC;

3. Second highest sale amount
SELECT MAX(SaleAmount) AS SecondHighestSale
FROM (
    SELECT Quantity * Price AS SaleAmount
    FROM #Sales
) t
WHERE SaleAmount < (SELECT MAX(Quantity * Price) FROM #Sales);

4. Total quantity sold per month
SELECT SaleMonth, SUM(Quantity) AS TotalQuantity
FROM (
    SELECT MONTH(SaleDate) AS SaleMonth, Quantity
    FROM #Sales
) t
GROUP BY SaleMonth
ORDER BY SaleMonth;

5. Customers who bought same products as another
SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.CustomerName <> s2.CustomerName
      AND s1.Product = s2.Product
);

6. Fruits per person (pivot style)
SELECT Name,
       SUM(CASE WHEN Fruit = 'Apple' THEN 1 ELSE 0 END) AS Apple,
       SUM(CASE WHEN Fruit = 'Orange' THEN 1 ELSE 0 END) AS Orange,
       SUM(CASE WHEN Fruit = 'Banana' THEN 1 ELSE 0 END) AS Banana
FROM Fruits
GROUP BY Name;

7. Family: older with younger
SELECT f1.ParentId AS PID, f2.ChildID AS CHID
FROM Family f1
JOIN Family f2 ON f1.ChildID = f2.ParentId
UNION
SELECT ParentId, ChildID FROM Family
UNION
SELECT f1.ParentId, f3.ChildID
FROM Family f1
JOIN Family f2 ON f1.ChildID = f2.ParentId
JOIN Family f3 ON f2.ChildID = f3.ParentId
ORDER BY PID, CHID;

8. Customers with CA delivery → TX orders
SELECT o.*
FROM #Orders o
WHERE o.DeliveryState = 'TX'
  AND EXISTS (
      SELECT 1 FROM #Orders o2
      WHERE o2.CustomerID = o.CustomerID
        AND o2.DeliveryState = 'CA'
  );

9. Insert missing names in residents
UPDATE #residents
SET fullname = fullname + ' name=' + SUBSTRING(address, CHARINDEX('name=', address) + 5, 50)
WHERE address NOT LIKE '%name=%';

10. Cheapest & most expensive routes (Tashkent→Khorezm)
WITH Paths AS (
    SELECT 'Tashkent - Samarkand - Khorezm' AS Route, 100 + 400 AS Cost
    UNION ALL
    SELECT 'Tashkent - Jizzakh - Samarkand - Bukhoro - Khorezm',
           100 + 50 + 200 + 300
)
SELECT * FROM Paths
WHERE Cost = (SELECT MIN(Cost) FROM Paths)
   OR Cost = (SELECT MAX(Cost) FROM Paths);

11. Rank products by insertion groups
SELECT ID, Vals,
       SUM(CASE WHEN Vals='Product' THEN 1 ELSE 0 END) 
           OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) AS ProductGroup
FROM #RankingPuzzle;

12. Employees whose sales > avg of dept
SELECT e.*
FROM #EmployeeSales e
WHERE e.SalesAmount >
    (SELECT AVG(SalesAmount)
     FROM #EmployeeSales
     WHERE Department = e.Department
       AND SalesMonth = e.SalesMonth
       AND SalesYear = e.SalesYear);

13. Employees with highest sales per month (EXISTS)
SELECT e.*
FROM #EmployeeSales e
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales e2
    WHERE e2.SalesMonth = e.SalesMonth
      AND e2.SalesYear = e.SalesYear
    GROUP BY e2.SalesMonth, e2.SalesYear
    HAVING e.SalesAmount = MAX(e2.SalesAmount)
);

14. Employees who made sales in every month (NOT EXISTS)
SELECT DISTINCT e.EmployeeName
FROM #EmployeeSales e
WHERE NOT EXISTS (
    SELECT DISTINCT SalesMonth
    FROM #EmployeeSales
    WHERE SalesYear = 2024
    EXCEPT
    SELECT SalesMonth
    FROM #EmployeeSales e2
    WHERE e2.EmployeeName = e.EmployeeName
      AND e2.SalesYear = 2024
);

15. Products more expensive than overall avg
SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

16. Products with stock < max stock
SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);

17. Products in same category as Laptop
SELECT Name
FROM Products
WHERE Category = (SELECT Category FROM Products WHERE Name = 'Laptop');

18. Products with price > min Electronics price
SELECT Name
FROM Products
WHERE Price > (
    SELECT MIN(Price) FROM Products WHERE Category = 'Electronics'
);

19. Products priced > avg of their category
SELECT p.Name, p.Category, p.Price
FROM Products p
WHERE p.Price > (
    SELECT AVG(p2.Price)
    FROM Products p2
    WHERE p2.Category = p.Category
);

20. Products ordered at least once
SELECT DISTINCT p.Name
FROM Products p
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.ProductID = p.ProductID
);

21. Products ordered more than avg quantity
SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING SUM(o.Quantity) >
       (SELECT AVG(Quantity) FROM Orders);

22. Products never ordered
SELECT p.Name
FROM Products p
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.ProductID = p.ProductID
);

23. Product with highest total ordered qty
SELECT TOP 1 p.Name, SUM(o.Quantity) AS TotalOrdered
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY TotalOrdered DESC;
