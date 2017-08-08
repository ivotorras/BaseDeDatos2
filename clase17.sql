-- classicmodels
SELECT *
FROM customers

CREATE INDEX postalCode ON customers(postalCode);

DROP INDEX postalCodee ON customers




SELECT *
FROM products


ALTER TABLE products 
ADD FULLTEXT(productline);


SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');


SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');


ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('1932,Ford');

SELECT productName, productline FROM products where productName LIKE "%1932%";


-- sakila:
-- Ejercicio 1


SELECT * 
FROM address 
WHERE postal_code IN (SELECT postal_code from address AS ad WHERE ad.postal_code like "%515%");

CREATE INDEX address_code ON address(postal_code);  

-- the perfonrmance is a lot better after the creation of the index 



-- Ejercicio 2

SELECT first_name 
FROM actor
WHERE first_name LIKE "%penelope%";


SELECT last_name 
FROM actor
WHERE last_name LIKE "%chase%";
-- Again, it should be better


SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE "%crowe%"; -- pruebo una cosa



-- Ejercicio 3

SELECT *
FROM film
WHERE description LIKE '%Fanciful %';

ALTER TABLE film_text 
ADD FULLTEXT(description);

SELECT *
FROM film_text
WHERE MATCH(description) AGAINST('Fanciful ');

SELECT *
FROM film
