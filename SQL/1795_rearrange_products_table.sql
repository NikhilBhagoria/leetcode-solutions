-- LeetCode 1795 - Rearrange Products Table
-- Difficulty: Easy
--
-- Goal:
-- Transform the Products table from wide format to long format.
-- Each row should contain:
-- product_id, store, price
-- Exclude rows where price is NULL.
--
-- Table: Products
-- +------------+--------+--------+--------+
-- | product_id | store1 | store2 | store3 |
-- +------------+--------+--------+--------+
--
-- Schema:
-- CREATE TABLE Products (
--   product_id INT,
--   store1 INT,
--   store2 INT,
--   store3 INT
-- );

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;

-- Explanation:
-- 1. Convert each store column into rows using UNION ALL.
-- 2. Filter out NULL prices.
-- 3. Output matches required normalized format.
