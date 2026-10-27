# Working with NULL Values
# Missing values are countable while Null is not countable

SELECT *
FROM  customer_sweepstakes2;

SELECT *
FROM  customers;

SELECT COUNT(sweepstake_id), COUNT(phone) # Missing values present in customer_sweepstakes2 table
FROM  customer_sweepstakes2;			  # Having trouble with aggreagate function like avg, count

SELECT COUNT(customer_id), COUNT(phone) #Null values present in customers table
FROM  customers;						#doesn't make any difference with aggregate function

UPDATE customer_sweepstakes2
SET phone = null
WHERE phone = '';

UPDATE customer_sweepstakes2
SET income = null
WHERE income = '';

SELECT AVG(income)
FROM  customer_sweepstakes2;

SELECT AVG(COALESCE(income, 0))
FROM  customer_sweepstakes2
WHERE income IS NOT NULL;

SELECT AVG(COALESCE(income, 0))
FROM  customer_sweepstakes2;

SELECT birth_date, `Are you over 18?`
FROM  customer_sweepstakes2
WHERE 2023 -18 > YEAR(birth_date);

UPDATE  customer_sweepstakes2
SET `Are you over 18?` = 'N'
WHERE 2023 -18 < YEAR(birth_date);

UPDATE  customer_sweepstakes2
SET `Are you over 18?` = 'Y'
WHERE 2023 -18 > YEAR(birth_date);

SELECT *
FROM customer_sweepstakes2;