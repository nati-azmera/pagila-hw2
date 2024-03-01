/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */

SELECT extract(year FROM rental.rental_date) AS "Year", extract(month FROM rental.rental_date) AS "Month", sum(payment.amount) AS "Total Revenue"
from payment
join rental using (rental_id)
group by ROLLUP (1,2)
order by 1,2;
