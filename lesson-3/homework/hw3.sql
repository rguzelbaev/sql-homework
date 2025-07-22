--🟢 Easy-Level Tasks (10)
--1. Define and explain the purpose of BULK INSERT in SQL Server.
Массовая вставка в SQL Server, или bulk insert нужна для быстрого импорта больших объемов данных из внешних файлов в таблицу базы данных. Основное назначение оптимизация процесса импорта данных, нгапример если нужно загрузить миллионы строк в таблицу. Использование BULK INSERT позволит сократить время загрузки данных, гораздо быстрее чем исподьзовать много раз insert команды. ;
--2. List four file formats that can be imported into SQL Server.
Формат XML, TXT, CSV, SQL;
--3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products (ProductID int Primary key, ProductName varchar(50), Price decimal(10,2))
--4. Insert three records into the Products table using INSERT INTO.
insert into Products values (1, 'Water', 10),
							(2, 'Air', 5),
							(3, 'Ground', 10);
--5. Explain the difference between NULL and NOT NULL.
null - пустое, неизвестное значение, not null - не пустое значение. Если прописываются такие условие, соответсвенно столбец может содержать NULL значение или не содержать, т.е. для каждой записи в этом столюце должно быть указано какое-то конкретное значение
--6. Add a UNIQUE constraint to the ProductName column in the Products table.
ALTER TABLE Products
ADD CONSTRAINT UC_ProductName UNIQUE (ProductName);
--7. Write a comment in a SQL query explaining its purpose.
--Комментарий к вопросу 8: --Добавление колонки "CategoryID" в таблицу "Products"
--8. Add CategoryID column to the Products table.
ALTER TABLE Products
ADD CategoryID int;
--9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
Create table Categories (CategoryID int PRIMARY KEY, CategoryName varchar(50) UNIQUE)
--10. Explain the purpose of the IDENTITY column in SQL Server.
Identity используется для автоматической генерации уникальных, последовательных целочисленных значений для каждой новой строки, вставляемой в таблицу. Это часто используется для создания первичных ключей, обеспечивая автоматическую нумерацию строк и уникальность идентификаторов.
----🟠 Medium-Level Tasks (10)
--11. Use BULK INSERT to import data from a text file into the Products table.
bulk insert Products
from 'C:\Users\asus\Desktop\MAAB SQL & Python\SQL\Products.txt'
with(
	fIELDTERMINATOR=',',
	rowterminator='\n',
	FIRSTROW=1
	);
--12. Create a FOREIGN KEY in the Products table that references the Categories table.
ALTER TABLE Products
ADD CONSTRAINT FK_CategoryID
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
--13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
a)unique can use any time  
primary only once
b)unique allow null
primary cannot allow null
--14. Add a CHECK constraint to the Products table ensuring Price > 0.
alter table Products
add constraint check_Price check (Price > 0)
--15. Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products
ADD Stock int not null;
--16. Use the ISNULL function to replace NULL values in Price column with a 0.
select ProductName, isnull(Price, 0) as Price1
from Products
--17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
Ограничение обеспечивает целостность ссылок, гарантируя, что изменения нельзя вносить в данные в таблице первичного ключа, если эти изменения недопустимы для ссылки на данные в таблице внешнего ключа
----🔴 Hard-Level Tasks (10)
--18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
create table Customers (id int, f_name varchar(50), age int, constraint chk_age check (age>=18))
--19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
create table tbl_ident (id int identity(100,10), [name] varchar(10))
--20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails (order_id int, product_id int primary key (order_id, product_id))
--21. Explain the use of COALESCE and ISNULL functions for handling NULL values.
Функции COALESCE и ISNULL используются для обработки значений NULL в SQL, 
возвращая первое не-NULL значение из списка или заменяя NULL на определенное значение, соответственно. 
COALESCE может принимать несколько аргументов, а ISNULL только два
--22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE,
    fName VARCHAR(50),
    LName VARCHAR(50),
    );
--23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
ALTER TABLE Products
ADD CONSTRAINT constr_fk FOREIGN KEY CategoryID REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;

