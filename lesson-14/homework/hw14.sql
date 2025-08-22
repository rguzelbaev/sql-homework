--🟢 EASY TASKS
--1. Split Name column by comma into two columns (Name, Surname)
SELECT 
    Id,
    LTRIM(RTRIM(PARSENAME(REPLACE(Name, ',', '.'), 2))) AS Name,
    LTRIM(RTRIM(PARSENAME(REPLACE(Name, ',', '.'), 1))) AS Surname
FROM TestMultipleColumns;

--2. Find strings that contain % character
SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%';

--3. Split a string based on dot .
SELECT 
    Id,
    PARSENAME(REPLACE(Vals, '.', '.'), 2) AS FirstPart,
    PARSENAME(REPLACE(Vals, '.', '.'), 1) AS SecondPart
FROM Splitter;

--4. Replace all digits with 'X'
SELECT 
    TRANSLATE('1234ABC123456XYZ1234567890ADS', '0123456789', 'XXXXXXXXXX') AS Replaced;

--5. Find rows where Vals has more than two dots
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

--6. Count spaces in each string
SELECT 
    texts,
    LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;

--7. Employees earning more than their managers
SELECT e.Name
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;

--8. Employees with 10–15 years of service
SELECT 
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 14;

--🟡 MEDIUM TASKS
--1. Separate integers and characters from mixed string
DECLARE @str VARCHAR(100) = 'rtcfvty34redt';

SELECT 
    @str AS Original,
    LEFT(@str, PATINDEX('%[0-9]%', @str) - 1) AS Characters,
    STUFF(@str, 1, PATINDEX('%[0-9]%', @str) - 1, '') AS Numbers;

--2. Dates with higher temperature than previous day
SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;

--3. First login date per player
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

--4. Return the third item from fruit list
SELECT 
    PARSENAME(REPLACE(fruit_list, ',', '.'), 2) AS ThirdFruit
FROM fruits;

--5. Each character from string becomes a row
WITH Numbers AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131')) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM master.dbo.spt_values
)
SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS CharValue
FROM Numbers;

--6. Join p1 and p2 with conditional code replacement
SELECT 
    p1.id,
    CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;

--7. Determine employment stage
SELECT 
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsOfService,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS EmploymentStage
FROM Employees;

--8. Extract integer at start of Vals
SELECT Id, 
       LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'X') - 1) AS StartNumber
FROM GetIntegers
WHERE ISNUMERIC(LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'X') - 1)) = 1;

--🔴 DIFFICULT TASKS
--1. Swap first two letters in comma-separated string
SELECT 
    Id,
    STUFF(STUFF(Vals, 1, 1, SUBSTRING(Vals, CHARINDEX(',', Vals) + 1, 1)),
                CHARINDEX(',', Vals) + 1, 1, LEFT(Vals, 1)) AS Swapped
FROM MultipleVals;

--2. First login device per player
WITH FirstLogins AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
)
SELECT player_id, device_id
FROM FirstLogins
WHERE rn = 1;

--3. Week-on-week percentage of sales
WITH WeeklyTotal AS (
    SELECT FinancialWeek, Area,
           SUM(ISNULL(SalesLocal, 0) + ISNULL(SalesRemote, 0)) AS TotalSales
    FROM WeekPercentagePuzzle
    GROUP BY FinancialWeek, Area
)
SELECT 
    wpp.FinancialWeek,
    wpp.Area,
    wpp.DayName,
    wpp.Date,
    (ISNULL(wpp.SalesLocal, 0) + ISNULL(wpp.SalesRemote, 0)) AS DailySales,
    wt.TotalSales,
    ROUND(1.0 * (ISNULL(wpp.SalesLocal, 0) + ISNULL(wpp.SalesRemote, 0)) / NULLIF(wt.TotalSales, 0) * 100, 2) AS Percentage
FROM WeekPercentagePuzzle wpp
JOIN WeeklyTotal wt ON wpp.Area = wt.Area AND wpp.FinancialWeek = wt.FinancialWeek;
