-- LeetCode 1661 - Average Time of Process per Machine
-- Difficulty: Easy
--
-- Goal:
-- Calculate the average processing time per machine.
-- Processing time = end timestamp - start timestamp
--
-- Table: Activity
-- +------------+------------+---------------+-----------+
-- | machine_id | process_id | activity_type | timestamp |
-- +------------+------------+---------------+-----------+
-- | 0          | 0          | start         | 0.712     |
-- | 0          | 0          | end           | 1.520     |
-- | 0          | 1          | start         | 3.140     |
-- | 0          | 1          | end           | 4.120     |
-- | 1          | 0          | start         | 0.550     |
-- | 1          | 0          | end           | 1.550     |
-- | 1          | 1          | start         | 0.430     |
-- | 1          | 1          | end           | 1.420     |
-- | 2          | 0          | start         | 4.100     |
-- | 2          | 0          | end           | 4.512     |
-- | 2          | 1          | start         | 2.500     |
-- | 2          | 1          | end           | 5.000     |
-- +------------+------------+---------------+-----------+
--
-- activity_type ∈ ('start', 'end')
--
-- Schema:
-- CREATE TABLE Activity (
--   machine_id INT,
--   process_id INT,
--   activity_type ENUM('start', 'end'),
--   timestamp FLOAT
-- );

SELECT 
    machine_id,
    ROUND(SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0
    / (SELECT COUNT(DISTINCT process_id)),3) AS processing_time
FROM 
    Activity
GROUP BY machine_id

-- Explanation:
-- 1. 'start' timestamps are treated as negative.
-- 2. 'end' timestamps are treated as positive.
-- 3. AVG(end - start) gives average processing time per machine.
-- 4. ROUND(..., 3) formats output to 3 decimal places.
