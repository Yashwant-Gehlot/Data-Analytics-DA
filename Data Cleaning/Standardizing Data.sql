# Standardizing Data

SELECT phone
FROM bakery.customer_sweepstakes2;

SELECT phone, REGEXP_REPLACE(phone, '[()-/+]', '')
FROM customer_sweepstakes2;

UPDATE customer_sweepstakes2
SET phone = REGEXP_REPLACE(phone, '[()-/+]', '');

SELECT phone, CONCAT(SUBSTRING(phone, 1, 3), '-', SUBSTRING(phone, 4, 3), '-', SUBSTRING(phone, 7, 4))
FROM customer_sweepstakes2
WHERE phone <> '';

UPDATE customer_sweepstakes2
SET phone = CONCAT(SUBSTRING(phone, 1, 3), '-', SUBSTRING(phone, 4, 3), '-', SUBSTRING(phone, 7, 4))
WHERE phone <> '';

SELECT phone
FROM customer_sweepstakes2;

SELECT birth_date
FROM customer_sweepstakes2;

SELECT birth_date, 
STR_TO_DATE(birth_date, '%m/%d/%Y'),
STR_TO_DATE(birth_date, '%Y/%d/%m')
FROM customer_sweepstakes2;

SELECT birth_date, 
IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date, '%m/%d/%Y'), STR_TO_DATE(birth_date, '%Y/%d/%m')),
STR_TO_DATE(birth_date, '%m/%d/%Y'),
STR_TO_DATE(birth_date, '%Y/%d/%m')
FROM customer_sweepstakes2;

UPDATE customer_sweepstakes2
SET birth_date = IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date, '%m/%d/%Y'), STR_TO_DATE(birth_date, '%Y/%d/%m'));

#Real one which will work, IT DIDN'T WORK
UPDATE customer_sweepstakes2
SET birth_date = CASE 
WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL THEN STR_TO_DATE(birth_date, '%m/%d/%Y')
WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NULL THEN STR_TO_DATE(birth_date, '%Y/%d/%m')
END;

SELECT birth_date, SUBSTRING(birth_date, 9, 2), SUBSTRING(birth_date, 6, 2), SUBSTRING(birth_date, 1, 4)
FROM customer_sweepstakes2;

SELECT birth_date
FROM customer_sweepstakes2;

SELECT *, SUBSTRING(birth_date, 9, 2), SUBSTRING(birth_date, 6, 2), SUBSTRING(birth_date, 1, 4)
FROM customer_sweepstakes2;

SELECT customer_id, birth_date, CONCAT(SUBSTRING(birth_date, 9, 2), '/', SUBSTRING(birth_date, 6, 2), '/', SUBSTRING(birth_date, 1, 4))
FROM customer_sweepstakes2;

UPDATE customer_sweepstakes2
SET birth_date = CONCAT(SUBSTRING(birth_date, 9, 2), '/', SUBSTRING(birth_date, 6, 2), '/', SUBSTRING(birth_date, 1, 4))
WHERE sweepstake_id IN (9, 11);

UPDATE customer_sweepstakes2
SET birth_date = STR_TO_DATE(birth_date, '%m/%d/%Y');

SELECT *
FROM customer_sweepstakes2;

SELECT `Are you over 18?`
FROM customer_sweepstakes2;

SELECT `Are you over 18?`,
CASE 
	WHEN `Are you over 18?` = 'Yes' THEN 'Y'
    WHEN `Are you over 18?` = 'NO' THEN 'N'
    ELSE `Are you over 18?`
END
FROM customer_sweepstakes;

UPDATE customer_sweepstakes2
SET `Are you over 18?` = CASE 
	WHEN `Are you over 18?` = 'Yes' THEN 'Y'
    WHEN `Are you over 18?` = 'NO' THEN 'N'
    ELSE `Are you over 18?`
END;
