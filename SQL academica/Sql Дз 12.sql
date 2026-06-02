#1. 
   
   
   Select d.dept_no	, d.emp_no, s.salary,  Max(s.salary) over (partition by dept_no) as max_salary_in_dept from salaries s
   join dept_emp d
   on s.emp_no = d.emp_no
   WHERE s.to_date = '9999-01-01'
   and d.to_date = '9999-01-01';
   
#2

	Select d.dept_no, d.emp_no, s.salary, avg(s.salary) over (partition by dept_no) as avg_salary_in_dept from salaries s
    join dept_emp d
    on s.emp_no = d.emp_no
    WHERE s.to_date = '9999-01-01'
   and d.to_date = '9999-01-01';
   
#3
	Select d.dept_no, e.emp_no, e.hire_date, Rank() Over (partition by d.dept_no order by e.hire_date) as experience_rank from employees e
    join dept_emp d
    on e.emp_no = d.emp_no
    Where d.to_date = '9999-01-01';
    
#4 
    Select e.emp_no, t.title, lead(t.title) over (partition by emp_no order by t.from_date) as next_title from employees e
    join titles t
    on e.emp_no = t.emp_no;
    
#5
	Select e.emp_no, s.salary, First_value(s.salary) over (partition by emp_no order by s.from_date) as First_salary, Last_value(s.salary) over (partition by emp_no order by s.from_date rows between unbounded preceding and unbounded following) as last_salary
    from employees e
    join salaries s
    on e.emp_no = s.emp_no;
    
#6
	Select e.emp_no, s.salary, avg(s.salary) over (partition by emp_no order by s.from_date rows between 2 preceding and current row)
    from employees e
    join salaries s
    on e.emp_no = s.emp_no;