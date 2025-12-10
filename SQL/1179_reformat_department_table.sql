-- LeetCode 1179. Reformat Department Table
-- Difficulty: Easy

-- The query reformats the Department table to pivot monthly revenues into columns.
-- The Department table contains:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
--
-- The result should be:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+
--
-- Note: The Department table has the following schema:
-- CREATE TABLE Department (
--   id INT,
--   revenue INT,
--   month VARCHAR(20)
-- );
SELECT id,
  SUM(IF (month = "Jan", revenue, null)) AS Jan_Revenue,
  SUM(IF (month = "Feb", revenue, null)) AS Feb_Revenue,
  SUM(IF (month = "Mar", revenue, null)) AS Mar_Revenue,
  SUM(IF (month = "Apr", revenue, null)) AS Apr_Revenue,
  SUM(IF (month = "May", revenue, null)) AS May_Revenue,
  SUM(IF (month = "Jun", revenue, null)) AS Jun_Revenue,
  SUM(IF (month = "Jul", revenue, null)) AS Jul_Revenue,
  SUM(IF (month = "Aug", revenue, null)) AS Aug_Revenue,
  SUM(IF (month = "Sep", revenue, null)) AS Sep_Revenue,
  SUM(IF (month = "Oct", revenue, null)) AS Oct_Revenue,
  SUM(IF (month = "Nov", revenue, null)) AS Nov_Revenue,
  SUM(IF (month = "Dec", revenue, null)) AS Dec_Revenue
FROM Department
GROUP BY id;
-- Explanation:
-- 1. SUM(IF (month = "X", revenue, null)) → creates a column for each month, summing revenues for that month.
-- 2. GROUP BY id → groups results by department id to aggregate monthly revenues correctly.
