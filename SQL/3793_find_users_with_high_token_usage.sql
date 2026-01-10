-- LeetCode 3793 – Find Users with High Token Usage
-- Difficulty: Easy
--
-- A user is considered to have high token usage if:
-- 1. They have submitted more than 2 prompts
-- 2. The maximum tokens used in any prompt is greater than
--    the average tokens used by that user
--
-- Return:
-- user_id, prompt_count, avg_tokens
-- Order by avg_tokens DESC, then user_id ASC

SELECT
    user_id,
    COUNT(prompt) AS prompt_count,
    ROUND(AVG(tokens), 2) AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING
    COUNT(prompt) > 2
    AND MAX(tokens) > AVG(tokens)
ORDER BY
    avg_tokens DESC,
    user_id ASC;
