/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */


select features as special_features, count(*) 
from (
select features
from (
select title, unnest(special_features) as features 
from film) t) t2 
group by 1 
order by 1;
