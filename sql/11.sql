/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT film_id, UNNEST(special_features) AS special_feature
    FROM film
) AS foo
JOIN film_actor ON (foo.film_id = film_actor.film_id)
JOIN actor ON (film_actor.actor_id = actor.actor_id)
WHERE special_feature = 'Behind the Scenes'
GROUP BY "Actor Name"
ORDER BY "Actor Name";
