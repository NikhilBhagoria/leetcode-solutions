-- LeetCode 184 – Department Highest Salary
-- Difficulty: Medium
--
-- Goal:
-- Find the employee(s) who earn the highest salary
-- in each department.
--
-- Return:
-- Department name
-- Employee name
-- Salary

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT
        departmentId,
        MAX(salary)
    FROM Employee
    GROUP BY departmentId
);
