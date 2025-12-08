-- LeetCode 1141. User Activity for the Past 30 Days I
-- Difficulty: Easy
--
-- Goal:
-- Count the number of active users for each day within
-- the last 30 days from '2019-07-27'.
--
-- Active user = user who logged in on that day.
--
-- Table: Activity
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | 1       | 1          | 2019-07-20    | open_session  |
-- | 1       | 1          | 2019-07-20    | scroll_down   |
-- | 1       | 1          | 2019-07-20    | end_session   |
-- | 2       | 4          | 2019-07-20    | open_session  |
-- | 2       | 4          | 2019-07-21    | send_message  |
-- | 2       | 4          | 2019-07-21    | end_session   |
-- | 3       | 2          | 2019-07-21    | open_session  |
-- | 3       | 2          | 2019-07-21    | send_message  |
-- | 3       | 2          | 2019-07-21    | end_session   |
-- | 4       | 3          | 2019-06-25    | open_session  |
-- | 4       | 3          | 2019-06-25    | end_session   |
-- +---------+------------+---------------+---------------+
--
-- Schema:
-- CREATE TABLE Activity (
--   user_id INT,
--   session_id INT,
--   activity_date DATE,
--   activity_type enum('open_session', 'end_session', 'send_message', 'scroll_down')
-- );

-- We consider data from:
-- 2019-06-28 → 2019-07-27
-- (30-day window)

SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    DATEDIFF('2019-07-27', activity_date) < 30 AND DATEDIFF('2019-07-27', activity_date)>=0
GROUP BY 1

-- Output:
-- +------------+--------------+ 
-- | day        | active_users |
-- +------------+--------------+ 
-- | 2019-07-20 | 2            |
-- | 2019-07-21 | 2            |
-- +------------+--------------+ 
-- Explanation:
-- We filter the records to include only those within the last 30 days from '2019-07-27'.
-- Then, we group by activity_date and count distinct user_id for each day to get the number of active users.
-- We filter the records to include only those within the last 30 days from '2019-07-27' using the DATEDIFF function.
-- Then, we group by activity_date and count distinct user_id for each day to get the number of active users.
