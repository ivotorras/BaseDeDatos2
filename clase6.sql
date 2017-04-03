-- EJERCICIO 1
SELECT last_name, first_name
FROM actor f1
WHERE last_name IN (SELECT last_name
			  FROM actor f2
			  WHERE f1.last_name = f2.last_name AND f1.actor_id <> f2.actor_id)			  
ORDER BY last_name

-- EJERCICIO 2
SELECT actor_id
FROM actor a1
WHERE actor_id IN (SELECT actor_id
					FROM film_actor a2 
					WHERE a1.actor_id <> a2.actor_id)
					
-- EJERCICIO 3
SELECT first_name, last_name
FROM customer c1
WHERE NOT EXISTS (SELECT *
				FROM rental r1, customer c2
				WHERE c2.customer_id = r1.customer_id
				AND c1.customer_id <> c2.customer_id)
				
-- EJERCICIO 4
-- EJERCICIO 5
SELECT DISTINCT first_name, last_name, title
FROM actor, film_actor, film
WHERE actor.actor_id = film_actor.actor_id 
AND film_actor.film_id = film.film_id 
AND title IN ('BETRAYED REAR', 'CATCH AMISTAD')
					

-- EJERCICIO 6 

SELECT  first_name, last_name, title
FROM actor
JOIN film
ON title LIKE '%BETRAYED REAR%' AND NOT title LIKE '%CATCH AMISTAD%'
