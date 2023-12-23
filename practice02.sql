-- Ex1
select distinct city from station
where id % 2 = 0

-- Ex2
select count(city) - count(distinct city) from station

-- Ex3
select ceil(avg(salary) - avg(replace(salary, '0', '')))
from employees

-- Ex4
SELECT ROUND(CAST(SUM(item_count * order_occurrences)/SUM(order_occurrences) AS DECIMAL), 1) mean
FROM items_per_order;

-- Ex5
SELECT candidate_id FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3

-- Ex6
SELECT user_id, DATE(max(post_date)) - DATE(min(post_date)) days_between
FROM posts
WHERE post_date between '2021-01-01' AND '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) >= 2

-- Ex7
SELECT card_name, max(issued_amount) - min(issued_amount) difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC

-- Ex8
SELECT manufacturer, COUNT(drug) drug_count, ABS(SUM(cogs - total_sales)) total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC

-- Ex9
select * from Cinema
where id % 2 = 1
and description != 'boring'
order by rating desc

-- Ex10
select teacher_id, count(distinct subject_id) cnt
from Teacher
group by teacher_id

-- Ex11
select user_id, count(follower_id) followers_count
from Followers
group by user_id
order by user_id
  
-- Ex12
select class from Courses
group by class
having count(student) >= 5
