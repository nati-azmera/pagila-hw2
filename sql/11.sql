/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct(first_name || ' ' || last_name) as "Actor Name" 
from (select actor_id, first_name, last_name, film_id 
from film_actor 
join actor using (actor_id)) t 
where film_id in (
select film_id
from (
select film_id, unnest(special_features) as feature 
from film) t2
where feature = 'Behind the Scenes') 
order by 1;
