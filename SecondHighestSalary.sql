-- https://datalemur.com/questions/sql-second-highest-salary
SELECT salary AS second_highest_salary
FROM (
SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as sal FROM employee)
ranked WHERE sal = 2 ;
