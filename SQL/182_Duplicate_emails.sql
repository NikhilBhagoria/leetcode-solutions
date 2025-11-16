-- LeetCode 182. Duplicate Emails
-- Difficulty: Easy

-- The query selects all duplicate emails from the Person table.
-- Table: Person
-- +----+---------+
-- | id | email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- In this example, the duplicate email is "a@b.com".

-- The result will be:
-- +---------+
-- | email   |
-- +---------+
-- | a@b.com |
-- +---------+
-- Note: The Person table has the following schema:
-- CREATE TABLE Person (
--   id INT PRIMARY KEY,
--   email VARCHAR(100)
-- );
-- id is the primary key of this table.
-- Each row of this table contains an id and an email address.
-- Emails may be duplicated in this table.
-- We need to find all the emails that appear more than once.
-- Return the result table in any order.

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
