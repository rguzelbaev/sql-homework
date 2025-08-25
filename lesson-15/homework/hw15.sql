# Lesson-15: Subqueries and Exists

> **Notes before doing the tasks:**
> - Tasks should be solved using **SQL Server**.
> - Case insensitivity applies.
> - Alias names do not affect the score.
> - Scoring is based on the **correct output**.
> - One correct solution is sufficient.



## Level 1: Basic Subqueries

# 1. Find Employees with Minimum Salary

**Task: Retrieve employees who earn the minimum salary in the company.**
**Tables: employees (columns: id, name, salary)**

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
```

# 2. Find Products Above Average Price

**Task: Retrieve products priced above the average price.**
**Tables: products (columns: id, product_name, price)**
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
```
---

## Level 2: Nested Subqueries with Conditions

**3. Find Employees in Sales Department**
**Task: Retrieve employees who work in the "Sales" department.**
**Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)**
```sql
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);
```

# 4. Find Customers with No Orders

**Task: Retrieve customers who have not placed any orders.**
**Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)**
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
```
---

## Level 3: Aggregation and Grouping in Subqueries

# 5. Find Products with Max Price in Each Category

**Task: Retrieve products with the highest price in each category.**
**Tables: products (columns: id, product_name, price, category_id)**
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);
```

# 6. Find Employees in Department with Highest Average Salary

**Task: Retrieve employees working in the department with the highest average salary.**
**Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)**
```sql
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);
```
---

## Level 4: Correlated Subqueries

# 7. Find Employees Earning Above Department Average

**Task: Retrieve employees earning more than the average salary in their department.**
**Tables: employees (columns: id, name, salary, department_id)**
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);
```

# 8. Find Students with Highest Grade per Course

**Task: Retrieve students who received the highest grade in each course.**
**Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)**
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);
```
---

## Level 5: Subqueries with Ranking and Complex Conditions

**9. Find Third-Highest Price per Category**
**Task: Retrieve products with the third-highest price in each category.**
**Tables: products (columns: id, product_name, price, category_id)**
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);
```

# 10. Find Employees whose Salary Between Company Average and Department Max Salary

**Task: Retrieve employees with salaries above the company average but below the maximum in their department.**
**Tables: employees (columns: id, name, salary, department_id)**
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);
```

Answers:
✅ Level 1: Basic Subqueries
1. Find Employees with Minimum Salary
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

2. Find Products Above Average Price
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

✅ Level 2: Nested Subqueries with Conditions
3. Find Employees in Sales Department
SELECT *
FROM employees
WHERE department_id = (
    SELECT id FROM departments WHERE department_name = 'Sales'
);

4. Find Customers with No Orders
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM orders
);

✅ Level 3: Aggregation and Grouping in Subqueries
5. Find Products with Max Price in Each Category
SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);

6. Find Employees in Department with Highest Average Salary
SELECT *
FROM employees
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);

✅ Level 4: Correlated Subqueries
7. Find Employees Earning Above Department Average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

8. Find Students with Highest Grade per Course
SELECT *
FROM grades g
WHERE grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE course_id = g.course_id
);


If you need to include student names:

SELECT s.*
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE course_id = g.course_id
);

✅ Level 5: Subqueries with Ranking and Complex Conditions
9. Find Third-Highest Price per Category
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS rank_in_category
    FROM products
) p
WHERE rank_in_category = 3;

10. Find Employees whose Salary Between Company Average and Department Max Salary
SELECT *
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees)
  AND salary < (
      SELECT MAX(salary)
      FROM employees
      WHERE department_id = e.department_id
  );
