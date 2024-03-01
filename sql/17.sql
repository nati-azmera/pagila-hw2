/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */


select rank, title, revenue, sum(revenue) over(order BY rank) AS "total revenue" 
from (
select rank () OVER (
    ORDER BY coalesce(sum(amount), 0.00) desc
    ) rank, title, coalesce(sum(amount), 0.00) as revenue 
from film
left join inventory using (film_id)
left join rental using (inventory_id)
left join payment using (rental_id)
group by 2
) as t
order by 1,2;
