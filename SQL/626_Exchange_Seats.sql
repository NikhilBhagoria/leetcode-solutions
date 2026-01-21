-- LeetCode 626 – Exchange Seats
-- Difficulty: Medium
--
-- Goal:
-- Swap every two consecutive students.
-- If the number of students is odd, the last student remains unchanged.

SELECT
    ROW_NUMBER() OVER () AS id,
    student
FROM Seat
ORDER BY
    IF(MOD(id, 2) = 0, id - 1, id + 1);
