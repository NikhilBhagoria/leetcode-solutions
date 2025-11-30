-- LeetCode 610. Triangle Judgement
-- Difficulty: Easy
-- Goal:
-- Determine whether three given sides (x, y, z) can form a valid triangle.
--
-- Triangle Rule:
-- A triangle is valid if ALL conditions are true:
--   x + y > z
--   x + z > y
--   y + z > x
--
-- Table: Triangle
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+

-- Schema:
-- CREATE TABLE Triangle (
--   x INT,
--   y INT,
--   z INT
-- );

-- Solution:
-- Use a CASE statement to check triangle validity.
SELECT *,
CASE
    WHEN (x+y > z) AND (x+z > y) AND (z+y > x) THEN 'Yes'
    ELSE 'No'
END AS 'triangle'
FROM Triangle


-- Explanation:
-- The CASE expression applies the Triangle Validity Rule.
-- If all three conditions satisfy the triangle inequality,
-- output 'Yes', otherwise 'No'.