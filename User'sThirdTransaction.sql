-- https://datalemur.com/questions/sql-third-transaction
SELECT user_id, spend, transaction_date
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS txn_rank
  FROM transactions
) ranked
WHERE txn_rank = 3;
