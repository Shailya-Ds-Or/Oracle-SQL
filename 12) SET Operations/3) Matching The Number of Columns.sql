select job_id, null as department_id, first_name, last_name
from employees
union all
select job_id, department_id, null, null
from job_history;


select job_id, 0 as department_id, first_name, last_name
from employees
union all
select job_id, department_id, 'NA', 'NA'
from job_history;

select job_id, null department_id, first_name
from employees
where department_id = 80
union
select job_id, department_id, null
from job_history;
