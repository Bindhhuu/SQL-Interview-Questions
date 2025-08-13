--https://datalemur.com/questions/amazon-shopping-spree

SELECT DISTINCT t1.user_id
FROM transactions t1
INNER JOIN transactions t2 
  ON DATE(t1.transaction_date) + INTERVAL '1 day' = DATE(t2.transaction_date)
  AND t1.user_id = t2.user_id
INNER JOIN transactions t3 
  ON DATE(t1.transaction_date) + INTERVAL '2 day' = DATE(t3.transaction_date)
  AND t1.user_id = t3.user_id
ORDER BY t1.user_id;
