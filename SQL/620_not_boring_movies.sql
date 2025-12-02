-- LeetCode 620. Not Boring Movies
-- Difficulty: Easy
-- Goal:
-- Show all movies where:
-- 1. id is odd
-- 2. description != 'boring'
-- Sort results by rating in descending order.

-- Table: Cinema
-- +----+------------+-------------+--------+
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 1  | War        | great 3D    | 8.9    |
-- | 2  | Science    | fiction     | 8.5    |
-- | 3  | irish      | boring      | 6.2    |
-- | 4  | Ice song   | Fantacy     | 8.6    |
-- | 5  | House card | Interesting | 9.1    |
-- +----+------------+-------------+--------+

-- Schema:
-- CREATE TABLE Cinema (
--   id INT,
--   movie VARCHAR(255),
--   description VARCHAR(255),
--   rating FLOAT
-- );

-- Solution:
SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring'
ORDER BY rating DESC;

-- Explanation:
-- id % 2 = 1         → keeps only odd-numbered movies.
-- description <> 'boring' → removes boring movies.
-- ORDER BY rating DESC → highest-rated movies appear first.

-- Example Output: 
-- +----+------------+-------------+--------+
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 5  | House card | Interesting | 9.1    |
-- | 1  | War        | great 3D    | 8.9    |
-- +----+------------+-------------+--------+