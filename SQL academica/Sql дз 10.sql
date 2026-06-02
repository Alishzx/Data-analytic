#Объединение сотрудников и менеджеров: Напишите запрос, который использует UNION для объединения списка всех сотрудников (мужчин) и всех менеджеров (только идентификаторы сотрудников emp_no).

Select emp_no from employees
where gender = 'M'
Union
Select emp_no from dept_manager;

#Список уникальных должностей и отделов: Создайте запрос, который объединяет уникальные названия должностей из таблицы titles и названия отделов из departments.

Select title from titles
union
select dept_name from departments;

#Сотрудники с зарплатами выше и ниже среднего: Напишите запрос, который использует UNION для объединения двух списков: сотрудников с зарплатой выше 60.000 долларов и сотрудников с зарплатой ниже 40.000 долларов (используйте имя и зарплату).

Select e.first_name, s.salary from salaries s
join employees e
on s.emp_no = e.emp_no
where salary > 60000
Union
Select  e.first_name, s.salary from salaries s
join employees e
on s.emp_no = e.emp_no
where salary < 40000;

# Объединение текущих и бывших сотрудников: Используйте UNION для создания списка сотрудников, которые в настоящее время работают в компании, и тех, кто уже ушел (используйте имя, фамилию и статус 'Текущий' или 'Бывший' , то есть first_name, last_name, 'Текущий' AS status, 'Бывший' AS status

Select first_name, last_name, 'Текущий' as status from employees e
join dept_emp d
on d.emp_no = e.emp_no
Where d.to_date = '9999-01-01'
Union
Select first_name, last_name, 'Бывший' as status from employees e
join dept_emp d
on d.emp_no = e.emp_no
Where d.to_date <> '9999-01-01';

#Сравнение зарплат менеджеров и обычных сотрудников: Создайте запрос с использованием UNION, чтобы сравнить средние зарплаты менеджеров и обычных сотрудников (выведите тип сотрудника, либо Менеджер, либо Обычный сотрудник их среднюю зарплату, то есть 'Менеджер' AS type, 'Обычный сотрудник' AS type, AVG(salary) AS avg_salary ).

Select 'Менеджер' as Type, AVG(s.salary) as avg_salary
from employees e
join salaries s
on e.emp_no = s.emp_no
join dept_manager d
on d.emp_no = s.emp_no
Union
Select 'Обычный Сотрудник' as Type, AVG(s.salary) as avg_salary
from employees e
join salaries s
on e.emp_no = s.Emp_no
Where e.emp_no not in (select emp_no from dept_manager);