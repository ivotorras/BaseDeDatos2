-- 1) Create a view named list_of_customers, it should contain the following columns:
-- customer id, customer full name,  address,  zip code, phone,city, country,  status = active if active or inactive if null and store id
-- 2) Create a view named film_details, it should contain the following columns:
-- film id,  title, description,  category,  price,  length,  rating, actors  - as a string of all the actors separated by comma. Hint use GROUP_CONCAT
-- 3) Create view sales_by_film_category, it should return 'category' and 'total_rental' columns.
-- 4) Create a view called actor_information where it should return, actor id, first name, last name and the amount of films he/she acted on.
-- 5) Analyze view actor_info, explain the entire query and specially how the sub query works. Be very specific, take some time and decompose each part and give an explanation for each. 
-- 6) Materialized views, write a description, why they are used, alternatives, DBMS were they exist, etc.




-- Ejercicio 1
DROP VIEW IF EXISTS list_of_customers

CREATE VIEW list_of_customers AS
SELECT customer_id, CONCAT_WS(' ', first_name, last_name) AS name, address, postal_code, phone, city, country, CASE 
																										WHEN active = 1 THEN 'active'
																										ELSE 'inactive' END AS status, store_id
FROM customer
JOIN address USING (address_id)
JOIN store USING (store_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY customer_id

SELECT *
FROM list_of_customers



-- Ejercicio 2
DROP VIEW IF EXISTS film_details

CREATE VIEW film_details AS
SELECT film_id, title, description, name, amount, `length`, rating, GROUP_CONCAT( CONCAT(last_name, ' ', first_name) separator ', ') AS actor
FROM film
JOIN film_category USING (film_id)
JOIN category USING (category_id)
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY film_id

SELECT *
FROM film_details



-- Ejercicio 3
DROP VIEW IF EXISTS sales_by_film_category2

CREATE VIEW sales_by_film_category2 AS
SELECT name, SUM(amount) AS total_rental
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name

SELECT *
FROM sales_by_film_category2



-- Ejercicio 4 
DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id

SELECT *
FROM actor_information



