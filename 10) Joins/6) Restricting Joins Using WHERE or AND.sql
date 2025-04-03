/* With Joins, We can Restrict Rows using Either WHERE Clause or AND Clause
( AND Clause for Restricting Rows works only with Joins and not with Simple Select Statements)
*/

select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on(d.location_id = l.location_id)
where d.department_id = 100;

select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on(d.location_id = l.location_id)
and job_id = 'IT_PROG';

select e.first_name, e.last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on(d.location_id = l.location_id)
and job_id = 'IT_PROG'
and e.first_name = 'David';
