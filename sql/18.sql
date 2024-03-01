/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */



select rank, title, revenue, "total revenue", to_char(100*"total revenue"/(
select sum(amount)
from film
left join inventory using (film_id)
    left join rental using (inventory_id)
    left join payment using (rental_id)
), 'FM900.00') AS "percent revenue"
from (
select rank, title, revenue, sum(revenue) OVER (order BY rank) AS "total revenue"
from (
select rank () OVER (
    ORDER BY coalesce(sum(amount), 0.00) DESC
    ) rank, title, coalesce(sum(amount), 0.00) as revenue
from film
left join inventory using (film_id)
left join rental using (inventory_id)
left join payment using (rental_id)
group by title
) as t
) as u
order by 1,2;
