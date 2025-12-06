-- LeetCode 1075. Project Employees I
-- Difficulty: Easy
-- 
-- Goal:
-- For each project, return the project_id and the average experience (in years)
-- of all employees who worked on that project.
--
-- Tables:
--
-- Project:
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+

-- Employee:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+
--
-- Schema:
-- CREATE TABLE Project (
--   project_id INT,
--   employee_id INT
-- );
-- CREATE TABLE Employee (
--   employee_id INT,
--   name VARCHAR(100),
--   experience_years INT
-- );
-- Solution:
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project p
JOIN 
    Employee e ON p.employee_id = e.employee_id
GROUP BY 
    p.project_id;
-- Explanation:
-- 1. We perform an inner join between the Project and Employee tables on employee_id to combine project assignments with employee experience.
-- 2. We then group the results by project_id to calculate the average experience for each project.
-- 3. The AVG function computes the average experience_years for employees in each project, and we use ROUND to format the result to two decimal places.
-- 4. Finally, we select the project_id and the calculated average experience as average_years.
-- Expected Output:
-- +-------------+---------------+
-- | project_id  | average_years |
-- +-------------+---------------+
-- | 1           | 2.00          |
-- | 2           | 2.50          |
-- +-------------+---------------+
-- Note: The average_years is rounded to two decimal places as specified in the problem statement.
