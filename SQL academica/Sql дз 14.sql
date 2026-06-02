#1 Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:

-- Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше p_salary и которые когда-то работали в департаменте p_dept.
drop procedure GetEmpsalary;
delimiter $$

Create procedure GetEmpsalary(in p_salary int, in p_dept varchar(20))
Begin
Select e.emp_no, e.first_name, e.gender from employees e
join salaries s
on e.emp_no = s.emp_no
join dept_emp d
on s.emp_no = d.emp_no
join departments d1
on d1.dept_no = d.dept_no
Where d1.dept_name = p_dept
group by emp_no
having avg(s.salary) > p_salary;
end$$

delimiter ;
Call GetEmpsalary(120000 , 'Finance');

#2 Создать функцию, которая получает на вход f_name и выдает максимальную зарплату среди сотрудников с именем f_name.

drop function NameMaxsalary;
delimiter $$

Create function NameMaxsalary (f_name varchar(20)) returns int
deterministic reads sql data
Begin
Declare max_salary int;
Select Max(s.salary) into max_salary
from salaries s
join employees e
on s.emp_no = e.emp_no
Where f_name = e.first_name
and s.to_date = '9999-01-01';
return max_salary;

end $$
delimiter ;
Select NameMaxsalary ('georgi');

#1  Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).

Select c.name, Count(s.name) from city s
join country c
on c.code = s.Countrycode
Where c.indepyear = '1991'
group by c.name;

#2 Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).

Select population, lifeexpectancy from country
Where code = 'arg';

#3 В какой стране самая высокая продолжительность жизни?

Select Name, lifeexpectancy from country
Order by lifeexpectancy desc
limit 1;

#4 Перечислите все языки, на которых говорят в регионе «Southeast Asia».

Select distinct l.language from countrylanguage l
join country c
on c.code = l.countrycode
Where c.region = 'Southeast Asia';

#Посчитайте сумму SurfaceArea для каждого континента.

Select continent, Sum(surfacearea) from country
group by continent;