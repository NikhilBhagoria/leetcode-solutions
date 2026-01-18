-- LeetCode 570 – Managers with at Least 5 Direct Reports
-- Difficulty: Medium
--
-- Goal:
-- Find the names of managers who have at least
-- 5 direct reports.

SELECT
    e.name
FROM Employee e
JOIN (
    SELECT
        managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) m
ON e.id = m.managerId;
