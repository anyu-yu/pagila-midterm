/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */
 WITH film_customer AS (
   SELECT *
   FROM film
   JOIN inventory USING (film_id)
   JOIN rental USING (inventory_id)
   JOIN customer USING (customer_id)
 )

SELECT fc0.title, COUNT(*) AS count
FROM film_customer fc0
JOIN film_customer fc1 ON (fc0.customer_id = fc1.customer_id)
WHERE NOT(fc0.title = 'AMERICAN CIRCUS')
  AND fc1.title = 'AMERICAN CIRCUS'
GROUP BY fc0.title
ORDER BY count DESC;