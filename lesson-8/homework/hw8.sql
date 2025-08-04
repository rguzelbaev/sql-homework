# lesson-8 Practice
--##  Easy-Level Tasks 
--1. Using Products table, find the total number of products available in each category.
select Category, count(*) as TotalProducts
from Products
group by Category;
--2. Using Products table, get the average price of products in the 'Electronics' category.
select avg(Price) as AveragePrice
from Products
where Category = 'Electronics';
--3. Using Customers table, list all customers from cities that start with 'L'.
select * 
from Customers
where City like 'L%';
--4. Using Products table, get all product names that end with 'er'.
select ProductName 
from Products
where ProductName like '%er';
--5. Using Customers table, list all customers from countries ending in 'A'.
select * 
from Customers
where Country like '%A';
--6. Using Products table, show the highest price among all products.
select max(Price) as HighestPrice
from Products;
--7. Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select ProductName, StockQuantity,
	case 
		when StockQuantity < 30 then 'Low Stock'
		else 'Sufficient'
		end as 'StockStatus'
from Products;
--8. Using Customers table, find the total number of customers in each country.
select Country, count(*) as TotalNumber
from Customers
group by Country;
--9. Using Orders table, find the minimum and maximum quantity ordered.
select min(Quantity) as MinQuantity, max(Quantity) as MaxQuantity
from Orders;
-----
--##  Medium-Level Tasks 
--10. Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
  AND o.CustomerID NOT IN (
      SELECT DISTINCT i.CustomerID
      FROM Invoices i
  );
--11. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select ProductName from Products
union all
select ProductName from Products_Discounted;
--12. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select ProductName from Products
union
select ProductName from Products_Discounted;
--13. Using Orders table, find the average order amount by year.
select year(OrderDate) as OrderYear, avg(totalamount) AvgAmount 
from Orders
group by year(OrderDate)
order by OrderYear;
--14. Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select ProductName, 
	case
		when Price < 100 then 'Low'
		when Price between 100 and 500 then 'Mid'
		when Price > 500 then 'Hign'
		end as pricegroup
from Products;
--15. Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
SELECT 
    district_name,
    [2012],
    [2013]
INTO Population_Each_Year
FROM
(
    SELECT district_name, year, population
    FROM City_Population
) AS SourceTable
PIVOT
(
    SUM(Population)
    FOR year IN ([2012], [2013])
) AS PivotTable;
--16. Using Sales table, find total sales per product Id.
select ProductID, sum(SaleAmount) as TotalSales
from Sales
group by ProductID;
--17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select ProductName 
from Products
where ProductName like '%oo%'
--18. Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy)  and copy results to a new Population_Each_City table.
SELECT 
    year,
    [Bektemir],
    [Chilonzor],
    [Yakkasaroy]
INTO Population_Each_City
FROM
(
    SELECT 
        year,
        district_name,
        population
    FROM City_Population
    WHERE district_name IN ('Bektemir', 'Chilonzor', 'Yakkasaroy')
) AS SourceTable
PIVOT
(
    SUM(population)
    FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;
select * from Population_Each_City
-----
--##  Hard-Level Tasks 
--19. Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
select top 3 CustomerID, sum(TotalAmount) as Totalspent
from Invoices
group by CustomerID
order by Totalspent desc;
--20. Transform Population_Each_Year table to its original format (City_Population).

select district_name, year, population
from Population_Each_Year
unpivot (
		population for year in ([2012], [2013])
		) as unpivotData;
--21. Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
select p.ProductName, count(s.SaleId) as TimeSold
from Products p
join Sales s on p.ProductID = s.ProductID
group by p.ProductName
order by TimeSold desc

--22. Transform Population_Each_City table to its original format (City_Population).

select district_name, population, year
from Population_Each_City
unpivot
	(population for district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
	)as unpivotData;
