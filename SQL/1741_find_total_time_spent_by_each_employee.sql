-- LeetCode 1741 - Find Total Time Spent by Each Employee
-- Difficulty: Easy
--
-- Goal:
-- Calculate the total time spent by each employee on each day.
--
-- Table: Employees
-- +------------+------------+------------+------------+
-- | emp_id     | event_day  | in_time    | out_time   |
-- +------------+------------+------------+------------+
--
-- Schema:
-- CREATE TABLE Employees (
--   emp_id INT,
--   event_day DATE,
--   in_time INT,
--   out_time INT
-- );

SELECT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id;

-- Explanation:
-- 1. out_time - in_time → time spent in one session.
-- 2. SUM(...) → total time per employee per day.
-- 3. GROUP BY event_day, emp_id ensures correct aggregation.
