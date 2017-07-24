-- EJERCICIO 1

#SELECT country, country_id 
#FROM country;

SELECT CONCAT_WS(" ", first_name, last_name) AS "Nombre", CONCAT_WS(", ", address, city) AS "Domicilio"
FROM customer 
INNER JOIN address USING(address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country_id="6";
#WHERE country.country LIKE 'Argentina';


-- EJERCICIO 2

SELECT title, name AS "Idioma",
CASE rating
    WHEN "PG" THEN "PG (Parental Guidance Suggested) – Some Material May Not Be Suitable For Children."
    WHEN "G" THEN "G (General Audiences) – All Ages Are Admitted."
	WHEN "NC-17" THEN "NC-17 (Adults Only) – No One 17 and Under Admitted."
	WHEN "PG-13" THEN "PG-13 (Parents Strongly Cautioned) – Some Material May Be Inappropriate For Children Under 13."
	WHEN "R" THEN "R (Restricted) – Under 17 Requires Accompanying Parent Or Adult Guardian."
END AS "Rating"
FROM film
INNER JOIN `language` USING (language_id)
ORDER BY rating;


-- EJERCICIO 3

SELECT first_name, last_name
FROM actor

SELECT title, release_year
FROM film 
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("eD cHaSE"));


-- EJERCICIO 4

SELECT film.title,
	   CONCAT_WS(" ", customer.first_name, customer.last_name) as full_name,
	   CASE WHEN rental.return_date IS NOT NULL THEN 'Yes'
	   ELSE 'No' END AS was_returned,
	   MONTHNAME(rental.rental_date) as month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';

   
   
-- EJERCICIO 5

SELECT CAST(last_update AS DATE) as only_date
FROM rental;

SELECT CONVERT("2006-02-15", DATETIME);

-- CAST and CONVERT are pretty much the same, with almost no differences between them
-- And CAST and CONVERT have some differences in the syntax,they're both used to convert data from one type to another.

