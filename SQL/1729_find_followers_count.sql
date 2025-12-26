-- LeetCode 1729 - Find Followers Count
-- Difficulty: Easy
--
-- Goal:
-- For each user, find the number of followers they have.
--
-- Table: Followers
-- +-------------+--------------+
-- | user_id     | follower_id  |
-- +-------------+--------------+
--
-- Schema:
-- CREATE TABLE Followers (
--   user_id INT,
--   follower_id INT
-- );

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- Explanation:
-- 1. Group by user_id to aggregate followers.
-- 2. COUNT(follower_id) gives total followers per user.
-- 3. ORDER BY user_id ensures ascending order.
