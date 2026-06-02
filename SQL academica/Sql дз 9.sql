#Найдите всех сотрудников, которые работали как минимум в 2 департаментах. Вывести их имя и фамилию. Показать записи в порядке возрастания.

Select first_name, last_name from employees
Where emp_no in (SELECT emp_no
FROM dept_emp
GROUP BY emp_no
HAVING COUNT(DISTINCT dept_no) >= 2)
ORDER BY first_name, last_name;

# Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.
Select e.first_name, e.Last_name, s.salary from employees e
join salaries s
on s.emp_no = e.emp_no
Where s.salary = (
select max(salary) from salaries)
;

#Создайте запрос, который выбирает названия всех отделов, в которых работает более 100 сотрудников.


Select dept_name from departments
where dept_no in 
(
Select dept_no
from dept_emp
group by dept_no
having count(distinct(emp_no)) > 100
);

#. Напишите запрос, который находит имена и фамилии всех сотрудников, которые никогда не были менеджерами.

Select first_name, last_name from employees
where emp_no not in (
select emp_no from dept_manager);

# Создайте запрос, который для каждого отдела выводит сотрудников, получающих наибольшую зарплату в этом отделе

SELECT e.first_name, e.last_name, d.dept_no, s.salary
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = e.emp_no
JOIN (
    SELECT d.dept_no, MAX(s.salary) AS max_salary
    FROM dept_emp d
    JOIN salaries s ON s.emp_no = d.emp_no
    WHERE s.to_date = '9999-01-01'
    GROUP BY d.dept_no
) t 
ON d.dept_no = t.dept_no 
AND s.salary = t.max_salary
WHERE s.to_date = '9999-01-01';

#Напишите запрос, который выбирает названия отделов, где средняя зарплата выше общей средней зарплаты по компании.

SELECT d.dept_name
FROM dept_emp d1
JOIN departments d ON d.dept_no = d1.dept_no
JOIN salaries s ON s.emp_no = d1.emp_no
WHERE s.to_date = '9999-01-01'
  AND d1.to_date = '9999-01-01'
GROUP BY d.dept_name
HAVING AVG(s.salary) > (
    SELECT AVG(salary)
    FROM salaries
    WHERE to_date = '9999-01-01'
);