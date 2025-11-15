-- LeetCode 181. Employees Earning More Than Their Managers
-- Difficulty: Easy

-- The query selects the names of employees who earn more than their managers.
-- Table: Employee
-- +----+-------+--------+--------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+--------+
-- | 1  | Joe   | 70000  | 3      |
-- | 2  | Henry | 80000  | 4      |
-- | 3  | Sam   | 60000  | NULL   |
-- | 4  | Max   | 90000  | NULL   |
-- +----+-------+--------+--------+
-- In this example, Joe earns more than his manager Sam, so Joe is included in the result set.
-- The result will be:
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- Note: The Employee table has the following schema:
-- CREATE TABLE Employee (
--   id INT PRIMARY KEY,
--   name VARCHAR(100),
--   salary INT,
--   managerId INT
-- );
-- managerId is a foreign key that references the id of the Employee table.

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;