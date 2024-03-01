/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */


SELECT actor.last_name,  actor.first_name 
FROM actor
left join customer on actor.first_name = customer.first_name AND actor.last_name = customer.last_name
where customer.customer_id IS NULL
order by 1,2;
