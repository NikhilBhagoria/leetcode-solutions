-- LeetCode 1978 - Employees Whose Manager Left the Company
-- Difficulty: Easy
--
-- Problem:
-- We are given an Employees table with:
-- - employee_id
-- - name
-- - manager_id
-- - salary
-- An employee's manager has left the company if:
-- 1. manager_id IS NOT NULL
-- 2. manager_id does NOT exist in the Employees table

-- Task:
-- Return employee_id of such employees
-- AND salary < 30000
-- Result should be ordered by employee_id.
-- Table: Employees
-- +-------------+---------+------------+--------+
-- | employee_id | name    | manager_id | salary |
-- +-------------+---------+------------+--------+
--
-- Schema:
-- CREATE TABLE Employees (
--   employee_id INT,
--   name VARCHAR(100),
--   manager_id INT,
--   salary INT
-- );

SELECT 
    employee_id
FROM 
    Employees
WHERE 
    manager_id IS NOT NULL
    AND manager_id NOT IN (
        SELECT employee_id
        FROM Employees
    )
    AND salary < 30000
ORDER BY 
    employee_id;
