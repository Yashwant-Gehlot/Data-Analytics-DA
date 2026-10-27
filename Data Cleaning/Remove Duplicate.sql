#Removing Duplicates

SELECT * 
FROM bakery.customer_sweepstakes;

#ALTER TABLE customer_sweepstakes RENAME COLUMN `ï»¿sweepstake_id` TO `sweepstake_id`

SELECT customer_id, COUNT(customer_id)
FROM bakery.customer_sweepstakes
GROUP BY customer_id
HAVING  COUNT(customer_id) > 1;

SELECT *
FROM (SELECT customer_id,
ROW_NUMBER() OVER(PARTITION BY customer_id ) AS row_num
FROM bakery.customer_sweepstakes) AS row_table
WHERE row_num > 1
;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM customer_sweepstakes
WHERE sweepstake_id IN (
SELECT sweepstake_id
FROM (SELECT sweepstake_id,
ROW_NUMBER() OVER(PARTITION BY customer_id ) AS row_num
FROM bakery.customer_sweepstakes) AS row_table
WHERE row_num > 1);