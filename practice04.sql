-- Ex1
SELECT
SUM(CASE
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) laptop_views,
SUM(CASE
  WHEN device_type IN ('tablet', 'phone') THEN 1
  ELSE 0
END) mobile_views
FROM viewership;

-- Ex2
select *,
case
    when x + y > z and y + z > x and z + x > y then 'Yes'
    else 'No'
end triangle
from triangle

-- Ex3
SELECT
ROUND(SUM(CASE
  WHEN call_category IS NULL or call_category = 'n/a' THEN 1
  ELSE 0
END) * 100.0 / COUNT(case_id), 1) call_percentage 
FROM callers;

-- Ex4
select name from Customer
where referee_id != 2 or referee_id is null

-- Ex5
select
case
    when survived = 0 then 0
    when survived = 1 then 1
end survived,
sum(case
        when pclass = 1 then 1
        else 0
    end) first_class,
sum(case
        when pclass = 2 then 1
        else 0
    end) second_class,
sum(case
        when pclass = 3 then 1
        else 0
    end) third_class
from titanic
group by survived
