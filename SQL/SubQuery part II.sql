# SubQuery in Select and From Statement

SELECT product_id, 
quantity, 
(SELECT AVG(quantity) FROM  ordered_items) avg_quantity
FROM ordered_items;

SELECT product_id, 
quantity, 
(SELECT SUM(quantity) FROM  ordered_items) avg_quantity,
(quantity/(SELECT SUM(quantity) FROM  ordered_items)*100) sum_quantity
FROM ordered_items;


SELECT product_id, avg_quantity
FROM (SELECT product_id, 
quantity, 
(SELECT AVG(quantity) FROM  ordered_items) avg_quantity
FROM ordered_items) AS avg_quant;
