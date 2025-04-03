-- Inner Equijoin:

select first_name, last_name, department_name
from employees e join departments d
on (e.department_id = d.department_id);

select e.first_name, e.last_name, e.job_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id and
    e.manager_id = d.manager_id);
    
select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on(d.location_id = l.location_id);
--------------------------------------------------------------------------------

-- Inner Non-Equijoin:

select e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e join jobs j
on( e.job_id = j.job_id
    and e.salary > j.min_salary);

--------------------------------------------------------------------------------

-- Outer Equijoin:

select first_name, last_name, department_name
from employees right join departments
using (department_id);

select e.first_name, e.last_name, d.department_name, l.city, c.country_name
from employees e left join departments d
on (e.department_id = d.department_id)
left join locations l
on (d.location_id = l.location_id)
left join countries c
on (l.country_id = c.country_id);

--------------------------------------------------------------------------------

-- Outer Non-Equijoin:

select e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e left join jobs j
on (e.job_id = j.job_id and
    e.salary between j.min_salary + 500 and j.max_salary);