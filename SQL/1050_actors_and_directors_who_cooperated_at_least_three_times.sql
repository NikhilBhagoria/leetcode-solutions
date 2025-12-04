-- LeetCode 1050. Actors and Directors Who Cooperated At Least Three Times
-- Difficulty: Easy
-- 
-- Goal:
-- Find all actor_id and director_id pairs who worked together
-- at least 3 times.

-- Table: ActorDirector
-- +-------------+---------------+--------------+
-- | actor_id    | director_id   | timestamp    |
-- +-------------+---------------+--------------+
-- | 1           | 1           | 0           |
-- | 1           | 1           | 1           |
-- | 1           | 1           | 2           |
-- | 1           | 2           | 3           |
-- | 1           | 2           | 4           |
-- | 2           | 1           | 5           |
-- | 2           | 1           | 6           |
-- +-------------+-------------+-------------+
-- Schema:
-- CREATE TABLE ActorDirector (
--   actor_id INT,
--   director_id INT,
--   timestamp INT
-- );

-- Solution:
-- Count (actor_id, director_id) pairs
-- Return only those with count >= 3

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

-- Explanation:
-- GROUP BY actor_id, director_id → groups collaborations
-- COUNT(*) → counts number of collaborations
-- HAVING COUNT(*) >= 3 → keeps only pairs with 3+ movies together
-- Example Output:
-- +-------------+-------------+
-- | actor_id    | director_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- +-------------+-------------+