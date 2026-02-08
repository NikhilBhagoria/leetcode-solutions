-- File: analyze_subscription_conversion.sql
-- Problem: 3497 - Analyze Subscription Conversion

-- Find users who converted from free trial to paid
-- Calculate average activity duration during free trial and paid periods
-- Round results to 2 decimal places
-- Return ordered by user_id

SELECT
user_id,
ROUND(
AVG(CASE
WHEN activity_type = 'free_trial'
THEN activity_duration
END), 2
) AS trial_avg_duration,
ROUND(
AVG(CASE
WHEN activity_type = 'paid'
THEN activity_duration
END), 2
) AS paid_avg_duration
FROM UserActivity
GROUP BY user_id
HAVING
SUM(activity_type = 'free_trial') > 0
AND
SUM(activity_type = 'paid') > 0
ORDER BY user_id;
