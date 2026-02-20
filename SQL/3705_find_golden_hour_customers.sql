-- 3705 - Find Golden Hour Customers

SELECT
    customer_id,
    total_orders,
    ROUND(peak_orders * 100.0 / total_orders) AS peak_hour_percentage,
    ROUND(avg_rating, 2) AS average_rating
FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        
        -- Count peak hour orders
        SUM(
            CASE 
                WHEN TIME(order_timestamp) BETWEEN '11:00:00' AND '14:00:00'
                  OR TIME(order_timestamp) BETWEEN '18:00:00' AND '21:00:00'
                THEN 1 
                ELSE 0
            END
        ) AS peak_orders,
        
        -- Count rated orders (NULL ignored automatically)
        COUNT(order_rating) AS rated_orders,
        
        -- Average rating (NULL ignored automatically)
        AVG(order_rating) AS avg_rating
        
    FROM restaurant_orders
    GROUP BY customer_id
) AS summary
WHERE
    total_orders >= 3
    AND peak_orders * 1.0 / total_orders >= 0.6
    AND rated_orders * 1.0 / total_orders >= 0.5
    AND avg_rating >= 4.0
ORDER BY 
    average_rating DESC,
    customer_id DESC;