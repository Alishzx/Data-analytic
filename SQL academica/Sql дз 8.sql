# Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания по количеству сотрудников.

SELECT gender, COUNT(*) FROM employees
GROUP BY gender
ORDER BY COUNT(*) DESC;

#Найдите среднюю зарплату в разрезе должностей сотрудников (title), округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.

Select title, Round(Avg(salary), 2) as Avarage_salary from Salaries s
join titles t
on t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND t.to_date = '9999-01-01'
group by title
Order by Avarage_salary desc;

# Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.
Select Month(hire_date) as Month, Count(*)  from employees
Group by Month
Order by Month;

#Сформируйте запрос, который соединяет employees, dept_emp, departments и titles, чтобы показать имена и фамилии сотрудников, названия их отделов и их текущие должности (именно текущие должности, то есть фильтр по таблице titles, столбец to_date).
Select e.first_name, e.last_name, d1.dept_name, t.title as current_title
from employees e
join dept_emp d
on d.emp_no = e.emp_no
join departments d1
on d1.dept_no = d.dept_no
join titles t
on t.emp_no = e.emp_no
Where t.to_date = "9999-01-01"
 and d.to_date = "9999-01-01";
 
# Используйте Self JOIN в таблице employees, чтобы найти пары сотрудников с одинаковыми фамилиями. Отобразите их имена и фамилии

Select e1.first_name, e1.last_name, e2.first_name, e2.last_name from employees e1
join employees e2
on e1.last_name = e2.last_name
AND e1.emp_no <> e2.emp_no;