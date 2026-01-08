-- LeetCode 3570 - Find Books with No Available Copies
-- Difficulty: Easy
--
-- Table: library_books
-- Each row represents a book and its total copies in the library.
--
-- Table: borrowing_records
-- Each row represents a borrowing transaction.
-- return_date IS NULL means the book is currently borrowed.
--
-- Goal:
-- 1. Find books that are currently borrowed.
-- 2. Calculate the number of current borrowers per book.
-- 3. Include only books where available copies = 0
--    (total_copies - current_borrowers = 0)
-- 4. Order results by:
--    - current_borrowers DESC
--    - title ASC

SELECT
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    COUNT(br.record_id) AS current_borrowers
FROM
    library_books lb
JOIN
    borrowing_records br
    ON lb.book_id = br.book_id
WHERE
    br.return_date IS NULL
GROUP BY
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    lb.total_copies
HAVING
    COUNT(br.record_id) = lb.total_copies
ORDER BY
    current_borrowers DESC,
    lb.title ASC;
