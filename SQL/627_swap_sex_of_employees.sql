-- LeetCode 627. Swap Sex of Employees
-- Difficulty: Easy
--
-- Goal:
-- Update the 'sex' column:
--   'm' → 'f'
--   'f' → 'm'
--
-- Table: Salary
-- +----+------+-----+--------+
-- | id | name | sex | salary |
-- +----+------+-----+--------+
-- | 1  | A    | m   | 2500   |
-- | 2  | B    | f   | 1500   |
-- | 3  | C    | m   | 5500   |
-- | 4  | D    | f   | 500    |
-- +----+------+-----+--------+

-- Schema:
-- CREATE TABLE Salary (
--  id INT,
--  name VARCHAR(255),
--  sex ENUM('m','f'),
--  salary INT
-- );
-- Solution:
UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END;
-- Explanation:
-- The CASE statement checks the current value of the 'sex' column.
-- If it's 'm', it changes it to 'f', and vice versa.
-- This effectively swaps the values in the 'sex' column for all employees.
-- Example Output after update:
-- +----+------+-----+--------+
-- | id | name | sex | salary |
-- +----+------+-----+--------+
-- | 1  | A    | f   | 2500   |
-- | 2  | B    | m   | 1500   |
-- | 3  | C    | f   | 5500   |
-- | 4  | D    | m   | 500    |
-- +----+------+-----+--------+