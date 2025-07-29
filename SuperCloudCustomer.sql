--https://datalemur.com/questions/supercloud-customer

SELECT customer_id FROM customer_contracts c 
JOIN products p on c.product_id = p.product_id
GROUP BY customer_id HAVING
COUNT(DISTINCT p.product_category) = (SELECT COUNT(DISTINCT product_category) 
FROM products);
