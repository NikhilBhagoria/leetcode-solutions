-- LeetCode 2356 - Number of Unique Subjects Taught by Each Teacher
-- Difficulty: Easy
--
-- Table: Teacher
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
--
-- (subject_id, dept_id) is the primary key.
-- Each row indicates that a teacher teaches a subject in a department.
--
-- Goal:
-- Calculate the number of UNIQUE subjects taught by each teacher.
-- A subject taught in multiple departments should be counted ONLY ONCE.

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY
    teacher_id;
