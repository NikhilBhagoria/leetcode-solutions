-- LeetCode 1280 - Students and Examinations
-- Difficulty: Easy
-- Problem Summary
-- You are given three tables:

-- Students

-- | student_id | student_name |

-- Subjects
-- | subject_name |

-- Examinations
-- | student_id | subject_name |

-- Each row in Examinations means a student attended an exam for a subject.

-- Goal

-- For every student and every subject, report how many times the student attended that subject’s exam.

-- If a student never attended a subject → count should be 0.
-- Return the result ordered by:
-- student_id ASC, subject_name ASC

-- Key Idea
-- We must generate all possible combinations of students × subjects
-- Then LEFT JOIN with Examinations

-- Use COUNT() to count matching exam records

-- This ensures missing exams show up as 0.
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON e.student_id = s.student_id
    AND e.subject_name = sub.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;

-- Explanation (Step by Step)
-- Create all student–subject pairs
-- Students CROSS JOIN Subjects

-- This guarantees every student appears with every subject.

-- Example:

-- Alice + Math
-- Alice + Physics
-- Bob + Math
-- Bob + Physics

-- Left join with Examinations
-- LEFT JOIN Examinations e
--  ON e.student_id = s.student_id
-- AND e.subject_name = sub.subject_name

-- Matches exams if they exist

-- Keeps rows even if no exam exists

-- Count attended exams
-- COUNT(e.subject_name)

-- Counts only non-NULL matches

-- If no exam → returns 0

-- Grouping
-- GROUP BY student_id, student_name, subject_name

-- Required because of aggregation.

-- Ordering
-- ORDER BY student_id, subject_name
