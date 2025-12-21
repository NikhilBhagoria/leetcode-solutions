-- LeetCode 1587. Bank Account Summary II
-- Difficulty: Easy
--
-- Goal:
-- Find the name and balance of users with a balance greater than 10000.
--
-- Tables:
-- Users
-- +------------+----------+
-- | account    | name     |
-- +------------+----------+
--
-- Transactions
-- +------------+------------+--------+
-- | account    | day        | amount |
-- +------------+------------+--------+
--
-- Schema:
-- CREATE TABLE Users (
--   account INT,
--   name VARCHAR(100)
-- );
--
-- CREATE TABLE Transactions (
--   account INT,
--   day DATE,
--   amount INT
-- );

SELECT
    u.name,
    SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
    ON u.account = t.account
GROUP BY u.account, u.name
HAVING SUM(t.amount) > 10000;

-- Explanation:
-- 1. Join Users and Transactions on account number.
-- 2. Sum all transaction amounts to get account balance.
-- 3. Filter users whose balance is greater than 10000.
