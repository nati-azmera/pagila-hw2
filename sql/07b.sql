/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct(film.title)
from film
join inventory USING (film_id) 
left join (
    SELECT DISTINCT country, film_id
    from film 
    join inventory USING (film_id)  
    join rental using (inventory_id) 
    join customer using (customer_id) 
    join address using (address_id) 
    join city USING (city_id)
    join country using (country_id) 
    where country = 'United States'
) t using (film_id) 
where country is null; 
