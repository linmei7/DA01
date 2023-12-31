* Practice
-- Ex1
select a.continent, floor(avg(b.population))
from country a
join city b
on a.code = b.countrycode
group by a.continent

-- Ex2
SELECT ROUND(CAST(COUNT(signup_action) as decimal) / CAST(COUNT(DISTINCT a.email_id) AS decimal), 2)
FROM emails a
LEFT JOIN texts b 
ON a.email_id = b.email_id
AND signup_action = 'Confirmed'

-- Ex3
SELECT age_bucket,
ROUND(SUM(CASE
  WHEN activity_type = 'send' THEN time_spent
  ELSE 0
END) * 100.0 / SUM(time_spent), 2) send_perc,
ROUND(SUM(CASE
  WHEN activity_type = 'open' THEN time_spent
  ELSE 0
END) * 100.0 / SUM(time_spent), 2) open_perc
FROM activities a  
JOIN age_breakdown b 
ON a.user_id = b.user_id AND activity_type IN ('send', 'open')
GROUP BY age_bucket

-- Ex4
SELECT customer_id
FROM customer_contracts a
JOIN products b 
ON a.product_id = b.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT product_category) = (SELECT COUNT(DISTINCT product_category) FROM products)

-- Ex5
select mng.employee_id, mng.name, count(emp.employee_id) reports_count, round(avg(emp.age))average_age
from employees emp
join employees mng
on emp.reports_to = mng.employee_id
group by mng.employee_id, mng.name
order by mng.employee_id

-- Ex6
select product_name, sum(unit) unit
from products a 
join orders b
on a.product_id = b.product_id
where extract(month from order_date) = 2
and extract(year from order_date) = 2020
group by product_name
having sum(unit) >= 100

-- Ex7
SELECT a.page_id
FROM pages a
LEFT JOIN page_likes b
ON a.page_id = b.page_id
WHERE b.page_id IS NULL
ORDER BY a.page_id
  
* Mid-course test
-- Q1
select distinct replacement_cost
from film
order by replacement_cost
limit 1

-- Q2
select low
from (select
sum(case
   when replacement_cost between 9.99 and 19.99 then 1
   else 0
end) low,
sum(case
   when replacement_cost between 20.00 and 24.99 then 1
   else 0
end) medium,
sum(case
   when replacement_cost between 25.00 and 29.99 then 1
   else 0
end) high
from film) cat

-- Q3
select name, length
from (select title, length, name
from film a
join film_category b on a.film_id = b.film_id
join category c on b.category_id = c.category_id
where name in ('Drama', 'Sports')
order by length desc) list
limit 1

-- Q4
select name, count(film_id) count
from film_category a
join category b
on a.category_id = b.category_id
group by name
order by count desc
limit 1

-- Q5
select first_name, last_name, count(film_id) count
from actor a
join film_actor b
on a.actor_id = b.actor_id
group by first_name, last_name
order by count desc
limit 1

-- Q6
select count(a.address_id)
from address a
left join customer b
on a.address_id = b.address_id
where customer_id is null

-- Q7
select city,
case
	when sum(amount) is not null then sum(amount)
	else 0
end revenue
from city a
left join address b on a.city_id = b.city_id
left join customer c on b.address_id = c.address_id
left join payment d on c.customer_id = d.customer_id
group by city
order by revenue desc
limit 1

-- Q8
select city || ', ' || country place,
case
	when sum(amount) is not null then sum(amount)
	else 0
end revenue
from country e
join city a on e.country_id = a.country_id
left join address b on a.city_id = b.city_id
left join customer c on b.address_id = c.address_id
left join payment d on c.customer_id = d.customer_id
group by city || ', ' || country
order by revenue desc
limit 1
