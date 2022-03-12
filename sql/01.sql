/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

 WITH nof AS(
   SELECT DISTINCT film.film_id
    FROM film
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    WHERE POSITION('f' in LOWER(film.title)) > 0
    OR POSITION('f' in LOWER(actor.first_name)) > 0
    OR POSITION('f' in LOWER(actor.last_name)) > 0
    OR POSITION('f' in LOWER(customer.first_name)) > 0
    OR POSITION('f' in LOWER(customer.last_name)) > 0
 )

 
 SELECT title
 FROM film
 WHERE film_id NOT IN (
   SELECT film_id
   FROM nof
 );
