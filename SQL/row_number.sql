# Row Number

SELECT c.customer_id, first_name, order_total, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id;

SELECT *
FROM 
(SELECT c.customer_id, first_name, order_total, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id) AS row_table
WHERE row_num < 3;