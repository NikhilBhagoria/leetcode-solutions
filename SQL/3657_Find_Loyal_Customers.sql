/*
===========================================================
LeetCode 3657 - Find Loyal Customers
===========================================================

Table: customer_transactions

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| transaction_id   | int     |
| customer_id      | int     |
| transaction_date | date    |
| amount           | decimal |
| transaction_type | varchar |
+------------------+---------+

transaction_id is the unique identifier.
transaction_type can be 'purchase' or 'refund'.

-----------------------------------------------------------
Problem Statement
-----------------------------------------------------------
A customer is considered loyal if they satisfy ALL:

1. Made at least 3 purchase transactions.
2. Have been active for at least 30 days.
   (difference between earliest and latest transaction date)
3. Refund rate is less than 20%.

Refund Rate Formula:
    refund_count / total_transactions

Return the result ordered by customer_id ASC.

-----------------------------------------------------------
Approach
-----------------------------------------------------------
1. Group data by customer_id.
2. Use conditional aggregation:
      - Count purchases
      - Count refunds
3. Calculate active days using:
      DATEDIFF(MAX(date), MIN(date))
4. Filter using HAVING clause.

-----------------------------------------------------------
SQL Solution (MySQL)
-----------------------------------------------------------
*/

SELECT customer_id
FROM customer_transactions
GROUP BY customer_id
HAVING
    -- Condition 1: At least 3 purchases
    SUM(CASE 
            WHEN transaction_type = 'purchase' 
            THEN 1 ELSE 0 
        END) >= 3

    -- Condition 2: Active for at least 30 days
    AND DATEDIFF(MAX(transaction_date), 
                 MIN(transaction_date)) >= 30

    -- Condition 3: Refund rate < 20%
    AND (
        SUM(CASE 
                WHEN transaction_type = 'refund' 
                THEN 1 ELSE 0 
            END) * 1.0
        / COUNT(*)
    ) < 0.2

ORDER BY customer_id;