-- LeetCode 1873 - Calculate Special Bonus
-- Difficulty: Easy
--
-- Goal:
-- Calculate the special bonus for each employee.
-- Bonus rules:
-- 1. employee_id must be odd
-- 2. employee name must NOT start with 'M'
-- If conditions are not met, bonus = 0.
--
-- Table: Employees
-- +-------------+--------+--------+
-- | employee_id | name   | salary |
-- +-------------+--------+--------+
--
-- Schema:
-- CREATE TABLE Employees (
--   employee_id INT,
--   name VARCHAR,
--   salary INT
-- );

SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1
             AND name NOT LIKE 'M%'
        THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;

-- Explanation:
-- employee_id % 2 = 1 → odd employee_id
-- name NOT LIKE 'M%'   → name does not start with 'M'
-- salary used as bonus if conditions met, else 0
