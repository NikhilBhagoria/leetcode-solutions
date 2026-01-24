-- LeetCode 1158: Market Analysis I
-- Difficulty: Medium
-- ---------------------------------------
-- Description:
-- For each user, find the number of orders they made in 2019.
-- Users with zero orders in 2019 must also be included.

SELECT 
    u.user_id AS buyer_id,
    u.join_date,
    COUNT(o.order_id) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
    ON u.user_id = o.buyer_id
   AND o.order_date >= '2019-01-01'
   AND o.order_date < '2020-01-01'
GROUP BY u.user_id, u.join_date;

-- Explanation:
-- 1. LEFT JOIN ensures all users are returned, even if they have no orders.
-- 2. Date filter is applied in the JOIN condition to avoid converting LEFT JOIN to INNER JOIN.
-- 3. COUNT(o.order_id) counts only orders placed in 2019.
-- 4. GROUP BY is required because we are using an aggregate function (COUNT).

-- Output Columns:
-- buyer_id | join_date | orders_in_2019
