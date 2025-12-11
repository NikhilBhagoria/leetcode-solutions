-- LeetCode 1211. Queries Quality and Percentage
-- Difficulty: Easy

-- The query calculates the quality score and percentage of poor queries for each query_name.
-- Table: Queries
-- +------------+-------------------+----------+--------+
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |
-- +------------+-------------------+----------+--------+
--
-- The result should be:
-- +------------+---------+-----------------------+
-- | query_name | quality | poor_query_percentage |
-- +------------+---------+-----------------------+
-- | Dog        | 2.50    | 33.33                 |
-- | Cat        | 0.66    | 33.33                 |
-- +------------+---------+-----------------------+
--
-- Explanation:
-- For "Dog": quality = ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
--            poor_ query_percentage is (1 / 3) * 100 = 33.33
-- For "Cat": quality = ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
--            poor_ query_percentage is (1 / 3) * 100 = 33.33
--
-- The subquery calculates:
-- 1. quality = rating / position (quality score for each query)
-- 2. is_poor = 1 if rating < 3, else 0
-- Then groups by query_name to compute averages and percentages.
--
-- Note: The Queries table has the following schema:
-- CREATE TABLE Queries (
--   query_name VARCHAR,
--   result VARCHAR,
--   position INT,
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
