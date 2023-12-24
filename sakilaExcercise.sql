-- sakila db
-- 1. Display the first and last names of all actors from the table actor.
 SELECT first_name, last_name FROM `actor`;

-- 2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
SELECT actor_id, first_name, last_name FROM `actor` WHERE first_name = 'joe';

-- 3. Display the address, district, and city_id from address only for district: California, Alberta and Mekka
SELECT address_id, address, district, city_id FROM `address` WHERE district IN ('California', 'Alberta', 'Mekka');

-- 4. Count actor with last name WOOD from table actors.
SELECT COUNT(last_name) FROM `actor` WHERE last_name = 'WOOD';

-- 5. Shows list of customer_id and sum of amount spent that made payment more than 20.
SELECT customer_id, SUM(amount) AS total FROM `payment` GROUP BY customer_id HAVING total > 20;

-- 6. Add new actor into table actors with name JHONNY DAVIS.
INSERT INTO actor (first_name, last_name) VALUES ('JHONNY', 'DAVIS');

-- 7. There are several new actor to add. Add new actor into table actors with name ADAM DAVIS, JEREMY DAVIS, CRAIG DAVIS, STEVE DAVIS in a single query.
 INSERT INTO actor (first_name, last_name) VALUES ('JEREMY', 'DAVIS'), ('CRAIG', 'DAVIS'), ('STEVE', 'DAVIS');

-- 8. Count how many actors with last name DAVIS.
SELECT COUNT(last_name) FROM `actor` WHERE last_name = 'DAVIS';

-- 9. Delete actor with last name DAVIS and first name JENNIFER.

-- 10. Update actor with last name DAVIS and change his/her first name into GEORGE
 UPDATE `actor` SET first_name = 'GEORGE' WHERE last_name = 'DAVIS';

-- 11. Find top 10 actor with the most perform on film.
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.actor_id) as film_count FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id GROUP BY actor.actor_id ORDER BY film_count DESC LIMIT 10;

-- 12. Display title, description, length, and rating from film, where special features include deleted scenes and behind the scenes order by most length
SELECT title, description, length, rating, special_features FROM `film` ORDER BY length DESC;

-- 13. Display country and total of inactive customer (active = 0) from country where customer active = 0 order by the highest inactive (active = 0) customer
SELECT country, COUNT(*) as total_inactive_customers FROM country JOIN city ON country.country_id = city.country_id JOIN address ON city.city_id = address.city_id JOIN customer ON address.address_id = customer.address_id WHERE customer.active = 0 GROUP BY country.country_id ORDER BY total_inactive_customers DESC;