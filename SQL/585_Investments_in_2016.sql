-- LeetCode 585 – Investments in 2016
-- Difficulty: Medium
--
-- Goal:
-- Find the sum of all investments in 2016 (tiv_2016)
-- for policyholders who:
-- 1) Have the same tiv_2015 value as another policyholder
-- 2) Do NOT share the same (lat, lon) location with anyone else

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
