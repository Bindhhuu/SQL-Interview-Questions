-- Question link: https://datalemur.com/questions/sql-histogram-tweets
SELECT tweet_count AS tweet_bucket,
       COUNT(*) AS users_num
FROM (
    SELECT user_id, COUNT(*) AS tweet_count
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY user_id
) AS user_tweet_counts
GROUP BY tweet_count
ORDER BY tweet_bucket;

