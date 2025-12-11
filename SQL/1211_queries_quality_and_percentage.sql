-- LeetCode 1211. Queries Quality and Percentage
-- Difficulty: Easy

-- The query calculates the quality score and percentage of poor queries for each query_name.
-- Table: Queries
-- +-------------+----------+--------+-------+
-- | query_name  | result   | position| rating |
-- +-------------+----------+--------+-------+
-- | Dog         | success  | 1      | 5     |ss  | 3      | 2     |
-- +-------------+----------+--------+-------+
--
-- The result should be:
-- +----------+----------+----------+
-- | query_name| quality  | poor_query_percentage |
-- +----------+----------+----------+
-- | Dog      | 4.00     | 0.00     |
-- | Cat      | 2.50     | 25.00    |
-- +----------+----------+----------+
--
-- Explanation:
-- For "Dog": quality = (5/1 + 3/2 + 4/3) / 3 = 4.00
--            poor queries (rating < 3) = 0, percentage = 0 / 3 * 100 = 0.00
-- For "Cat": quality = (1/1 + 5/1 + 3/2 + 2/3) / 4 = 2.50
--            poor queries (rating < 3) = 1, percentage = 1 / 4 * 100 = 25.00
--
-- The subquery calculates:
-- 1. quality = rating / position (quality score for each query)
-- 2. is_poor = 1 if rating < 3, else 0
-- Then groups by query_name to compute averages and percentages.
--
-- Note: The Queries table has the following schema:
-- CREATE TABLE Queries (
--   query_name VARCHAR(30),
--   result VARCHAR(50),
--   position INT,
-- | Dog         | success  | 2      | 3     |
-- | Dog         | success  | 3      | 4     |
-- | Cat         | failure  | 1      | 1     |
-- | Cat         | success  | 1      | 5     |
-- | Cat         | success  | 2      | 3     |
-- | Cat         | succe
--   rating INT
-- );

SELECT query_name,
       ROUND(SUM(quality) / COUNT(*), 2) AS quality,
       ROUND(SUM(is_poor) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM (
    SELECT query_name,
           rating / position AS quality,
           CASE WHEN rating < 3 THEN 1 ELSE 0 END AS is_poor
    FROM Queries
) AS new
GROUP BY query_name;
