/*
    LeetCode 3374 - First Letter Capitalization II
    Difficulty: Hard

    Table: user_content

    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | content_id  | int     |
    | content_text| varchar |
    +-------------+---------+
    content_id is the unique key.

    ------------------------------------------------------------
    Problem Description
    ------------------------------------------------------------
    Transform the text in the content_text column using the following rules:

    1. Convert the first letter of each word to uppercase.
    2. Convert the remaining letters to lowercase.
    3. For hyphenated words (e.g., top-rated), capitalize both parts.
    4. Preserve all original spacing and formatting.
    5. Return:
    - content_id
    - original_text
    - converted_text

    Example:
    Input:
    hello world of SQL
    the QUICK-brown fox

    Output:
    Hello World Of Sql
    The Quick-Brown Fox
*/

select
    content_id,
    content_text original_text,
    substr(
        regexp_replace(doubled_content_text, regex, "$1"),
        1,
        char_length(content_text)
    ) converted_text
from (
    select
        content_id,
        content_text,
        concat(lcase(content_text), ucase(content_text)) doubled_content_text,
        concat("(?<=[ -]|^)[a-z](?=.{", char_length(content_text) - 1, "}([a-z]))") regex
    from user_content
) temp