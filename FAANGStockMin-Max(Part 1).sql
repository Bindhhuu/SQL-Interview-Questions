--https://datalemur.com/questions/sql-bloomberg-stock-min-max-1
WITH monthly_highest_prices AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
    MAX(open) AS highest_open,
    ROW_NUMBER() OVER (
      PARTITION BY ticker
      ORDER BY MAX(open) DESC
    ) AS rnk
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY')
),
monthly_lowest_prices AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
    MIN(open) AS lowest_open,
    ROW_NUMBER() OVER (
      PARTITION BY ticker
      ORDER BY MIN(open) ASC
    ) AS rnk
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY')
)
SELECT
  h.ticker,
  h.highest_mth,
  h.highest_open,
  l.lowest_mth,
  l.lowest_open
FROM monthly_highest_prices h
JOIN monthly_lowest_prices l
  ON h.ticker = l.ticker
WHERE h.rnk = 1 AND l.rnk = 1
ORDER BY h.ticker;
