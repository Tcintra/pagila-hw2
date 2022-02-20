/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT title 
FROM film
WHERE film.film_id in (
    SELECT film.film_id
    FROM film
    JOIN inventory ON (film.film_id = inventory.film_id)
    JOIN rental ON (inventory.inventory_id = rental.inventory_id)
    WHERE rental.customer_id = 1
    GROUP BY film.film_id
    HAVING COUNT(rental.customer_id) > 1
)
ORDER BY film.title;

