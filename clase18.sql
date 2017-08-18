CALL GetAllProducts();

CALL GetOfficeByCountry('USA');

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;


CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;


SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
       
       
       
SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;


CALL test_mysql_loop();


       


-- SAKILA**************************************

-- Ejercicio 1



SELECT COUNT(*) FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN store USING(store_id)
WHERE store_id = 2
AND (title LIKE "AMERICAN CIRCUS" OR film_id = 23);



SELECT *
FROM film;


SELECT filmsAmount(2,23,"AMERICAN CIRCUS");


-- Function1

CREATE FUNCTION filmsAmount(p_storeId INTEGER, p_filmId INTEGER, p_title VARCHAR(20)) RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE total INTEGER;
    SET total = (SELECT COUNT(film_id) FROM film
		INNER JOIN inventory USING(film_id)
		INNER JOIN store USING(store_id)
		WHERE store_id = p_storeId
			AND film_id = p_filmId 
			AND title LIKE p_title);
    RETURN (total);
END



-- Ejercicio 2



SELECT GROUP_CONCAT(first_name, " " ,last_name SEPARATOR "; ") FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id);
	
	
	
CALL customerList("Argentina", @p_customerList);

SELECT @p_customerList;



set @List = "";

CALL customerList("Argentina", @List);

SELECT @List;


-- Function2


CREATE DEFINER=`root`@`%` PROCEDURE `sakila`.`customerList`(
    IN  p_countryName VARCHAR(24),
    OUT p_customerList  TEXT
)
BEGIN
   SELECT GROUP_CONCAT(first_name, " " ,last_name SEPARATOR "; ") INTO p_customerList FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
	WHERE country = p_countryName;
END




