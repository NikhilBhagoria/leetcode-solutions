-- LeetCode 1068 - Product Sales Analysis I
-- Difficulty: Easy
-- 
-- Goal:
-- Return product_name and year, price, quantity for each sale.
--
-- Tables:
-- Sales:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
--
-- Product:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
--
-- Schema:
-- CREATE TABLE Sales (
--   sale_id INT,
--   product_id INT,
--   year INT,
--   quantity INT,
--   price INT
-- );
--
-- CREATE TABLE Product (
--   product_id INT,
--   product_name VARCHAR(255)
-- );
--
-- Goal: Join Sales with Product and return:
-- product_name, year, price

SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
    ON s.product_id = p.product_id;

-- Explanation:
-- Simple INNER JOIN:
-- Sales.product_id → Product.product_id
-- Return required columns.
-- Example Output:
--
-- +--------------+-------+-------+
-- | product_name | year  | price |
-- +--------------+-------+-------+
-- | Nokia        | 2008  | 5000  |
-- | Nokia        | 2009  | 5000  |
-- | Apple        | 2011  | 9000  |
-- +--------------+-------+-------+