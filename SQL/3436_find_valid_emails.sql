-- LeetCode 3436 - Find Valid Emails
-- Difficulty: Easy
--
-- Table: Users
-- +---------+---------+
-- | user_id | email   |
-- +---------+---------+
--
-- Rules for a valid email:
-- 1. Contains exactly one '@'
-- 2. Ends with '.com'
-- 3. Part before '@' contains only letters, digits, and underscores
-- 4. Domain name (between '@' and '.com') contains only letters
-- 5. Result ordered by user_id in ascending order

SELECT
    user_id,
    email
FROM
    Users
WHERE
    email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY
    user_id ASC;