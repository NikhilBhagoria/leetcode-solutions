-- LeetCode 1757 - Recyclable and Low Fat Products
-- Difficulty: Easy
--
-- Goal:
-- Find the ids of products that are both recyclable and low fat.
--
-- Table: Products
-- +-------------+----------+-----------+
-- | product_id  | low_fats | recyclable|
-- +-------------+----------+-----------+
--
-- Schema:
-- CREATE TABLE Products (
--   product_id INT,
--   low_fats ENUM('Y','N'),
--   recyclable ENUM('Y','N')
-- );

SELECT
    product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';

-- Explanation:
-- 1. Filter products where low_fats = 'Y'.
-- 2. Filter products where recyclable = 'Y'.
-- 3. Return only product_id as required.
