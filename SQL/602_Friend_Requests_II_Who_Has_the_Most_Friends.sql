/*
-- LeetCode 602 - Friend Requests II: Who Has the Most Friends
-- Difficulty: Medium
--
Topic: SQL (Aggregation, UNION ALL, GROUP BY)

Problem Summary:
Given the 'RequestAccepted' table that logs accepted friend requests,
find the user ID with the most friends and return their ID along with
the total number of friends.

Note:
- Friendship is mutual: if A accepts a request from B, both A and B gain a friend.
- It is guaranteed there is exactly one person with the most friends.

Table Schema:
+----------------+---------+
| Column         | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+

Approach:
1. Treat both requester_id and accepter_id as users who gained a friend.
2. Combine all IDs using UNION ALL (to preserve duplicates).
3. Count occurrences per user → this equals their friend count.
4. Return the user with the highest count.

Time Complexity: O(n log n) due to ORDER BY
Space Complexity: O(n) for intermediate result set
*/

SELECT id, COUNT(*) AS num
FROM (
    -- Collect all users who sent requests
    SELECT requester_id AS id
    FROM RequestAccepted
    
    UNION ALL
    
    -- Collect all users who accepted requests
    SELECT accepter_id AS id
    FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;