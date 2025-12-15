-- LeetCode 1378 - Replace Employee ID With The Unique Identifier
-- Difficulty: Easy
--
-- Goal:
-- Replace employee_id with unique_id when available.
-- If an employee does not have a unique_id, show NULL.
--
-- Tables:
-- Employees
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
-- +----+----------+
--
-- EmployeeUNI
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
-- +----+-----------+

SELECT 
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
    ON e.id = eu.id;

-- Explanation:
-- 1. LEFT JOIN ensures all employees are included.
-- 2. unique_id is shown when it exists; otherwise NULL is returned.
-- 3. Output columns are unique_id and name as required.