-- =====================================================
-- LeetCode 1204: Last Person to Fit in the Bus
-- Difficulty: Medium
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
-- =====================================================

-- Table: Queue
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+
--
-- person_id contains unique values.
-- turn determines the order of boarding the bus.
-- The bus has a maximum weight limit of 1000 kg.
-- Only one person can board at a time.
--
-- Goal:
-- Find the person_name of the LAST person who can board
-- the bus without the total weight exceeding 1000.

-- -----------------------------------------------------
-- Example:
-- Ordered by turn:
--
-- Turn | Name      | Weight | Total Weight
-- ----------------------------------------
-- 1    | Alice     | 250    | 250
-- 2    | Alex      | 350    | 600
-- 3    | John Cena | 400    | 1000  <-- last person
-- 4    | Marie     | 200    | 1200  (cannot board)
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Approach:
-- 1. Calculate running (cumulative) sum of weights
--    ordered by turn using a window function.
-- 2. Filter rows where cumulative weight <= 1000.
-- 3. Select the last valid person.
-- -----------------------------------------------------

SELECT person_name
FROM (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) AS running_weight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
