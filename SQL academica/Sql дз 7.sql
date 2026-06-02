#Выведите список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента, который они курируют, и дату найма в компанию. (именно менеджером, то есть подсказка dept_manager)

Select e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
from employees e
join dept_manager d
on e.emp_no = d.emp_no;

#Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента. Может быть таких сотрудников несколько? (именно менеджером, то есть подсказка dept_manager)

Select count(*) as Count
from employees e
Join dept_manager d
on e.emp_no = d.emp_no
Where e.last_name = "Markovitch";

#Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, у которых имя начинается на М, а фамилия заканчивается на H.

Select e.first_name, e.last_name, e.hire_date, t.title 
from employees e
join titles t
on e.emp_no = t.emp_no
where e.first_name like 'M%'
and e.last_name like '%H';

#Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная и минимальная зарплата за весь период работы в компании. Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.
Create temporary table salaries_temp
Select emp_no, Max(salary) as Max, Min(salary) as min from salaries
group by emp_no;

Select e.first_name, e.last_name, s.Max, s.min 
from employees e
join salaries_temp s
on e.emp_no = s.emp_no;

