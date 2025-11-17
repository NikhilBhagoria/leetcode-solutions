-- LeetCode 183. Customers Who Never Order
-- Difficulty: Easy

-- The query finds customers who have never placed any order.
-- Tables:
-- Customers(id, name)
-- Orders(id, customerId)

-- Example:
-- Customers:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
--
-- Orders:
-- +----+------------+
-- | id | customerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
--
-- Customers who never ordered: Henry, Max

-- Note: The Customers table has the following schema:
-- CREATE TABLE Customers (
--   id INT PRIMARY KEY,
--   name VARCHAR(100)
-- );
-- The Orders table has the following schema:
-- CREATE TABLE Orders (
--   id INT PRIMARY KEY,
--   customerId INT,
--   FOREIGN KEY (customerId) REFERENCES Customers(id)
-- );
-- customerId is a foreign key that references the id of the Customers table.
-- The result will be:
-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;
