-- LeetCode 3642 – Find Books with Polarized Opinions
-- Difficulty: Medium
-- Goal:
-- Find books that have polarized opinions.
-- A book has polarized opinions if:
-- 1. It has at least 5 reading sessions.
-- 2. It has at least one rating >= 4 and at least one rating <= 2.
-- 3. The polarization score (number of extreme ratings / total sessions) >= 0.6.
-- Calculate:
--    rating_spread = highest_rating - lowest_rating
--    polarization_score = extreme_ratings / total_sessions
-- Return the result ordered by polarization_score DESC, then title DESC.

SELECT 
    b.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages,
    t.rating_spread,
    t.polarization_score
FROM books b
JOIN (
    SELECT 
        book_id,
        MAX(session_rating) - MIN(session_rating) AS rating_spread,
        ROUND(SUM(session_rating >= 4 OR session_rating <= 2)/COUNT(*), 2) AS polarization_score
    FROM reading_sessions
    GROUP BY book_id
    HAVING COUNT(*) >= 5
       AND MAX(session_rating) >= 4
       AND MIN(session_rating) <= 2
) t USING(book_id)
WHERE t.polarization_score >= 0.6
ORDER BY t.polarization_score DESC, b.title DESC;

-- Explanation:
-- 1. The inner query calculates the following for each book:
--    a) rating_spread: difference between highest and lowest session rating.
--    b) polarization_score: fraction of ratings that are extreme (>=4 or <=2).
--    c) Filters books with at least 5 sessions and a rating spread that includes both high and low ratings.
-- 2. The outer query joins this summary with the 'books' table to get full book information.
-- 3. We filter to include only books where polarization_score >= 0.6.
-- 4. The result is ordered by polarization_score descending and then by title descending.
