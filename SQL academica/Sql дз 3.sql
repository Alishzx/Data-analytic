#Вывести всю информацию из таблицы employees

Select * from employees;

#Вывести всех мужчин из таблицы employees

Select * from employees
where gender = "M";

#Вывести всех сотрудников по имени Elvis

Select * from employees
Where First_name = "Elvis";

#Вывести уникальные/различные названия должностей

Select distinct title from titles;

#Вывести всех сотрудников, кто был трудоустроен в 2000 году

Select * from employees e
where Year(e.hire_date) = 2000;

#Вывести всех сотрудников, кому больше 60 лет на данный момент (т.е. используем Curdate)

Select *, timestampdiff(Year, birth_date, Curdate()) as age
from employees
Where timestampdiff(Year, birth_date, Curdate()) > 60;

# Вывести количество строк в таблице salaries

Select count(*) from employees;

#Вывести количество строк в таблице salaries, где зарплата > 100.000$

Select count(*) from salaries
where salary > 100000;
