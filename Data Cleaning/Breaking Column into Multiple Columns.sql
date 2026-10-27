# Breaking Column into Multiple Columns

SELECT *
FROM customer_sweepstakes2;

SELECT address, SUBSTRING_INDEX(address, ',', 1)
FROM customer_sweepstakes2;

SELECT address, SUBSTRING_INDEX(address, ',', 1), SUBSTRING_INDEX(address, ',', -1)
FROM customer_sweepstakes2;

SELECT address, 
SUBSTRING_INDEX(address, ',', 1) AS Street, 
SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',', -1) AS City,
SUBSTRING_INDEX(address, ',', -1) AS State
FROM customer_sweepstakes2;

SELECT *
FROM customer_sweepstakes2;

ALTER TABLE customer_sweepstakes2
ADD COLUMN street VARCHAR(50) AFTER address;

ALTER TABLE customer_sweepstakes2
ADD COLUMN city VARCHAR(50) AFTER street,
ADD COLUMN state VARCHAR(50) AFTER city;


SELECT address, 
SUBSTRING_INDEX(address, ',', 1) AS Street, 
SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',', -1) AS City,
SUBSTRING_INDEX(address, ',', -1) AS State
FROM customer_sweepstakes2;


UPDATE customer_sweepstakes2
SET street = SUBSTRING_INDEX(address, ',', 1);

UPDATE customer_sweepstakes2
SET city = SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',', -1);

UPDATE customer_sweepstakes2
SET State = SUBSTRING_INDEX(address, ',', -1);

SELECT state, UPPER(state)
FROM  customer_sweepstakes2;

UPDATE customer_sweepstakes2
SET state = UPPER(state);

SELECT city, TRIM(city)
FROM  customer_sweepstakes2;

UPDATE customer_sweepstakes2
SET city = UPPER(city);

UPDATE customer_sweepstakes2
SET street = UPPER(street);

SELECT *
FROM customer_sweepstakes2;