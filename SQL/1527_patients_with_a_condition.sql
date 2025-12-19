-- LeetCode 1527 - Patients With a Condition
-- Difficulty: Easy
--
-- Goal:
-- Find all patients who have a condition starting with 'DIAB1'.
--
-- Table: Patients
-- +------------+--------------+
-- | Column Name| Type         |
-- +------------+--------------+
-- | patient_id | INT          |
-- | patient_name | VARCHAR    |
-- | conditions | VARCHAR     |
--
-- Conditions column:
-- - Stores multiple conditions separated by spaces
-- - We need to find patients having 'DIAB1' as a condition
-- - 'DIAB1' must be a full word or at the beginning

SELECT 
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE 
    conditions LIKE 'DIAB1%'
    OR conditions LIKE '% DIAB1%';

-- Explanation:
-- 1. 'DIAB1%'     → condition starts with DIAB1
-- 2. '% DIAB1%'   → DIAB1 appears after a space (middle or end)
-- This ensures we do NOT match cases like 'DIAB100'.
