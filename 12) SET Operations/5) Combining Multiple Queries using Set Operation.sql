select first_name, last_name, department_id, salary
from employees

union all

select first_name, last_name, department_id, salary
from employees
where department_id = 30

union

select first_name, last_name, department_id, salary
from retired_employees

order by salary;

--
select first_name, last_name, department_id, salary
from employees

union all

select first_name, last_name, department_id, salary
from employees
where department_id = 30

minus

select first_name, last_name, department_id, salary
from retired_employees

order by salary;

--
select first_name, last_name, department_id, salary
from employees

minus

select first_name, last_name, department_id, salary
from employees
where department_id = 30

intersect

select first_name, last_name, department_id, salary
from retired_employees

order by salary;

--
select first_name, last_name, department_id, salary
from employees

minus

(select first_name, last_name, department_id, salary
from employees
where department_id = 30
intersect
select first_name, last_name, department_id, salary
from retired_employees)

order by salary;