/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

SELECT DISTINCT film.title
FROM film
JOIN inventory ON (film.film_id = inventory.film_id)
WHERE film.film_id NOT IN (
    SELECT film.film_id
    FROM film
    JOIN inventory ON (film.film_id = inventory.film_id)
    JOIN rental ON (inventory.inventory_id = rental.inventory_id)
    JOIN customer ON (rental.customer_id = customer.customer_id)
    JOIN address ON (customer.address_id = address.address_id)
    JOIN city ON (address.city_id = city.city_id)
    JOIN country ON (city.country_id = country.country_id)
    WHERE country.country = 'United States'
)
ORDER BY film.title;
