/*
LeetCode 3586. Find COVID Recovery Patients

Problem Summary:
We need to find patients who have recovered from COVID.

A patient is considered recovered if:
1. They have at least one 'Positive' test.
2. They have at least one 'Negative' test AFTER that positive date.
3. Recovery time = days between:
   - First Positive test
   - First Negative test after that Positive
4. Ignore 'Inconclusive' tests.
5. Return only patients who satisfy both conditions.
6. Order result by:
   - recovery_time ASC
   - patient_name ASC

Tables:
patients(patient_id, patient_name, age)
covid_tests(test_id, patient_id, test_date, result)
*/

-- Step 1: Get first positive test date for each patient
WITH first_positive AS (
    SELECT 
        patient_id,
        MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),

-- Step 2: For each patient, find the first negative test AFTER the first positive
first_negative_after_positive AS (
    SELECT 
        ct.patient_id,
        MIN(ct.test_date) AS first_negative_date
    FROM covid_tests ct
    JOIN first_positive fp
        ON ct.patient_id = fp.patient_id
    WHERE ct.result = 'Negative'
      AND ct.test_date > fp.first_positive_date
    GROUP BY ct.patient_id
)

-- Step 3: Calculate recovery time and return required details
SELECT 
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(fn.first_negative_date, fp.first_positive_date) AS recovery_time
FROM patients p
JOIN first_positive fp
    ON p.patient_id = fp.patient_id
JOIN first_negative_after_positive fn
    ON p.patient_id = fn.patient_id
ORDER BY recovery_time ASC, p.patient_name ASC;
