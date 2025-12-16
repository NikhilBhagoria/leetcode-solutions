-- LeetCode 1407. Top Travellers
-- Difficulty: Easy
--
-- Goal:
-- Report the distance traveled by each user.
-- If a user has no rides, their traveled distance should be 0.
-- Result should be ordered by traveled_distance DESC, then name ASC.
--
-- Tables:
-- Users
-- +------+-----------+
-- | id   | name      |
-- +------+-----------+
-- | 1    | Alice     |
-- | 2    | Bob       |
-- | 3    | Alex      |
-- | 4    | Donald    |
-- | 7    | Lee       |
-- | 13   | Jonathan  |
-- | 19   | Elvis     |
-- +------+-----------+

-- Rides
-- +------+----------+----------+
-- | id   | user_id  | distance |
-- +------+----------+----------+
-- | 1    | 1        | 120      |
-- | 2    | 2        | 317      |
-- | 3    | 3        | 222      |
-- | 4    | 7        | 100      |
-- | 5    | 13       | 312      |
-- | 6    | 19       | 50       |
-- | 7    | 7        | 120      |
-- | 8    | 19       | 400      |
-- | 9    | 7        | 230      |
-- +------+----------+----------+

SELECT
    u.name,
    IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
    ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

-- Explanation:
-- 1. LEFT JOIN ensures users with no rides are included.
-- 2. SUM(r.distance) calculates total distance per user.
-- 3. IFNULL converts NULL distances to 0.
-- 4. GROUP BY user id and name to aggregate correctly.
-- 5. ORDER BY total distance (DESC) and name (ASC).