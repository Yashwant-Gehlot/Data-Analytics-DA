SELECT *
FROM ordered_items;

SELECT *
FROM products;

SELECT DISTINCT p.product_name, o.unit_price, p.sale_price,
p.units_in_stock,
p.sale_price - o.unit_price AS profit,
(p.sale_price - o.unit_price) * p.units_in_stock AS potential_profit
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id
ORDER BY profit DESC;



SELECT oi.order_id, sds.name, oi.status, oi.shipped_date, s.name
FROM supplier_delivery_status sds
JOIN ordered_items oi
	ON sds.order_status_id = oi.status
JOIN suppliers s
	ON oi.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered'
AND year(shipped_date) < 2022;
