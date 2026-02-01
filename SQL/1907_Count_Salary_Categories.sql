/*
LeetCode 1907 - Count Salary Categories
Difficulty: Medium

Table: Accounts

+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+

Salary Categories:
- Low Salary: income < 20000
- Average Salary: income between 20000 and 50000 (inclusive)
- High Salary: income > 50000
*/

SELECT
    c.category,
    COUNT(a.account_id) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) c
LEFT JOIN Accounts a
    ON (
        (c.category = 'Low Salary' AND a.income < 20000)
        OR
        (c.category = 'Average Salary' AND a.income BETWEEN 20000 AND 50000)
        OR
        (c.category = 'High Salary' AND a.income > 50000)
    )
GROUP BY c.category;
