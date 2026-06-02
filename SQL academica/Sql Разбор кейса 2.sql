#1
Select Count(*) from users
Where Year(registration_date) = 2024;

#2

Select Country ,Count(*) from users
group by country;

#3

Select avg(v.watch_time_min) from views v
join users u
on v.user_id = u.user_id
Where u.country = "USA";

#4

Select movie_id, count(distinct user_id) as user_count from views
group by movie_id
order by user_count
Limit 5;

#5

Select date_format(start_date, '%Y-%m') as period, Sum(price) from subscriptions
Where year(start_date) = 2024
group by period;

#6

Select u.user_id, Max(view_date) as Last_date from users u
Left join views v on u.user_id = v.user_id
group by u.user_id;