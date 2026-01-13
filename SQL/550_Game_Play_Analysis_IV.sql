-- LeetCode 550 – Game Play Analysis IV
-- Difficulty: Medium
--
-- Goal:
-- Find the fraction of players who logged in again
-- on the day after their first login date.
--
-- Return the fraction rounded to 2 decimal places.

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) t
ON a.player_id = t.player_id
AND a.event_date = DATE_ADD(t.first_login, INTERVAL 1 DAY);
