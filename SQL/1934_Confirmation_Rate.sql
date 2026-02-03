-- LeetCode 1934. Confirmation Rate
-- Database: MySQL

-- Table: Signups
-- +---------+------+
-- | user_id | int  |
-- +---------+------+

-- Table: Confirmations
-- +---------+------------+-----------+
-- | user_id | time_stamp | action    |
-- +---------+------------+-----------+
-- action is ENUM('confirmed', 'timeout')

/*
For each user, calculate the confirmation rate:
confirmation_rate = confirmed_actions / total_actions

If a user has no confirmation records, return 0.00
*/

SELECT 
    s.user_id,
    ROUND(
        IFNULL(
            SUM(c.action = 'confirmed') / COUNT(c.action),
            0
        ),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;
