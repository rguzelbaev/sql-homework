--# Lesson 13 ----Practice: String Functions, Mathematical Functions


--## Easy Tasks

--1. You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
select 
	cast(employee_id as varchar) + '-' + First_name + ' ' + Last_Name as result
	from Employees
where employee_id=100
--2. Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
update employees
set phone_number = replace(phone_number, '124', '999');
--3. That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.(Employees)
select 
	FIRST_NAME as [First Name], 
	len(FIRST_NAME) as [Name Length]
from employees
where left(FIRST_NAME, 1) IN ('A', 'J', 'M')

--4. Write an SQL query to find the total salary for each manager ID.(Employees table)
SELECT 
	MANAGER_ID,
	SUM(SALARY) AS [TOTAL SALARY]
FROM EMPLOYEES
GROUP BY MANAGER_ID;

--5. Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
SELECT 
	YEAR1 AS [YEAR],
	greatest(Max1, Max2, Max3) AS MaxValue
FROM TestMax
--еще вариант можно использовать
SELECT 
    Year1 as [Year],
    (SELECT MAX(val) 
     FROM (VALUES (Max1), (Max2), (Max3)) AS value_table(val)) AS MaxValue
FROM TestMax;
--6. Find me odd numbered movies and description is not boring.(cinema)
select * from cinema
where id % 2 = 1 and description <> 'boring'
--7. You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)
SELECT *
FROM SingleOrder
ORDER BY IIF(ID = 0, 9999999, ID);
--8. Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
SELECT 
    id,
	coalesce(ssn, passportid, itin) as fitst_not_null
FROM Person;

--## Medium Tasks


--1. Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
SELECT
  StudentID,
  PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS Firstname,
  PARSENAME(REPLACE(FullName, ' ', '.'), 2) AS Middlename,
  PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS Lastname
FROM Students;
--ниже альтернативный вариант
SELECT
  StudentID,
  LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS Firstname,
  SUBSTRING(
      FullName, 
      CHARINDEX(' ', FullName) + 1,
      LEN(FullName)
        - CHARINDEX(' ', FullName)
        - CHARINDEX(' ', REVERSE(FullName))
  ) AS Middlename,
  RIGHT(FullName, CHARINDEX(' ', REVERSE(FullName)) - 1) AS Lastname
FROM Students;

--2. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
SELECT *
FROM Orders
WHERE DeliveryState = 'TX'
  AND CustomerID IN (
      SELECT DISTINCT CustomerID
      FROM Orders
      WHERE DeliveryState = 'CA'
  );
--3. Write an SQL statement that can group concatenate the following values.(DMLTable)

SELECT STRING_AGG(String, ' ') WITHIN GROUP (ORDER BY SequenceNumber) AS Concatenated
FROM DMLTable;
--4. Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.
SELECT *
FROM Employees 
WHERE (LEN(FIRST_NAME + LAST_NAME) - LEN(REPLACE(LOWER(FIRST_NAME + LAST_NAME), 'a', ''))) >= 3;
--5. The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)
SELECT
  DEPARTMENT_ID,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) AS EmpMoreThan3Yrs,
  ROUND(
    100.0 * SUM(CASE WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) 
          / COUNT(*), 2
  ) AS PctMoreThan3Yrs
FROM Employees
GROUP BY DEPARTMENT_ID;
--6. Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.(Personal)
-- Most experienced
SELECT JobDescription, SpacemanID, MissionCount
FROM Personal p1
WHERE MissionCount = (
  SELECT MAX(MissionCount)
  FROM Personal p2
  WHERE p2.JobDescription = p1.JobDescription
)

UNION ALL

-- Least experienced
SELECT JobDescription, SpacemanID, MissionCount
FROM Personal p1
WHERE MissionCount = (
  SELECT MIN(MissionCount)
  FROM Personal p2
  WHERE p2.JobDescription = p1.JobDescription
);


--## Difficult Tasks
--1. Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
DECLARE @s VARCHAR(100) = 'tf56sd#%OqH';

SELECT
  (SELECT STRING_AGG(c, '') WITHIN GROUP (ORDER BY pos)
   FROM (
     SELECT SUBSTRING(@s, number, 1) AS c, number AS pos
     FROM master..spt_values
     WHERE type = 'P' AND number BETWEEN 1 AND LEN(@s)
       AND ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('A') AND ASCII('Z')
   ) AS t) AS Uppercase,
  (SELECT STRING_AGG(c, '') WITHIN GROUP (ORDER BY pos)
   FROM (
     SELECT SUBSTRING(@s, number, 1) AS c, number AS pos
     FROM master..spt_values
     WHERE type = 'P' AND number BETWEEN 1 AND LEN(@s)
       AND ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('a') AND ASCII('z')
   ) AS t) AS Lowercase,
  (SELECT STRING_AGG(c, '') WITHIN GROUP (ORDER BY pos)
   FROM (
     SELECT SUBSTRING(@s, number, 1) AS c, number AS pos
     FROM master..spt_values
     WHERE type = 'P' AND number BETWEEN 1 AND LEN(@s)
       AND ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('0') AND ASCII('9')
   ) AS t) AS Numbers,
  (SELECT STRING_AGG(c, '') WITHIN GROUP (ORDER BY pos)
   FROM (
     SELECT SUBSTRING(@s, number, 1) AS c, number AS pos
     FROM master..spt_values
     WHERE type = 'P' AND number BETWEEN 1 AND LEN(@s)
       AND NOT (
          ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('A') AND ASCII('Z')
       OR ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('a') AND ASCII('z')
       OR ASCII(SUBSTRING(@s, number, 1)) BETWEEN ASCII('0') AND ASCII('9')
       )
   ) AS t) AS OtherChars;
--2. Write an SQL query that replaces each row with the sum of its value and the previous rows' value. (Students table)
SELECT
  StudentID,
  FullName,
  Grade,
  SUM(Grade) OVER (ORDER BY StudentID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningSum
FROM Students;
--3. You are given the following table, which contains a VARCHAR column that contains mathematical equations. Sum the equations and provide the answers in the output.(Equations)
DECLARE @Equation VARCHAR(200);
DECLARE @SQL NVARCHAR(400);
DECLARE @Result INT;

DECLARE EquationCursor CURSOR FOR
SELECT Equation FROM Equations;

OPEN EquationCursor;
FETCH NEXT FROM EquationCursor INTO @Equation;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'SELECT @ResultOut = ' + @Equation;
    EXEC sp_executesql @SQL, N'@ResultOut INT OUTPUT', @ResultOut = @Result;

    UPDATE Equations
    SET TotalSum = @Result
    WHERE Equation = @Equation;

    FETCH NEXT FROM EquationCursor INTO @Equation;
END

CLOSE EquationCursor;
DEALLOCATE EquationCursor;

--4. Given the following dataset, find the students that share the same birthday.(Student Table)
SELECT s1.StudentName, s1.Birthday
FROM Student s1
JOIN (
  SELECT Birthday
  FROM Student
  GROUP BY Birthday
  HAVING COUNT(*) > 1
) dup ON s1.Birthday = dup.Birthday;
--5. You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)

SELECT 
  LEAST(PlayerA, PlayerB) AS Player1,
  GREATEST(PlayerA, PlayerB) AS Player2,
  SUM(Score) AS TotalScore
FROM (
  SELECT PlayerA, PlayerB, Score FROM PlayerScores
  UNION ALL
  SELECT PlayerB, PlayerA, Score FROM PlayerScores
) AS Combined
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);


