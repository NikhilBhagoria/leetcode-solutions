/*
LeetCode 3626: Find Stores with Inventory Imbalance

Problem:
Find stores where the most expensive product has lower stock than the cheapest product.

Conditions:
1. Identify the most expensive product (highest price) and its quantity per store.
2. Identify the cheapest product (lowest price) and its quantity per store.
3. A store has imbalance if:
      most_expensive_quantity < cheapest_quantity
4. Imbalance ratio = cheapest_quantity / most_expensive_quantity
   (Round to 2 decimal places)
5. Include only stores with at least 3 different products.
6. Order result by:
      imbalance_ratio DESC,
      store_name ASC
*/

WITH product_counts AS (
    -- Stores having at least 3 different products
    SELECT store_id
    FROM inventory
    GROUP BY store_id
    HAVING COUNT(DISTINCT product_name) >= 3
),

ranked_products AS (
    -- Rank products by price within each store
    SELECT
        store_id,
        product_name,
        quantity,
        price,
        RANK() OVER (PARTITION BY store_id ORDER BY price DESC) AS highest_price_rank,
        RANK() OVER (PARTITION BY store_id ORDER BY price ASC) AS lowest_price_rank
    FROM inventory
),

extreme_products AS (
    -- Extract most expensive and cheapest product details
    SELECT
        store_id,
        MAX(CASE WHEN highest_price_rank = 1 THEN product_name END) AS most_exp_product,
        MAX(CASE WHEN highest_price_rank = 1 THEN quantity END) AS most_exp_quantity,
        MAX(CASE WHEN lowest_price_rank = 1 THEN product_name END) AS cheapest_product,
        MAX(CASE WHEN lowest_price_rank = 1 THEN quantity END) AS cheapest_quantity
    FROM ranked_products
    GROUP BY store_id
)

SELECT
    s.store_id,
    s.store_name,
    s.location,
    e.most_exp_product,
    e.cheapest_product,
    ROUND(e.cheapest_quantity * 1.0 / e.most_exp_quantity, 2) AS imbalance_ratio
FROM extreme_products e
JOIN product_counts pc
    ON e.store_id = pc.store_id
JOIN stores s
    ON s.store_id = e.store_id
WHERE e.most_exp_quantity < e.cheapest_quantity
ORDER BY imbalance_ratio DESC, s.store_name ASC;
