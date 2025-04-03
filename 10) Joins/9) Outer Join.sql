select * from employees;

-- Inner Join:
select first_name, last_name, department_name
from employees join departments
using (department_id);

-- Getting names of All Departments and Their Managers:

select * from departments;

select d.department_id, d.department_name,e.first_name, e.last_name
from departments d join employees e
on (d.manager_id = e. employee_id); -- This Inner Join will Not return Departments that Have no Managers.

-- Left Outer Join:

select d.department_id, d.department_name, e.first_name, e.last_name
from departments d left outer join employees e
on (d.manager_id = e.employee_id); -- This will retunr all departments whether they have managers or not.

select * from employees;
select * from departments;

select e.first_name, e.last_name, d.department_id, d.department_name
from employees e left outer join departments d
on (e.department_id = d.department_id);

-- Changing Order of Tables in Previous Query:
select d.department_id, d.department_name, e.first_name, e.last_name
from departments d left join employees e
on (d.department_id = e.department_id);

--------------------------------------------------------------------------------

-- Right Outer Join:

select e.first_name, e.last_name, d.department_name
from employees e right outer join departments d
on (e.department_id = d.department_id);

select e.first_name, e.last_name, d.department_name
from departments d left outer join employees e
on (d.department_id = e.department_id);

-- Both Above queries are Same.

select e.first_name, e.last_name, d.department_name, l.city
from employees e right outer join departments d
on (e.department_id = d.department_id)
right outer join locations l
on (d.location_id = l.location_id);

select e.first_name, e.last_name, d.department_name, l.city
from employees e right outer join departments d
on (e.department_id = d.department_id)
left outer join locations l
on (d.location_id = l.location_id);

--------------------------------------------------------------------------------

-- Full Outer Join:

select first_name, last_name, department_name
from employees full outer join departments
using (department_id);

select e.first_name, e.last_name, d.department_name, l.city
from employees e full join departments d
on (e.department_id = d.department_id)
full join locations l
on (d.location_id = l.location_id);