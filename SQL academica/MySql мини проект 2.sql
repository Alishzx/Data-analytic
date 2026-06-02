#Задание №1
#1 Напишите запрос SQL, выводящий одним числом количество уникальных пользователей в этой таблице в период с 2023-11-07 по 2023-11-15.

select * from users;
Select count(distinct user_id) from users
Where date between '2023-11-07' and '2023-11-15';

#2 Определите пользователя, который за весь период посмотрел наибольшее количество объявлений. 

select user_id, Sum(view_adverts) as total from users
group by user_id
order by total desc
limit 1;

#3 Определите день с наибольшим средним количеством просмотренных рекламных объявлений на пользователя, но учитывайте только дни с более чем 500 уникальными пользователями.

Select date, Sum(view_adverts)/ count(distinct user_id) as Avg_views from users
group by date
having count(distinct user_id) > 500
order by avg_views desc
limit 1;

#4 Напишите запрос возвращающий LT (продолжительность присутствия пользователя на сайте) по каждому пользователю. Отсортировать LT по убыванию.

select 	user_id, Max(date)-min(date) as LT from users
group by user_id
order by Lt desc;

#5 Для каждого пользователя подсчитайте среднее количество просмотренной рекламы за день, а затем выясните, у кого самый высокий средний показатель среди тех, кто был активен как минимум в 5 разных дней.

Select user_id, Avg(view_adverts) from users
group by user_id
having count(distinct date) >= 5
order by Avg(view_adverts) desc;

#Задание №2
#1 Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE). Какое количество уникальных категорий товаров вернёт запрос?

select Distinct goods_type from t_tab1;
# Ответ 4

#2 Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов. Какое суммарное количество и суммарную стоимость вернул запрос?

select Sum(quantity), Sum(amount) from t_tab1
where goods_type = 'mobile phone';

# Ответ 5шт сумма = 640000

#3 Напишите запрос, который вернёт список сотрудников с заработной платой > 100000. Какое кол-во сотрудников вернул запрос?

Select * from t_tab2
where salary > 100000;  # ответ 3

#4 Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, а также минимальную и максимальную заработную плату

Select Max(salary), min(salary), max(age), min(age) from t_tab2;

#5 Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.

Select goods_type, avg(quantity) from t_tab1
where goods_type in ('Mobile Phone', 'Monitor')
group by goods_type;

#6 Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им товаров.

Select Seller_name, sum(amount) from t_tab1
group by seller_name;

#7 Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, заработную плату и возраст сотрудника MIKE.

Select t2.Name, t1.goods_type, t1.quantity, t1.amount, t2.salary, t2.age from t_tab1 t1
join t_tab2 t2
on t1.seller_name = t2.name
where t2.name = 'Mike';

#8 Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал. Сколько таких сотрудников?

Select t2.name, t2.age from t_tab2 t2
Left join t_tab1 t1
on t1.seller_name = t2.name
Where t1.seller_name Is Null;  #ответ 1

#9 Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет? Какое количество строк вернул запрос?

Select name, salary from t_tab2
Where age < 26;   #Ответ 3

#10 Сколько строк вернёт следующий запрос:
SELECT * FROM T_TAB1 t
JOIN T_TAB2 t2 ON t2.name = t.seller_name
WHERE t2.name = 'RITA';  #Ответ 0 потому что запрос возвращает все продажи, которые сделала сотрудница RITA, вместе с её данными и данными из таблицы продаж.
