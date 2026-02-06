-- ----------------------------------------------------
-- LeetCode 3421. Find Students Who Improved
-- ----------------------------------------------------
-- A student is considered improved if:
-- 1. They took at least two exams in the same subject
-- 2. Their latest score is higher than their first score
-- ----------------------------------------------------

WITH RankedScores AS (
    SELECT
        student_id,
        subject,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date
        ) AS first_score,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date DESC
        ) AS latest_score
    FROM Scores
)

SELECT DISTINCT
    student_id,
    subject,
    first_score,
    latest_score
FROM RankedScores
WHERE latest_score > first_score
ORDER BY student_id, subject;
