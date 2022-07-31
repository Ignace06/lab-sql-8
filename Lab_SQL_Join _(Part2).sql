
use sakila

--     Write a query to display for each store its store ID, city, and country.
select * from store;
select * from city;
select * from country;
select * from staff;
select * from address;

select s.store_id as Store, c.city as City, co.country as Country from store as s
join address as a
on a.address_id = s.address_id
join city as c 
on c.city_id = a.city_id
join country as co
on c.country_id = co.country_id;


--     Write a query to display how much business, in dollars, each store brought in.
select * from payment;

select sto.store_id as Store, count(p.amount) as $turnover from store as sto
left join staff as sta
on sta.address_id = sto.address_id
left join payment as p
on p.staff_id = sta.staff_id
group by Store;
+++

--     Which film categories are longest?
select * from category;
select * from film_category;

select c.name as category, round(avg(f.length),0) as longest_film_length_mn from film as f
left join film_category as fc
on fc.film_id = f.film_id
left join category as c
on fc.category_id = c.category_id
group by c.category_id
order by longest_film_length_mn desc
limit 1;


--     Display the most frequently rented movies in descending order.
select f.title as Movie_Title, count(r.inventory_id) as Top10_Most_rented from rental as r 
join inventory as i
on i.inventory_id = r.inventory_id
join film as f
on f.film_id = i.film_id
group by  f.title
order by Top10_Most_rented desc
limit 10;


--     List the top five genres in gross revenue in descending order.
select ca.name as Genre, count(p.amount) as Gross_Revenue  from payment as p 
inner join customer as c 
on p.customer_id = c.customer_id
inner join inventory as i
on i.store_id = c.store_id
inner join film_category as fc
on fc.film_id = i.film_id
inner join category as ca
on ca.category_id = fc.category_id
group by Genre
order by Gross_Revenue desc
limit 5;


--     Is "Academy Dinosaur" available for rent from Store 1?
select f.title as Title, i.store_id as Store from film as f
join inventory as i
on i.film_id = f.film_id
where f.title = "Academy Dinosaur" and i.store_id = "1";

--     Get all pairs of actors that worked together.
select a.last_name as actor_name, ft.title as film from actor as a
left join film_actor as f
on f.actor_id = a.actor_id
left join film_text as ft
on ft.film_id = f.film_id
group by actor_name, film
order by film ;


--     Get all pairs of customers that have rented the same film more than 3 times.



--     For each film, list actor that has acted in more films.
select a.last_name as actor_name, ft.title as film from actor as a
left join film_actor as f
on f.actor_id = a.actor_id
left join film_text as ft
on ft.film_id = f.film_id
group by film, actor_name
order by  actor_name ;

