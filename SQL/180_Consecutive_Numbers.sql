-- LeetCode 180 – Consecutive Numbers
-- Difficulty: Medium
--
-- We need to find numbers that appear at least
-- three times consecutively in the table.

SELECT DISTINCT l1.Num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.Id = l2.Id - 1
JOIN Logs l3 ON l2.Id = l3.Id - 1
WHERE l1.Num = l2.Num
  AND l2.Num = l3.Num;
-- The query uses self-joins to compare each row with the next two rows
-- based on the Id to check for three consecutive identical numbers.