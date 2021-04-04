-- Write a query to display for each store its store ID, city, and country.
USE sakila;
SELECT c.city,co.country,s.store_id
FROM sakila.city c
JOIN sakila.address a
ON c. city_id = a.city_id
JOIN sakila.country co
ON c.country_id = co.country_id
JOIN sakila.store s
ON s.address_id = a.address_id
GROUP BY store_id;



-- Which film categories are longest?
SELECT c.name AS Movie_category, AVG(length)
FROM sakila.category c
JOIN sakila.film_category fc
ON fc.category_id = c.category_id
JOIN sakila.film f
ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY AVG(length) DESC;

-- Display the most frequently rented movies in descending order.
SELECT COUNT(rental_id) AS Nb_of_Rentals, film.title AS Name_of_movie
FROM sakila.rental
JOIN sakila.inventory
USING (inventory_id)
JOIN sakila.film
USING (film_id)
GROUP BY film.title
ORDER BY COUNT(rental_id) DESC
LIMIT 10;

-- List the top five genres in gross revenue in descending order.
SELECT c.name AS genre ,AVG(f.rental_rate *rental_duration) AS revenue
FROM sakila.category c
JOIN sakila.film_category fc
ON fc.category_id = c.category_id
JOIN sakila.film f
ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5;


-- Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title,s.store_id
FROM sakila.store s
JOIN sakila.address a
ON a.address_id = s.address_id
JOIN sakila.film f
WHERE f.title = "Academy Dinosaur" AND store_id = 1
GROUP BY s.store_id;

-- Get all pairs of actors that worked together.

SELECT DISTINCT(f3.title) AS Title_of_the_Film,CONCAT(a.first_name,' ', a.last_name, ' / ', a2.first_name,' ', a2.last_name) AS Actors from sakila.film_actor AS f1
JOIN sakila.film_actor AS f2
ON (f1.film_id = f2.film_id) AND (f1.actor_id <> f2.actor_id)
JOIN sakila.film as f3
ON (f1.film_id = f3.film_id)
JOIN sakila.actor AS a
ON a.actor_id =f1.actor_id
JOIN sakila.actor AS a2
ON a2.actor_id =f2.actor_id
GROUP BY f1.film_id
ORDER BY f1.film_id ASC;
ON (f1.film_id = f3.film_id)
JOIN sakila.actor AS a
ON a.actor_id =f1.actor_id
JOIN sakila.actor AS a2
ON a2.actor_id =f2.actor_id
GROUP BY f1.film_id
ORDER BY f1.film_id ASC;



-- Get all pairs of customers that have rented the same film more than 3 times.




