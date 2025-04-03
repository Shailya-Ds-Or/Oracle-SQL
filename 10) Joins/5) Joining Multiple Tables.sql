select * from employees;
select * from departments;
select * from locations;

select e.first_name, e.last_name, d.department_name, l.city, l.postal_code, l.street_address
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id);

select e.first_name, e.last_name, d.department_name, l.city, l.postal_code, l.street_address
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
using (location_id);

-- Both Queries above are Same.

select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on(e.department_id = d.department_id)
join locations l
using(location_id)
natural join countries c;

select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on(e.department_id = d.department_id)
join locations l
using(location_id)
join countries c
using(country_id);
