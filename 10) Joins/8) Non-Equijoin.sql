select * from employees;
select * from jobs;

-- Employees whose Salary is Greater Than Maximum Salary of Sales Representatives(SA_REP): 
select e.employee_id, e.first_name, e.last_name, e.job_id, e.salary,
        j.min_salary, j.max_salary, j.job_id
from employees e join jobs j
on (e.salary > j.max_salary)
where j.job_id = 'SA_REP';

-- Employees whose First Names are Same:
select e1.employee_id, e1.first_name, e1.last_name
from employees e1 join employees e2
on (e1.employee_id != e2.employee_id)
where e1.first_name = e2.first_name
order by e1.first_name;

-- Employees whose Last Names are Same:
select e1.employee_id, e1.first_name, e1.last_name
from employees e1 join employees e2
on (e1.employee_id != e2.employee_id)
where e1.last_name = e2.last_name
order by e1.last_name;

-- Employees whose Salaries are Between Minimum and Maximum Salary of Their Respective Job IDs:
select * from jobs;

select e.first_name, e.last_name, e.salary, e.job_id,
        j.min_salary, j.max_salary
from employees e join jobs j
on (e.job_id = j.job_id and (e.salary between j.min_salary and j.max_salary));