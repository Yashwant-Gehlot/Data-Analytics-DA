-- USING Temporary Table

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50), 
last_name varchar(50),
faviorite_movie varchar(100)
);


SELECT *
FROM temp_table;

INSERT INTO temp_table VALUES ( 'Yashwant', 'Gehlot', 'Bahubali'
);

CREATE TEMPORARY TABLE temp_table2
SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM temp_table2;