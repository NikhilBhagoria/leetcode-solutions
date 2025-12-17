-- LeetCode 1484 - Group Sold Products By The Date
-- Difficulty: Easy
--
-- Goal:
-- For each sell_date, find:
-- 1) Number of different products sold
-- 2) A comma-separated list of products sold on that date (sorted alphabetically)
--
-- Table: Activities
-- +------------+------------+
-- | sell_date  | product     |
-- +------------+------------+
-- | 2020-05-30 | Headphone  |
-- | 2020-06-01 | Pencil     |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | Basketball |
-- | 2020-06-01 | Bible      |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | T-Shirt    |
-- +------------+------------+

SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- Explanation:
-- 1. GROUP BY sell_date → group records by each date.
-- 2. COUNT(DISTINCT product) → number of unique products sold per date.
-- 3. GROUP_CONCAT(DISTINCT product ORDER BY product) → comma-separated product list.
-- 4. ORDER BY sell_date → ensures chronological output.