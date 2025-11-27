-- LeetCode 176. Second Highest Salary
-- Difficulty: Medium
-- Goal:
-- Write a SQL query to get the second highest salary from the Employee table.
-- Table: Employee
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- The Employee table has the following schema:
-- CREATE TABLE Employee (
--   Id INT,
--   Salary INT
-- );
SELECT (
SELECT DISTINCT salary 
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
-- If there is no second highest salary, the query should return null.
-- Example output:
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- or
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | NULL                |
-- +---------------------+
-- Explanation:
-- The inner query selects distinct salaries from the Employee table, orders them in descending order, and
-- uses LIMIT with OFFSET to skip the highest salary and retrieve the second highest salary.
-- The outer query returns this value as SecondHighestSalary. If there is no second highest salary, it returns NULL.
-- Note: Different SQL databases may have different syntax for LIMIT and OFFSET.
-- If your SQL database does not support LIMIT and OFFSET, you can use the following alternative approach:
--
-- Alternative Approach Using Subquery
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary) FROM Employee
);