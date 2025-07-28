--Puzzle 1: Finding Distinct Values
--Question: Explain at least two ways to find distinct values based on two columns.
--1
SELECT DISTINCT
    LEAST(col1, col2) AS col1,
    GREATEST(col1, col2) AS col2
FROM InputTbl;
--2
SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

--Puzzle 2: Removing Rows with All Zeroes
--Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.
SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);

--Puzzle 3: Find those with odd ids
SELECT *
FROM section1
WHERE id % 2 = 1;
--Puzzle 4: Person with the smallest id (use the table in puzzle 3)
--SELECT  top 1 *
FROM section1
ORDER BY id ASC
--Puzzle 5: Person with the highest id (use the table in puzzle 3)
SELECT  top 1 *
FROM section1
ORDER BY id desc
--Puzzle 6: People whose name starts with b (use the table in puzzle 3)
SELECT  *
FROM section1
where name like 'b%'
--Puzle 7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).
select * 
from ProductCodes
where Code like '%#_%' escape '#'
