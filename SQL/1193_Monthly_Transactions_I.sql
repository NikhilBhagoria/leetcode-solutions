-- LeetCode Problem: 1193. Monthly Transactions I
-- Difficulty: Medium
-- Link: https://leetcode.com/problems/monthly-transactions-i/
--
-- Table: Transactions
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
--
-- Goal:
-- For each month and country, find:
-- 1. Total number of transactions
-- 2. Number of approved transactions
-- 3. Total transaction amount
-- 4. Total approved transaction amount

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
