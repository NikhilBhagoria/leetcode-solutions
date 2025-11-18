-- LeetCode 196. Delete Duplicate Emails
-- Difficulty: Easy

-- Goal:
-- Remove duplicate emails from the Person table and keep only the row
-- with the smallest id for each email.

-- Table: Person
-- +----+---------+
-- | id | email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
--
-- Duplicate email: a@b.com
-- We keep id = 1 and delete id = 3.
-- After deletion, the Person table should look like:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+

-- Note: The Person table has the following schema:
-- CREATE TABLE Person (
--   id INT PRIMARY KEY,
--   email VARCHAR(100)
-- );
-- id is the primary key of this table.
-- Each row of this table contains an id and an email address.
-- Emails may be duplicated in this table.

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;
-- This query deletes duplicate emails by joining the Person table with itself.
-- It keeps the row with the smallest id for each email by ensuring p1.id > p2.id.
-- All rows in p1 that have a matching email in p2 with a smaller id are deleted.
-- After executing this query, only unique emails with the smallest id will remain in the Person table.
