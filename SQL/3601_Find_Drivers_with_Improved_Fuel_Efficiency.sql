-- LeetCode 3601. Find Drivers with Improved Fuel Efficiency
-- Difficulty: Medium

WITH trip_efficiency AS (
    SELECT
        driver_id,
        CASE 
            WHEN MONTH(trip_date) BETWEEN 1 AND 6 THEN 'first'
            ELSE 'second'
        END AS half_year,
        distance_km / fuel_consumed AS efficiency
    FROM trips
),

avg_efficiency AS (
    SELECT
        driver_id,
        half_year,
        AVG(efficiency) AS avg_eff
    FROM trip_efficiency
    GROUP BY driver_id, half_year
),

first_half AS (
    SELECT driver_id, avg_eff AS first_half_avg
    FROM avg_efficiency
    WHERE half_year = 'first'
),

second_half AS (
    SELECT driver_id, avg_eff AS second_half_avg
    FROM avg_efficiency
    WHERE half_year = 'second'
)

SELECT
    d.driver_id,
    d.driver_name,
    ROUND(f.first_half_avg, 2) AS first_half_avg,
    ROUND(s.second_half_avg, 2) AS second_half_avg,
    ROUND(s.second_half_avg - f.first_half_avg, 2) AS efficiency_improvement
FROM drivers d
JOIN first_half f 
    ON d.driver_id = f.driver_id
JOIN second_half s 
    ON d.driver_id = s.driver_id
WHERE (s.second_half_avg - f.first_half_avg) > 0
ORDER BY efficiency_improvement DESC, d.driver_name ASC;
