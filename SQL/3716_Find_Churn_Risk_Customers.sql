-- LeetCode 3716 - Find Churn Risk Customers
-- Difficulty: Medium

WITH ranked_events AS (
SELECT
user_id,
event_id,
event_date,
event_type,
plan_name,
monthly_amount,
ROW_NUMBER() OVER (
PARTITION BY user_id
ORDER BY event_date DESC, event_id DESC
) AS rn
FROM subscription_events
),

user_summary AS (
SELECT
user_id,
MIN(event_date) AS first_date,
MAX(event_date) AS last_date,
MAX(monthly_amount) AS max_historical_amount,
SUM(CASE WHEN event_type = 'downgrade' THEN 1 ELSE 0 END) AS downgrade_count
FROM subscription_events
GROUP BY user_id
),

current_status AS (
SELECT
user_id,
plan_name AS current_plan,
monthly_amount AS current_monthly_amount,
event_type
FROM ranked_events
WHERE rn = 1
)

SELECT
us.user_id,
cs.current_plan,
cs.current_monthly_amount,
us.max_historical_amount,
DATEDIFF(us.last_date, us.first_date) AS days_as_subscriber
FROM user_summary us
JOIN current_status cs
ON us.user_id = cs.user_id
WHERE
cs.event_type <> 'cancel'                                -- Currently active
AND us.downgrade_count > 0                               -- At least one downgrade
AND cs.current_monthly_amount < 0.5 * us.max_historical_amount
AND DATEDIFF(us.last_date, us.first_date) >= 60          -- Minimum 60 days
ORDER BY
days_as_subscriber DESC,
us.user_id ASC;
