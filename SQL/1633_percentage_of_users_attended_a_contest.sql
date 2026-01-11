-- LeetCode 1633 – Percentage of Users Attended a Contest
-- Difficulty: Easy
--
-- Goal:
-- For each contest, calculate the percentage of users
-- who attended the contest out of total users.
--
-- Percentage formula:
-- (number of distinct users in contest / total users) * 100
--
-- Round percentage to 2 decimal places
-- Order by percentage DESC, then contest_id ASC

SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
