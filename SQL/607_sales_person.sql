-- LeetCode 607. Sales Person
-- Difficulty: Easy
-- Goal:
-- Find all salespersons who did NOT make any sales to the company named 'RED'.
-- Table: SalesPerson
-- +----------+------+--------+-----------------+------------+
-- | sales_id | name | salary | commission_rate | hire_date  |
-- +----------+------+--------+-----------------+------------+
-- | 1        | John | 100000 | 6               | 4/1/2006   |
-- | 2        | Amy  | 12000  | 5               | 5/1/2010   |
-- | 3        | Mark | 65000  | 12              | 12/25/2008 |
-- | 4        | Pam  | 25000  | 25              | 1/1/2005   |
-- | 5        | Alex | 5000   | 10              | 2/3/2007   |
-- +----------+------+--------+-----------------+------------+
-- The SalesPerson table has the following schema:
-- CREATE TABLE SalesPerson (
--   sales_id INT,
--   name VARCHAR,
--   salary INT,
--   commission_rate INT,
--   hire_date DATE
-- );
-- Table: Company
-- +--------+--------+----------+
-- | com_id | name   | city     |
-- +--------+--------+----------+
-- | 1      | RED    | Boston   |
-- | 2      | ORANGE | New York |
-- | 3      | YELLOW | Boston   |
-- | 4      | GREEN  | Austin   |
-- +--------+--------+----------+
-- The Company table has the following schema:
-- CREATE TABLE Company (
--   com_id INT,
--   name VARCHAR,
--   city VARCHAR
-- );
-- Table: Orders
-- +----------+------------+--------+----------+--------+
-- | order_id | order_date | com_id | sales_id | amount |
-- +----------+------------+--------+----------+--------+
-- | 1        | 1/1/2014   | 3      | 4        | 10000  |
-- | 2        | 2/1/2014   | 4      | 5        | 5000   |
-- | 3        | 3/1/2014   | 1      | 1        | 50000  |
-- | 4        | 4/1/2014   | 1      | 4        | 25000  |
-- +----------+------------+--------+----------+--------+
-- The Orders table has the following schema:
-- CREATE TABLE Orders (
--   order_id INT,
--   order_date DATE,
--   com_id INT,
--   sales_id INT,
--   amount INT
-- );

-- Solution:
-- 1. Approach Using NOT IN and DISTINCT
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT DISTINCT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);
-- 2. Approach Using NOT EXISTS (more efficient for large datasets)
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
    AND o.sales_id = s.sales_id
);
-- 3. Approach Using NOT IN
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
        ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);
-- Each of these queries retrieves the names of salespersons who have not made any sales to the company named 'RED'.
-- Example output:
-- +------+
-- | name |
-- +------+
-- | Amy  |
-- | Mark |
-- | Alex |
-- +------+