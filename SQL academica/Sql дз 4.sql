# Найти всех женщин, у которых emp_no заканчивается на 7

Select * from employees
Where gender = "f" and emp_no like "%7";

#Вывести все emp_no сотрудников, кто не работал в департаменте d005
Select emp_no from dept_emp
where dept_no != "d005";

#Вывести все названия департаментов, где есть буквы ‘u’ и ‘o’

Select dept_name from departments
where dept_name like "%u%" and
dept_name like "%o%";

#Вывести имена всех сотрудников, где есть либо ‘z’ либо ‘t’

Select first_name from employees
where first_name like "%z%" or
first_name like "%t%";

# Вывести все фамилии сотрудников, которые были наняты на работу между ‘1993-01-15’ и ‘1993-12-31’

Select last_name from employees
Where hire_date between '1993-01-15' and '1993-12-31';

#Получить список со всеми сотрудницами, чье имя Kellie

Select * from employees
where gender = "f" and
First_name = "Kellie";

#Получить список со всеми сотрудницами, чье имя Kellie или Aruna

Select * from employees
where gender = "f" and
(First_name = "Kellie" or first_name = "Aruna");

#Выбрать всю информацию из таблицы salaries где зарплаты между 66 000 и 70 000 долларов

Select * from salaries
where salary between '66000' and '70000';