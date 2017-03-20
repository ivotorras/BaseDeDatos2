 
CREATE TABLE Ejemplo2.film
	(film_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(32) NOT NULL,
  	description VARCHAR(256),
  	release_year INT(4)
  	);
 
CREATE TABLE Ejemplo2.actor
 	(actor_id INT PRIMARY KEY AUTO_INCREMENT,
  	first_name VARCHAR(16) NOT NULL,
  	last_name VARCHAR(16) NOT NULL
  	);
  
  
CREATE TABLE Ejemplo2.film_actor
 	(actor_id INT NOT NULL,
  	film_id INT NOT NULL
  	);
  

  
ALTER TABLE film_actor ADD
   	CONSTRAINT fk_actor_id
   	FOREIGN KEY (actor_id)
   	REFERENCES actor (actor_id);
   
ALTER TABLE film_actor ADD
   	CONSTRAINT fk_film_id
   	FOREIGN KEY (film_id)
   	REFERENCES film (film_id);
   
   	
ALTER TABLE film ADD
	 last_update TIMESTAMP;
	
ALTER TABLE actor ADD
	 last_update TIMESTAMP;
	 

	
  
	
	
	


