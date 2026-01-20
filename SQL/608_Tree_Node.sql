-- LeetCode 608 – Tree Node
-- Difficulty: Medium
--
-- Goal:
-- Classify each node in the tree as:
-- 1) Root  -> parent is NULL
-- 2) Leaf  -> node has no children
-- 3) Inner -> node has a parent and at least one child

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL)
            THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;
