#Создание простого View: Напишите SQL-запрос для создания представления (View), которое отображает имена и фамилии всех сотрудников.

Create view v_emp as
Select first_name, last_name from employees;

#View с JOIN: Создайте представление, которое объединяет таблицы employees и salaries, показывая идентификатор сотрудника, его имя, фамилию и текущую зарплату.
drop view v_emp;
Create view v_emp as
Select e.emp_no, e.first_name, e.last_name, s.salary from employees e
join salaries s
on s.emp_no = e.emp_no
Where s.to_date = '9999-01-01';

#View для агрегированных данных: Создайте представление, которое показывает среднюю зарплату по каждому отделу.

drop view v_emp;
Create view v_emp as 
Select Avg(s.salary) as Avg_dept_salary from salaries s
join dept_emp d
on s.emp_no = d.emp_no
join departments d1
on d1.dept_no = d.dept_no
Where s.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
group by d1.dept_name;

#Комбинированный View с JOIN и WHERE: Создайте представление, которое отображает информацию о сотрудниках, работающих в отделе 'Sales'

#Комбинированный View с JOIN и WHERE: Создайте представление, которое отображает информацию о сотрудниках, работающих в отделе 'Sales'

drop view v_emp;
Create view v_emp as 
Select e.* from employees e
join dept_emp d
on e.emp_no = d.emp_no
join departments d1
on d1.dept_no = d.dept_no
Where d1.dept_name = 'Sales'
and d.to_date = '9999-01-01';