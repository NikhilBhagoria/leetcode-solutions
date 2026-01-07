-- LeetCode 3465. Find Products with Valid Serial Numbers
-- Difficulty: Easy
--
-- Table: products
-- +--------------+------------+
-- | product_id   | int        |
-- | product_name | varchar    |
-- | description  | varchar    |
-- +--------------+------------+
--
-- A valid serial number must:
-- 1. Start with 'SN' (case-sensitive)
-- 2. Be followed by exactly 4 digits
-- 3. Contain a hyphen (-)
-- 4. End with exactly 4 digits
-- 5. Appear anywhere inside the description
-- 6. Not be part of another word (e.g., ASN4321-8765 is invalid)

SELECT
    product_id,
    product_name,
    description
FROM
    products
WHERE
    description REGEXP '(^|[^A-Z0-9])SN[0-9]{4}-[0-9]{4}([^0-9]|$)'
    COLLATE utf8mb4_bin
ORDER BY
    product_id ASC;
