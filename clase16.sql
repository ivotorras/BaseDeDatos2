CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);


insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),

(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;


UPDATE employees 
SET lastName = 'Phan'
WHERE employeeNumber = 1056;
       
SELECT *
FROM employees_audit;
    
SELECT *
FROM employees;



-- Ejercicio 1

INSERT INTO `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) VALUES 
(1020,'randomLastName','randomFirstName','x1850',NULL,'9',1002,'President');


-- It says that email cannot be NULL, thats because when the table was created we put  "`email` varchar(100) NOT NULL" so, as it says there, NOT NULL. You have to fill that field


-- Ejercicio 2

UPDATE employees SET employeeNumber = employeeNumber - 20
 
UPDATE employees SET employeeNumber = employeeNumber + 20

-- What i think it's happening (not sure) is that in the first query you are restando the employeeNumber but the third employee gets the same number that used to have the second, do it's the same primary key, and the it hapends the other way arround. But, I'm not sure


-- Ejercicio 3

 ALTER TABLE employees ADD age INT;
 ALTER TABLE employees ADD CONSTRAINT ageLimit CHECK(age > 16);
 ALTER TABLE employees ADD CONSTRAINT otherAgeLimit CHECK(age <70 );

SELECT *
FROM employees;

-- Ejercicio 4

-- the tables actor and film have their own primary keys, actor_id and film_id
-- in the table film_actor, it references the primary key to the table so it can relate the actor table with the film table










