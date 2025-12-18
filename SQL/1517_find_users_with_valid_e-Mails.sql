-- LeetCode 1517 - Find Users With Valid E-Mails
-- Difficulty: Easy
--
-- Goal:
-- Find all users with valid emails based on the following rules:
-- 1. Email must start with a letter.
-- 2. The prefix may contain letters, digits, '_', '.', or '-'.
-- 3. The domain must be exactly '@leetcode.com'.
-- 4. Email matching must be case-sensitive.
--
-- Table: Users
-- +---------+-----------+-------------------------+
-- | user_id | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 2       | Jonathan  | jonathanisgreat         |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- | 5       | Marwan    | quarz#2020@leetcode.com |
-- | 6       | David     | david69@gmail.com       |
-- | 7       | Shapiro   | .shapo@leetcode.com     |
-- +---------+-----------+-------------------------+
--
-- Schema:
-- CREATE TABLE Users (
--   user_id INT,
--   mail VARCHAR(255)
-- );

SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$' 
COLLATE utf8mb4_bin

-- Explanation:
-- ^[a-zA-Z]           → email must start with a letter
-- [a-zA-Z0-9._-]*     → allowed characters before '@'
-- @leetcode\\.com$    → exact domain match
-- COLLATE utf8mb4_bin → enforces case-sensitive comparison
--
-- Example:
-- ✔ winston@leetcode.com
-- ✘ winston@leetcode.COM
