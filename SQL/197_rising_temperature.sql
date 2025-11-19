-- LeetCode 197. Rising Temperature
-- Difficulty: Easy
-- Goal:
-- Find all dates with a higher temperature compared to the previous date.
-- Table: Weather
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- +----+------------+-------------+
--
-- Output: id = 2 (25 > 10)
-- Output: id = 3 (20 > 25) is false, so it is not included.
-- After executing the query, the result table should look like:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+
-- Note: The Weather table has the following schema:
-- CREATE TABLE Weather (
--   id INT PRIMARY KEY,
--   recordDate DATE,
--   temperature INT
-- );
-- id is the primary key of this table.
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
--
-- This query joins the Weather table with itself to compare each day's temperature with the previous day's temperature.
-- The join condition ensures that we are comparing records where the recordDate of w1 is exactly one day after the recordDate of w2.
-- The WHERE clause filters the results to include only those days where the temperature is higher than the previous day.
-- The final result selects the id of the days that meet this condition.
-- After executing this query, the result will contain the ids of the days with rising temperatures compared to the previous day.
