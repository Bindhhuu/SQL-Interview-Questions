--https://datalemur.com/questions/matching-skills

SELECT candidate_id
FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL', 'R')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) >= 3
ORDER BY candidate_id ASC;
