-- Ex1
select name from students
where marks > 75
order by right(name, 3),  id

-- Ex2
select user_id, upper(left(name, 1)) || lower(substring(name, 2)) name
from users
order by user_id

-- Ex3
SELECT manufacturer, '$' || ROUND(SUM(total_sales) / 1000000, 0) || ' million' sale_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer

-- Ex4
SELECT EXTRACT(MONTH FROM submit_date) mth, product_id product, ROUND(AVG(stars), 2) avg_stars
FROM reviews
GROUP BY mth, product
ORDER BY mth, product

-- Ex5
SELECT sender_id, COUNT(message_id) message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8 and EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2

-- Ex6
select tweet_id from tweets
where length(content) > 15

-- Ex7
select activity_date as day, count(distinct user_id) active_users
from activity
where '2019-07-27' - activity_date between 0 and 29
group by activity_date

-- Ex8
select extract(month from joining_date), count(id)
from employees
where extract(year from joining_date) = 2022 and (extract(month from joining_date) between 1 and 7)
group by extract(month from joining_date)

-- Ex9
select position('a' in first_name)
from worker
where first_name = 'Amitah'

-- Ex10
select id, substring(title, length(winery) + 2, 4)
from winemag_p2
where country = 'Macedonia'
