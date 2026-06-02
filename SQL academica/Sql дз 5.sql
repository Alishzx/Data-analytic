#1 Условный оператор IF

Use employees;
Select emp_no, first_name, hire_date,
if (timestampdiff(Year, hire_date, Curdate()) > 30, "Veteran Employee", "New Employee") as Status
from employees;

#2 Условный оператор IF

Select emp_no, first_name,
if (timestampdiff(Year, birth_date, Curdate()) >= 63, "Пенсионер", "Активный сотрудник") as "Age" 
from employees;

#CASE WHEN

Select emp_no, first_name,timestampdiff(Year, birth_date, Curdate()) as "Age", 
Case
When (timestampdiff(Year, birth_date, curdate()) > 50) then "Старший"
When (timestampdiff(Year, birth_date, curdate()) > 30) then "Средний"
Else "Молодой"
End as "Возраст"
From employees;

#REGEXP

Select * from employees
Where first_name regexp '^[AB]';

#Условный оператор IFNULL

Use trainingdb;

Select first_name, department_id, salary,
ifnull(salary, "Unknown") as salary
from employees;

#COALESCE

Select first_name, department_id, salary,
coalesce(salary, default_salary, 25000) as salary
from employees;


