-- LeetCode 3580. Find Consistently Improving Employees
-- Difficulty: Medium
/*
Problem:
Find employees whose last three performance reviews show strictly increasing ratings.

Tables:

employees
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+

performance_reviews
+-------------+------+
| review_id   | int  |
| employee_id | int  |
| review_date | date |
| rating      | int  |
+-------------+------+

Requirements:
1. Employee must have at least 3 reviews
2. Consider only the most recent 3 reviews (by review_date)
3. Ratings must be strictly increasing (earliest < middle < latest)
4. Improvement Score = latest rating - earliest rating
5. Return:
   - employee_id
   - name
   - improvement_score
6. Order by:
   - improvement_score DESC
   - name ASC

Approach:
- Use ROW_NUMBER() to rank reviews per employee by date (latest first)
- Extract last 3 reviews using a CTE
- Use conditional aggregation to place ratings in columns
- Filter employees where ratings are strictly increasing
- Calculate improvement score
*/

WITH ranked_reviews AS (
    SELECT 
        employee_id,
        review_date,
        rating,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY review_date DESC
        ) AS rn
    FROM performance_reviews
),

last_three AS (
    SELECT 
        employee_id,
        MAX(CASE WHEN rn = 1 THEN rating END) AS latest_rating,
        MAX(CASE WHEN rn = 2 THEN rating END) AS middle_rating,
        MAX(CASE WHEN rn = 3 THEN rating END) AS earliest_rating
    FROM ranked_reviews
    WHERE rn <= 3
    GROUP BY employee_id
    HAVING COUNT(*) = 3
)

SELECT 
    e.employee_id,
    e.name,
    (lt.latest_rating - lt.earliest_rating) AS improvement_score
FROM last_three lt
JOIN employees e
    ON e.employee_id = lt.employee_id
WHERE lt.latest_rating > lt.middle_rating
  AND lt.middle_rating > lt.earliest_rating
ORDER BY improvement_score DESC, e.name ASC;
