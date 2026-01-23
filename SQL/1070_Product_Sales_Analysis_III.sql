-- LeetCode 1070 - Product Sales Analysis III
-- Difficulty: Medium
-- ---------------------------------------
-- Task:
-- Find all sales that occurred in the first year each product was sold.
--
-- Logic:
-- 1. Identify the earliest year for each product.
-- 2. Return ALL sales rows for that product in that year.

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM
    Sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
) first_sale
ON s.product_id = first_sale.product_id
AND s.year = first_sale.first_year;
