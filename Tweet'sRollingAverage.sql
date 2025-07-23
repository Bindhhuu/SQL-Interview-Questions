-- https://datalemur.com/questions/rolling-average-tweets
SELECT user_id, tweet_date, ROUND(AVG(tweet_count) 
OVER(PARTITION BY user_id ORDER BY tweet_date 
RANGE BETWEEN INTERVAL '2 days' PRECEDING AND CURRENT ROW), 2)
AS rolling_avg_3d FROM tweets;

