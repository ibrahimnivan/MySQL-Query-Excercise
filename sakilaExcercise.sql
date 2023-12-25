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

-- 14. Show all data using IN, and display the country_id and country columns of the following countries: China,Bangladesh, and India
SELECT country_id, country FROM country WHERE country IN('China', 'Bangladesh', 'India');

-- 15 . Find every actors whose last names contain the letters OD. Order the rows by last name and first name, in that order
SELECT * FROM actor WHERE last_name LIKE '%OD%' ORDER BY last_name, first_name;

-- 16. Modify table actors. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
ALTER TABLE actor ADD COLUMN middle_name varchar(45) AFTER first_name;

-- 16. List every last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(last_name) AS total_count FROM actor GROUP BY last_name HAVING total_count >= 2;

-- 17. Join the table and display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address FROM staff s JOIN address a ON s.address_id = a.address_id;

-- 18. Find out how many copies of the film “Hunchback Impossible” exist in the inventory system
SELECT COUNT(*) FROM inventory i JOIN film f ON f.film_id = i.film_id WHERE f.title = 'HUNCHBACK IMPOSSIBLE'

-- 19. Find and display the most frequently rented movies in descending order.
SELECT f.title, COUNT(f.title) AS total_rented FROM rental r JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f on i.film_id = f.film_id GROUP BY f.title ORDER BY total_rented DESC;

-- 20. Write down a query in order to display each store its store ID, city, and country
SELECT s.store_id, c.city, cc.country FROM store s JOIN address a ON a.address_id = s.address_id JOIN city c ON c.city_id = a.city_id JOIN country cc ON cc.country_id = c.country_id

-- 21. Use subqueries to display every actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM actor WHERE actor_id IN (
 SELECT a.actor_id FROM actor a JOIN film_actor fa ON fa.actor_id = a.actor_id JOIN film f ON f.film_id = fa.film_id WHERE title = 'ALONE TRIP'
) 

-- 22. Delete the middle_name column from table actors
ALTER TABLE actor DROP COLUMN middle_name;


