-- LeetCode 177. Nth Highest Salary
-- Difficulty: Medium
-- Goal:
-- Write a SQL query to get the nth highest salary from the Employee table.
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
-- Given a variable n, write a SQL query to get the nth highest salary from the Employee table.
-- If there is no nth highest salary, the query should return null.
-- Example output for n = 2:
-- +---------------------+
-- | NthHighestSalary    |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- or
-- +---------------------+
-- | NthHighestSalary    |
-- +---------------------+
-- | NULL                |
-- +---------------------+
-- Explanation:
-- The inner query selects distinct salaries from the Employee table, orders them in descending order, and
-- uses LIMIT with OFFSET to skip the highest salaries and retrieve the nth highest salary.
-- The outer query returns this value as NthHighestSalary. If there is no nth highest salary, it returns NULL.
-- Note: Different SQL databases may have different syntax for LIMIT and OFFSET.
-- If your SQL database does not support LIMIT and OFFSET, you can use the following alternative approach:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N=N-1;
  RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
);
END