/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */


select t2.special_features as special_feature, sum(t.profit) as profit 
from (
SELECT film_id, sum(amount) AS profit 
FROM film 
join inventory USING (film_id) 
join rental using (inventory_id) 
join payment using (rental_id) 
group by 1 
order by 2 DESC) t 
join (
select film_id, unnest(special_features) as special_features 
from film) t2 using (film_id) 
group by 1
order by 1;
