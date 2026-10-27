#Rank and Dense Rank

SELECT *,
RANK() OVER(partition by department ORDER BY salary)
FROM  employees;

# Top two highly paid employee in individual department
SELECT *
FROM (
SELECT *,
RANK() OVER(partition by department ORDER BY salary DESC) as rn
FROM  employees) row_table
WHERE rn < 3  ;

# Dense Rank
SELECT *,
RANK() OVER(partition by department ORDER BY salary) AS rank_,
DENSE_RANK() OVER(partition by department ORDER BY salary) AS DENSE_
FROM  employees;