-- LeetCode 619. Biggest Single Number
-- Difficulty: Easy
-- Goal:
-- Find the largest number that appears exactly once in the table.
--
-- Table: MyNumbers
-- +-------+
-- | num   |
-- +-------+

-- Example:
-- nums = [2, 5, 5, 3, 3]
-- Single numbers = [2]
-- Output = 2

-- If no single number exists, return NULL.

-- Schema:
-- CREATE TABLE MyNumbers (
--   num INT
-- );

-- Solution:
-- Group by the number, filter those with count = 1,
-- then pick the maximum.

SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
);

-- Explanation:
-- 1. GROUP BY num → count frequency.
-- 2. HAVING COUNT(*) = 1 → keep only numbers that appear once.
-- 3. MAX() picks the biggest among them.
-- 4. If no single number → MAX(NULL) → returns NULL as required.
