-- LeetCode 1789 - Primary Department for Each Employee
-- Difficulty: Easy
--
-- Goal:
-- Find the primary department for each employee.
-- If an employee belongs to only one department, return that department.
-- If an employee belongs to multiple departments, return the one marked as primary.
--
-- Table: Employee
-- +-------------+---------------+-----------+
-- | employee_id | department_id | primary_flag |
-- +-------------+---------------+-----------+
--
-- Schema:
-- CREATE TABLE Employee (
--   employee_id INT,
--   department_id INT,
--   primary_flag ENUM('Y','N')
-- );

SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
   );

-- Explanation:
-- 1. Select rows where primary_flag = 'Y'.
-- 2. Include employees who belong to only one department.
-- 3. Subquery identifies employees with exactly one department.
