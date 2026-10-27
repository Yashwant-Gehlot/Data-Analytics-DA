# Regular Expression Metacharacters

# [-.^$*+?}|

SELECT *
FROM customers
WHERE first_name REGEXP 'k';

SELECT *
FROM customers
WHERE first_name REGEXP '[a-c]';

SELECT *
FROM customers
WHERE total_money_spent REGEXP '[0-9]'; #[] give us the ablity to play with range

SELECT *
FROM customers
WHERE phone REGEXP '.'; # any character present

SELECT *
FROM customers
WHERE phone REGEXP '6.'; #finding any character after 6

SELECT *
FROM customers
WHERE phone REGEXP 'k...n';

SELECT *
FROM customers
WHERE first_name REGEXP '^k'; #start with K, Beginning values

SELECT *
FROM customers
WHERE first_name REGEXP 'n$'; #end with n, and dollar sign should be use at the end, ending values

SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.*'; # . is any character and * is occurance, It will work, if even no character after OBI

SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.+';  #. is any character and + is atleast one character should be after OBI

SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.?';  #. is any character and ? should limit how many you search for 0 and 1 occurance

SELECT *
FROM customers
WHERE first_name REGEXP 'k.?n'; #0 or 1 character

SELECT *
FROM customers
WHERE first_name REGEXP 'k.{3}n'; #how many are previous meta character is this, 3 character like this .

SELECT *
FROM customers
WHERE first_name REGEXP 'kev|fro'; #Bar means either or, 



