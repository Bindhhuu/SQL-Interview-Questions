--https://datalemur.com/questions/odd-even-measurements

WITH numbered AS (
  SELECT 
    DATE(measurement_time) AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER (
      PARTITION BY DATE(measurement_time)
      ORDER BY measurement_time
    ) AS rn
  FROM measurements
)

SELECT 
  measurement_day,
  SUM(CASE WHEN rn % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN rn % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM numbered
GROUP BY measurement_day
ORDER BY measurement_day;
