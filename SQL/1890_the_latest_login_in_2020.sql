-- LeetCode 1890 - The Latest Login in 2020
-- Difficulty: Easy
--
-- Goal:
-- Find the latest login date in the year 2020 for each user.
-- If a user did not log in during 2020, they should not appear in the result.
--
-- Table: Logins
-- +---------+------------+
-- | user_id | time_stamp |
-- +---------+------------+
--
-- Schema:
-- CREATE TABLE Logins (
--   user_id INT,
--   time_stamp DATETIME
-- );

SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM Logins
WHERE YEAR(time_stamp) = 2020
GROUP BY user_id;

-- Explanation:
-- 1. Filter records to include only logins from year 2020.
-- 2. Group by user_id.
-- 3. MAX(time_stamp) gives the latest login for each user.
