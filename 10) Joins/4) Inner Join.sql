select e.first_name, e.last_name, d.department_name, d.manager_id
from employees e inner join departments d
on(e.department_id = d.department_id and e.manager_id = d.manager_id);

-- Both Queries are same:

select e.first_name, e.last_name, department_name, manager_id
from employees e join departments d
using(department_id, manager_id);

--------------------------------------------------------------------------------
-- On Clause can be used to match Columns that have Different names in Tables:

select e.first_name, e.last_name, d.department_name, d.manager_id
from employees e join departments d
on (e.department_id = d.department_id and e.employee_id = d.manager_id);

select listagg(distinct manager_id,',') from employees;