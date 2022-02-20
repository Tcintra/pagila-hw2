/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT t1.title
FROM (
    SELECT title, film_id, UNNEST(special_features) as special_feature
    FROM film
) AS t1
JOIN (
    SELECT title, film_id, UNNEST(special_features) as special_feature
    FROM film
) AS t2
ON (t1.film_id = t2.film_id)
WHERE t1.special_feature = 'Behind the Scenes' AND t2.special_feature = 'Trailers'
GROUP BY t1.title;
