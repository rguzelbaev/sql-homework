1. Define the following terms: data, database, relational database, and table. 
  Ответ. Data  - это данные, информация, напрмиер текст, числа, таблицы. databse - это база данных, содержащая в себе информацию в электронном виде, с помощью базы данных можно хранить информацию, управлять и извлкать ее. 
  relational database and table- реляционная база данных, состоящая из таблиц, которые связаны между собой логическими связями, например ключами. Информация структурирована. Таблицы состоят из записей, которые содержатся в строках и столбцах.    
2. List five key features of SQL Server.
  Ответ. Хранение, управление, обработка, извлечени, безопасность, также имеются инструменты для разработки и интеграция с сервисами.
3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
  Ответ. Аутентификация windows и SQL Server (через создания пользователя и пароля для него)
4. Create a new database in SSMS named SchoolDB.
  База данных создана с помощью sql команды: create database SchoolDB
5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
   Ответ 
  create table Students(StudentID INT PRIMARY KEY, 
		Name VARCHAR(50), Age INT) 
6. Describe the differences between SQL Server, SSMS, and SQL.
  Ответ. Sql Server это СУБД, ссмс - является инструментом управления для работы с СУБД, а sql является языком запросов для работы с БД
7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
  Ответ. dql - язык запросов, используется для извлечения информации с помощью select; dml - язык манипулирования данными, т.е. добавление, изменение и удаление;
  ddl - язык определения данных: create, alter, drop; dcl - язык управления данными, для управленияя доступами, правами, привелегии (grant, revoke); tcl - для управления транзакциями: commit, rollback, savepoint
8. Write a query to insert three records into the Students table.
    Ответ. insert into Students(StudentID, Name, Age) values (1, 'Ivan', 18), (2, 'Petya', 17), (3, 'Slavik', 20)
9. Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
SQL-
Ответ. 1) Сохранил к себе на локальный диск файл базы данных AdventureWorksDW2022.bak
2) Щелкнул Правой кнопкой мыши в ssms на Database, нажал на Restore Database, далее через Device, кнопка Add, указал путь на свой локальный диск и выбрал AdventureWorksDW2022.bak, нажал ОК, еще раз ОК, вышло сообщение "Database 'AdventureWorksDW2022' restored succefully"
