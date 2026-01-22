-- LeetCode 1045 – Customers Who Bought All Products
-- Difficulty: Medium
--
-- Goal:
-- Find customers who bought ALL products listed in the Product table.

SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (
        SELECT COUNT(*) FROM Product
    );
