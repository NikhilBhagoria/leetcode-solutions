-- LeetCode 1683 - Invalid Tweets
-- Difficulty: Easy
--
-- Goal:
-- Find the IDs of tweets that have content longer than 15 characters.
--
-- Table: Tweets
-- +----------+----------------+
-- | tweet_id | content        |
-- +----------+----------------+
--
-- Schema:
-- CREATE TABLE Tweets (
--   tweet_id INT,
--   content VARCHAR
-- );

SELECT
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- Explanation:
-- LENGTH(content) returns the number of characters in the tweet content.
-- Tweets with more than 15 characters are considered invalid.