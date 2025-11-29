-- LeetCode 178. Rank Scores
-- Difficulty: Medium
-- Goal:
-- Rank the scores in descending order.
-- If two scores are the same, they should have the same rank.
-- Rank should start from 1 and increase without gaps.

-- Table: Scores
-- +----+-------+
-- | id | score |
-- +----+-------+
-- | 1  | 3.50  |
-- | 2  | 3.65  |
-- | 3  | 4.00  |
-- | 4  | 3.85  |
-- | 5  | 4.00  |
-- | 6  | 3.65  |
-- +----+-------+

-- Example:
-- Scores: 100, 90, 90, 80
-- Ranks:   1 ,  2,  2,  3

-- Schema:
-- CREATE TABLE Scores (
--   id INT,
--   score DECIMAL(3,2)
-- );

-- Solution:
-- Use DENSE_RANK() over the scores in descending order.

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores;

-- Explanation:
-- DENSE_RANK() assigns the same rank to equal scores.
-- Example:
-- Score: 100 → Rank 1
-- Score: 90  → Rank 2
-- Score: 90  → Rank 2
-- Score: 80  → Rank 3
--
-- Output:
-- +-------+------+
-- | score | rank |
-- +-------+------+
-- | 4.00  | 1    |
-- | 4.00  | 1    |
-- | 3.85  | 2    |
-- | 3.65  | 3    |
-- | 3.65  | 3    |
-- | 3.50  | 4    |
-- +-------+------+