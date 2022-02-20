/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT special_features, COUNT(special_features)
FROM (
    SELECT UNNEST(special_features) AS special_features
    FROM film
) AS foo
GROUP BY special_features
ORDER BY special_features;
