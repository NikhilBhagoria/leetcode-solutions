/*
 * LeetCode Problem 1321: Restaurant Growth
 * Difficulty: Medium
 * 
 * Problem Description:
 * Compute the moving average of how much customers paid in a seven-day window 
 * (current day + 6 days before). Return the result with:
 * - visited_on: the end date of the 7-day window
 * - amount: total sum of payments in the 7-day window
 * - average_amount: rounded to two decimal places
 * 
 * Constraints:
 * - (customer_id, visited_on) is the primary key
 * - At least one customer visits every day
 * - Return results ordered by visited_on ASC
 * - Only include dates where a full 7-day window exists
 * 
 * Approach:
 * 1. Aggregate daily transaction amounts (handle multiple transactions per day)
 * 2. Calculate 7-day rolling sum using window functions
 * 3. Compute average by dividing sum by 7 and rounding to 2 decimals
 * 4. Filter to include only dates with complete 7-day windows
 * 
 * 
 */

WITH daily_amounts AS (
  -- Step 1: Aggregate total amount per day (handle multiple transactions on same day)
  SELECT 
    visited_on,
    SUM(amount) AS day_total
  FROM Customer
  GROUP BY visited_on
),

seven_day_windows AS (
  -- Step 2: Calculate 7-day rolling sum and average using window functions
  SELECT 
    visited_on,
    SUM(day_total) OVER (
      ORDER BY visited_on 
      RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(
      SUM(day_total) OVER (
        ORDER BY visited_on 
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
      ) / 7, 
      2
    ) AS average_amount
  FROM daily_amounts
)

-- Step 3: Filter to include only dates with complete 7-day windows
-- (starting from the 7th day after the earliest transaction date)
SELECT 
  visited_on,
  amount,
  average_amount
FROM seven_day_windows
WHERE visited_on >= (
  SELECT MIN(visited_on) + INTERVAL 6 DAY 
  FROM Customer
)
ORDER BY visited_on ASC;