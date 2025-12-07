-- LeetCode 1084 - Sales Analysis III
-- Difficulty: Easy
--
-- Goal:
-- Find all product_id and product_name where:
-- Every sale of that product happened ONLY between
-- 2019-01-01 and 2019-03-31.
--
-- Table: Product
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+
--
-- Table: Sales
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+
--
-- Schema:
-- CREATE TABLE Product (
--    product_id INT, 
--    product_name VARCHAR(100), 
--    unit_price INT
-- );
-- CREATE TABLE Sales(
--  seller_id INT, 
--  product_id INT, 
--  buyer_id INT, 
--  sale_date DATE, 
--  quantity INT, 
--  price INT
-- );

-- Solution:
-- A product is valid if:
-- MIN(sale_date) >= '2019-01-01'
-- AND
-- MAX(sale_date) <= '2019-03-31'

SELECT 
    p.product_id,
    p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING 
    MIN(s.sale_date) >= '2019-01-01'
    AND 
    MAX(s.sale_date) <= '2019-03-31';

-- Explanation:
-- We group by product.
-- If the earliest sale >= Jan 1
-- AND the latest sale <= Mar 31,
-- then *all* sales fall inside the range.