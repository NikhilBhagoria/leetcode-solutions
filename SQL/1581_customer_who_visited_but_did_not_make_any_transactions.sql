-- LeetCode 1581. Customer Who Visited but Did Not Make Any Transactions
-- Difficulty: Easy
--
-- Goal:
-- Find the number of visits for each customer who visited
-- but did NOT make any transactions.
--
-- Tables:
-- Visits
-- +----------+------------+
-- | visit_id | customer_id|
-- +----------+------------+
--
-- Transactions
-- +----------------+----------+--------+
-- | transaction_id | visit_id | amount |
-- +----------------+----------+--------+
--
-- Schema:
-- CREATE TABLE Visits (
--   visit_id INT,
--   customer_id INT
-- );
--
-- CREATE TABLE Transactions (
--   transaction_id INT,
--   visit_id INT,
--   amount INT
-- );

SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Explanation:
-- 1. LEFT JOIN keeps all visits.
-- 2. transaction_id IS NULL → visits with no transactions.
-- 3. GROUP BY customer_id to count such visits per customer.
