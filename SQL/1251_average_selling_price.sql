-- LeetCode 1251 - Average Selling Price
-- Difficulty: Easy

-- Problem Summary
-- You are given two tables:
-- Prices: Contains product price for specific date ranges.
-- UnitsSold: Contains number of units sold on specific dates.

-- You must calculate:
-- average_price = (sum of (units * price)) / (total units sold)

-- Round result to 2 decimal places. If no units sold → average_price = 0.

SELECT p.product_id,
ROUND( IFNULL(SUM(u.units * p.price) / SUM(u.units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

-- Explanation
-- 1. Join tables using date range
-- A record in UnitsSold belongs to a price range if:
-- purchase_date BETWEEN start_date AND end_date

-- 2. Compute total revenue
-- SUM(u.units * p.price)
-- This gives total money earned.

-- 3. Compute total units sold
-- SUM(u.units)

-- 4. Average selling price
-- (total revenue) / (units sold)
-- If NULL → use 0.

-- 5. Round to 2 decimals
-- Using ROUND().

-- Output: 
-- +------------+---------------+
-- | product_id | average_price |
-- +------------+---------------+
-- | 1          | 6.96          |
-- | 2          | 16.96         |
-- +------------+---------------+