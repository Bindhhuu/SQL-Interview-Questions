--https://datalemur.com/questions/signup-confirmation-rate

SELECT 
  ROUND(
    COUNT(DISTINCT CASE WHEN t.signup_action = 'Confirmed' THEN e.email_id END) * 1.0 
    / COUNT(DISTINCT e.email_id), 
    2
  ) AS confirm_rate
FROM emails e
LEFT JOIN texts t 
  ON e.email_id = t.email_id;
