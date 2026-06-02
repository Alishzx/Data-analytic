Select * from employees
where hire_date > '2000-01-01';

#Без индекса 0.140 сек

Create index idx_hire_date on employees (hire_date);

#С индексом 0.000 сек
Drop index idx_hire_date on employees;

Select * from employees
where first_name = 'Georgi' and last_name = 'Facello';

#Без индекса 0.109 сек

Create index idx_name
on employees (first_name, last_name);

#С индексом 0.000 сек

Drop index idx_name on employees;