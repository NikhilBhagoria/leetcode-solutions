-- LeetCode 1148. Article Views I
-- Difficulty: Easy
--
-- Goal:
-- Find all authors who viewed at least one of their own articles.
-- Return distinct author IDs sorted in ascending order.
--
-- Table: Views
-- +------------+-----------+-----------+------------+
-- | article_id | author_id | viewer_id | view_date  |
-- +------------+-----------+-----------+------------+
-- | 1          | 3         | 5         | 2019-08-01 |
-- | 1          | 3         | 6         | 2019-08-02 |
-- | 2          | 7         | 7         | 2019-08-01 |
-- | 2          | 7         | 6         | 2019-08-02 |
-- | 4          | 7         | 1         | 2019-07-22 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- +------------+-----------+-----------+------------+

-- Schema:
-- CREATE TABLE Views (
--   article_id INT,
--   author_id INT,
--   viewer_id INT,
--   view_date DATE
-- );

-- Solution:

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

-- Explanation:
-- 1. author_id = viewer_id → selects rows where an author viewed their own article.
-- 2. DISTINCT → ensures each author appears only once.
-- 3. ORDER BY id ASC → sorts results as required.
