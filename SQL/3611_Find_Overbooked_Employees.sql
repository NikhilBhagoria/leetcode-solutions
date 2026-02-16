/*
LeetCode 3611 - Find Overbooked Employees

Problem:
Find employees who spend more than 50% of their working time (more than 20 hours)
in meetings during any given week.

Assumptions:
- Standard work week = 40 hours
- Meeting-heavy week = total meeting hours > 20
- Week is calculated from Monday to Sunday
- Return employees who were meeting-heavy for at least 2 weeks

Tables:
employees
---------
employee_id (PK)
employee_name
department

meetings
---------
meeting_id (PK)
employee_id (FK)
meeting_date
meeting_type ('Team', 'Client', 'Training')
duration_hours

Output:
employee_id
employee_name
department
meeting_heavy_weeks

Order By:
1. meeting_heavy_weeks DESC
2. employee_name ASC
*/

-- Step 1: Calculate total meeting hours per employee per week (Monday–Sunday)
WITH weekly_hours AS (
    SELECT
        employee_id,
        YEARWEEK(meeting_date, 1) AS week_id,   -- Mode 1: Week starts on Monday
        SUM(duration_hours) AS total_hours
    FROM meetings
    GROUP BY employee_id, YEARWEEK(meeting_date, 1)
),

-- Step 2: Identify meeting-heavy weeks (> 20 hours)
meeting_heavy AS (
    SELECT
        employee_id,
        COUNT(*) AS meeting_heavy_weeks
    FROM weekly_hours
    WHERE total_hours > 20
    GROUP BY employee_id
    HAVING COUNT(*) >= 2
)

-- Step 3: Get employee details
SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    mh.meeting_heavy_weeks
FROM meeting_heavy mh
JOIN employees e
    ON e.employee_id = mh.employee_id
ORDER BY
    mh.meeting_heavy_weeks DESC,
    e.employee_name ASC;
