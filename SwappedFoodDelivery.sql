--https://datalemur.com/questions/sql-swapped-food-delivery

SELECT 
    order_id,
    CASE 
        WHEN LEAD(item) OVER () IS NULL THEN item -- no further values
        WHEN (order_id % 2 != 0) THEN 
            LEAD(item) OVER (ORDER BY order_id) -- look ahead
        ELSE 
            LAG(item) OVER (ORDER BY order_id) -- look behind
    END AS item
FROM orders;
