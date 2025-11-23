-- LeetCode 586. Customer Placing the Largest Number of Orders
-- Difficulty: Easy
-- Goal:
-- Find customer_number with the highest order count.
-- Table: Orders
-- +--------------+-----------------+
-- | order_number | customer_number |
-- +--------------+-----------------+
-- | 1            | 1               |
-- | 2            | 2               |
-- | 3            | 3               |
-- | 4            | 3               |
-- +--------------+-----------------+
-- The Orders table has the following schema:
-- CREATE TABLE Orders (
--   order_number INT,
--   customer_number INT
-- );
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
-- This query groups the Orders table by customer_number,
-- counts the number of orders for each customer,
-- orders the results in descending order based on the count,
-- and limits the output to the top result, which is the customer with the highest order count.
