SELECT * 
FROM customers
WHERE customer_id IN (
SELECT DISTINCT customer_id
FROM customer_orders);

SELECT *
FROM customers
WHERE total_money_spent >
(SELECT AVG(total_money_spent)
FROM customers);

SELECT *
FROM customers;
SELECT *
FROM customer_orders;
SELECT *
FROM products;
SELECT product_id
FROM products
WHERE  product_name like 'Chocolate%';

SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM customer_orders
WHERE product_id IN (SELECT product_id
FROM products
WHERE  product_name like 'Chocolate%'));

SELECT DISTINCT first_name, last_name
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE product_id IN (SELECT product_id
FROM products
WHERE  product_name like 'Chocolate%');


#PRACTICE QUESTION
# Using the employees table, use a subquery to select the 2nd highest paid employee

SELECT * 
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT * 
FROM employees
WHERE salary NOT IN (
	SELECT MAX(salary)
    FROM employees
)
ORDER BY salary DESC
LIMIT 1;

SELECT MAX(salary)
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT *
FROM (
	SELECT e.*,
		DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
	FROM employees e
) t
WHERE rnk = 2;

SELECT product_id, quantity, (SELECT AVG(quantity) FROM ordered_items)
FROM ordered_items;

SELECT product_id,
quantity,
(SELECT SUM(quantity) FROM ordered_items) AS sum_of_quantity,
quantity/(SELECT SUM(quantity) FROM ordered_items)*100 AS percentage_of_all_orders
FROM ordered_items;

SELECT customer_id, order_total, (SELECT AVG(order_total) FROM customer_orders) 
FROM customer_orders
WHERE order_total >  (SELECT AVG(order_total) FROM customer_orders);