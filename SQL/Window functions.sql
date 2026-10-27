# Over Clause + Partition BY

#Here we are tring to get order_total by using group by, we want individual order_total rows to compare it with max(order_total)

SELECT c.customer_id, first_name, MAX(order_total)
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
GROUP BY c.customer_id, first_name;

# Use of over() clause
SELECT c.customer_id, first_name, order_total, MAX(order_total) OVER() AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id;

# By using subquery
SELECT c.customer_id, first_name, order_total, (SELECT MAX(order_total) FROM customer_orders) as max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id;
    
# Over Clause + Partition BY
SELECT c.customer_id, first_name, order_total, 
MAX(order_total) OVER(PARTITION BY customer_id) AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id;