-- LeetCode 262 – Trips and Users
-- Difficulty: Hard
--
-- Goal:
-- Find the daily cancellation rate of trips
-- between 2013-10-01 and 2013-10-03.
--
-- Only include trips where both the client
-- and the driver are NOT banned.

SELECT
    t.request_at AS Day,
    ROUND(
        SUM(t.status IN ('cancelled_by_driver', 'cancelled_by_client')) 
        / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM Trips t
JOIN Users c
    ON t.client_id = c.users_id AND c.banned = 'No'
JOIN Users d
    ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at
ORDER BY t.request_at;
