/*
LeetCode Problem: 1164 - Product Price at a Given Date
-- Difficulty: Medium

Problem:
- Initially, all products have a price of 10.
- Each row in Products represents a price change on a specific date.
- Find the price of each product on '2019-08-16'.

Approach:
1. Find the latest price change for each product on or before '2019-08-16'.
2. Assign price = 10 for products that have no price change before this date.
*/

-- Step 1: Get latest price change before or on the given date
SELECT 
    p.product_id,
    p.new_price AS price
FROM Products p
JOIN (
    SELECT 
        product_id,
        MAX(change_date) AS last_change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) latest
ON p.product_id = latest.product_id
AND p.change_date = latest.last_change_date

UNION

-- Step 2: Products with no price change before the given date
SELECT 
    product_id,
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
