#Вывести hire_date в годах, и количество сотрудников, которых наняли в эти года.

Select Year(hire_date) as year, Count(*) as 'Emp Count'
from employees
group by Year(hire_date);

# Вывести dept_no и рядом количество сотрудников, которые когда-либо работали в этих департаментах.

SELECT dept_no, COUNT(DISTINCT emp_no) AS emp_count
FROM dept_emp
GROUP BY dept_no;

#Вывести birth_date и количество сотрудников, которые родились в эти дни. Отфильтровать birth_date не равен 1952-02-13 и вывести только те дни, где количество сотрудников > 60. Отсортировать по убыванию (по количеству сотрудников), и далее показать только топ 20 birth_date (по количеству сотрудников). 

Select birth_date, Count(distinct emp_no) as emp_count from employees
Where birth_date != '1953-02-13'
Group by birth_date
Having emp_count > 60
Order by emp_count desc
limit 20;

#Вывести имена (которые начинается на А) и количество сотрудников с этим именем в компании. Отфильтровать имена, у которых количество сотрудников с этим именем больше 250, отсортировать по количеству сотрудников и показать только топ 10 first_name (по количеству сотрудников).

Select first_name, Count(emp_no) as Emp_count from employees
Where first_name like 'A%'
Group by first_name
Having Emp_count > 250
Order by Emp_count desc
Limit 10;

#Создать копию таблицы employees, где имена начинается на B. Удалить строки в employees, где имена начинаются на B, далее из копии нашей таблицы вставить обратно эти строки. Удалить все строки из копии нашей таблицы, далее дропнуть эту таблицу.

Create table employees_2 like employees;

Insert into employees_2
Select * from employees
Where first_name like 'B%';

Delete from employees
Where first_name like 'B%';

Insert into employees
Select * from employees_2
Where first_name like 'B%';

Drop table employees_2;