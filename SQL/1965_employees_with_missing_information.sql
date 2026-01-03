/*
LeetCode 1965 - Employees With Missing Information

Problem:
We are given two tables:
1. Employees(employee_id, name)
2. Salaries(employee_id, salary)

Task:
Find employee_ids that are missing information:
- Either the employee exists without salary
- Or salary exists without employee information

Return the result ordered by employee_id.
*/

-- Step 1:
-- Select employee_ids present in Employees
-- but missing in Salaries
SELECT employee_id
FROM Employees
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM Salaries
)

UNION

-- Step 2:
-- Select employee_ids present in Salaries
-- but missing in Employees
SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM Employees
)

-- Step 3:
-- Sort the final result in ascending order
ORDER BY employee_id ASC;
