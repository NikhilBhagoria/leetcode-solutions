-- LeetCode 584. Find Customer Referee
-- Difficulty: Easy
-- Goal:
-- Find the names of customers who were NOT referred by customer with id = 2.

-- Table: Customer
-- +-------------+---------+-------------+
-- | id          | name    | referee_id  |
-- +-------------+---------+-------------+
-- | 1           | Will    | null        |
-- | 2           | Jane    | null        |
-- | 3           | Alex    | 2           |
-- | 4           | Bill    | null        |
-- | 5           | Zack    | 1           |
-- | 6           | Mark    | 2           |
-- +-------------+---------+-------------+
--
-- Customers referred by 2 → Alex, Mark
-- We should EXCLUDE them.
-- Note: The Customer table has the following schema:
-- CREATE TABLE Customer (
--   id INT,
--   name VARCHAR,
--   referee_id INT
-- );
-- id is the id of the customer.
-- name is the name of the customer.
-- referee_id is the id of the customer who referred this customer.
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;
-- This query selects the names of customers from the Customer table
-- where the referee_id is either NULL (indicating no referee)
-- or not equal to 2, effectively excluding those referred by customer with id = 2.
