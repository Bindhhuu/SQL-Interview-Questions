-- https://datalemur.com/questions/laptop-mobile-viewership
SELECT 
      COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) as laptop_views,
      COUNT(CASE WHEN device_type = 'phone' OR device_type = 'tablet' THEN 1 END) as phone_views
FROM viewership;
