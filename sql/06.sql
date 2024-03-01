/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 06b you will use the LEFT JOIN clause.
 */


select distinct(title) 
from film 
where film_id not in (
select distinct(film_id) 
from inventory 
order by film_id) 
order by 1;
