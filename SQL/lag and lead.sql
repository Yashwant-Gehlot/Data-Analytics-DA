# Lag and Lead

SELECT *,
LAG(salary) OVER(),
LEAD(salary) OVER()
FROM employees;

SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees;

# pay discrepancy in respect of next employee
SELECT *, lag_col - salary AS pay_discrepancy
FROM (
SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees) AS lag_table;

SELECT *, IF(salary > lag_col, 'More', 'Less')
FROM (
SELECT *,
LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees) AS lag_table;