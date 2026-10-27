# Deleting Unused Column

SELECT *
FROM customer_sweepstakes2;

ALTER TABLE customer_sweepstakes2
DROP COLUMN address;

ALTER TABLE customer_sweepstakes2
DROP COLUMN favorite_color;