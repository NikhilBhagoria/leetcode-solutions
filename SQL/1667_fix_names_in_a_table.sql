-- LeetCode 1667 - Fix Names in a Table
-- Difficulty: Easy
--
-- Goal:
-- Fix the formatting of user names so that:
-- 1. The first letter is uppercase
-- 2. The remaining letters are lowercase
--
-- Table: Users
-- +---------+-----------+
-- | user_id | name      |
-- +---------+-----------+
--
-- Schema:
-- CREATE TABLE Users (
--   user_id INT,
--   name VARCHAR(100)
-- );

SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;

-- Explanation:
-- LEFT(name, 1)     → first character
-- UPPER(...)        → capitalize first letter
-- SUBSTRING(name,2) → remaining characters
-- LOWER(...)        → convert rest to lowercase
