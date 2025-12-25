-- LeetCode 1693 - Daily Leads and Partners
-- Difficulty: Easy
--
-- Goal:
-- For each date and make_name, calculate:
-- 1. Number of distinct leads
-- 2. Number of distinct partners
--
-- Table: DailySales
-- +-----------+-----------+-----------+-----------+
-- | date_id   | make_name | lead_id   | partner_id|
-- +-----------+-----------+-----------+-----------+
--
-- Schema:
-- CREATE TABLE DailySales (
--   date_id DATE,
--   make_name VARCHAR,
--   lead_id INT,
--   partner_id INT
-- );

SELECT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;

-- Explanation:
-- 1. Group by date_id and make_name.
-- 2. COUNT(DISTINCT lead_id) → unique leads per day per make.
-- 3. COUNT(DISTINCT partner_id) → unique partners per day per make.
