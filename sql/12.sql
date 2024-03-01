/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select title 
from (
select title
from (
select film_id, title, unnest(special_features) as feature 
from film) t
where feature = 'Behind the Scenes') t2 
join (
select title
from (
select film_id, title, unnest(special_features) as feature from film) t3
where feature = 'Trailers') t4 using (title) 
order by 1;
