-- LeetCode 1731 - The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
--
-- Goal:
-- For each employee who has at least one direct report,
-- find:
-- 1. employee_id
-- 2. name
-- 3. reports_count  → number of employees reporting to them
-- 4. average_age    → average age of those employees (rounded to nearest integer)
--
-- Table: Employees
-- +-------------+---------+-----+------------+
-- | employee_id | name    | age | reports_to |
-- +-------------+---------+-----+------------+
--
-- Schema:
-- CREATE TABLE Employees (
--   employee_id INT,
--   name VARCHAR(50),
--   age INT,
--   reports_to INT
-- );

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees m
JOIN Employees e
    ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;

-- Explanation:
-- 1. Self JOIN Employees table.
-- 2. 'm' represents managers, 'e' represents their direct reports.
-- 3. COUNT(e.employee_id) → number of direct reports.
-- 4. AVG(e.age) → average age of direct reports.
-- 5. ROUND() → required rounding.
