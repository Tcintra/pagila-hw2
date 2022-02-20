/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT customer.customer_id
FROM film
JOIN inventory ON (inventory.film_id = film.film_id)
JOIN rental ON (rental.inventory_id = inventory.inventory_id)
JOIN customer on (customer.customer_id = rental.customer_id)
WHERE film.title IN (
    SELECT film.title
    FROM film
    JOIN inventory on (film.film_id = inventory.film_id)
    JOIN rental on (inventory.inventory_id = rental.inventory_id)
    JOIN payment on (rental.rental_id = payment.rental_id)
    GROUP BY film.title
    ORDER BY SUM(payment.amount) DESC LIMIT 5
) 
ORDER BY customer_id;
