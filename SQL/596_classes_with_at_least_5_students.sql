-- LeetCode 596. Classes With at Least 5 Students
-- Difficulty: Easy
-- Goal:
-- Find all classes that have at least 5 students.
-- Table: Courses
-- +---------+----------+
-- | student | class    |
-- +---------+----------+
-- | A       | Math     |
-- | B       | English  |
-- | C       | Math     |
-- | D       | Biology  |
-- | E       | Math     |
-- | F       | Computer |
-- | G       | Math     |
-- | H       | Math     |
-- | I       | Math     |
-- +---------+----------+
-- The Courses table has the following schema:
-- CREATE TABLE Courses (
--   student VARCHAR,
--   class VARCHAR
-- );
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
-- This query selects the class names from the Courses table,
-- groups the records by class,
-- and filters the groups to include only those with at least 5 students using the HAVING clause.
-- The result will be a list of class names that have 5 or more students enrolled.
-- Example output:
-- +----------+
-- | class    |
-- +----------+
-- | Math     |
-- +----------+
