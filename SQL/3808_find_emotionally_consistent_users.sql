-- Problem: 3808. Find Emotionally Consistent Users
--
-- Description:
-- Find users who reacted to at least 5 contents and whose
-- most frequent reaction makes up at least 60% of their reactions.
-- Return dominant reaction and ratio rounded to 2 decimals.

WITH reaction_counts AS (
    SELECT 
        user_id,
        reaction,
        COUNT(*) AS reaction_count
    FROM reactions
    GROUP BY user_id, reaction
),
total_counts AS (
    SELECT 
        user_id,
        COUNT(*) AS total_reactions
    FROM reactions
    GROUP BY user_id
),
dominant_reactions AS (
    SELECT 
        rc.user_id,
        rc.reaction AS dominant_reaction,
        rc.reaction_count,
        tc.total_reactions,
        ROW_NUMBER() OVER (
            PARTITION BY rc.user_id
            ORDER BY rc.reaction_count DESC, rc.reaction
        ) AS rn
    FROM reaction_counts rc
    JOIN total_counts tc
        ON rc.user_id = tc.user_id
)

SELECT
    user_id,
    dominant_reaction,
    ROUND(reaction_count * 1.0 / total_reactions, 2) AS reaction_ratio
FROM dominant_reactions
WHERE rn = 1
  AND total_reactions >= 5
  AND reaction_count * 1.0 / total_reactions >= 0.6
ORDER BY reaction_ratio DESC, user_id ASC;