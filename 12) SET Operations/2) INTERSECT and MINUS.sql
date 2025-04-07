--  INTERSECT: Returns Rows which are Common in Both Select Statements.

select * from employees;
select * from retired_employees;

select * from employees
intersect
select * from retired_employees;

select job_id from jobs
intersect
select job_id from employees
where department_id = 80;

-- MINUS: Returns Distinct Rows Returned by The First Query that are not Returned
--        by The Second Query.

select * from retired_employees
minus
select * from employees;

select * from employees
minus
select * from retired_employees;

select first_name from employees
minus
select first_name from retired_employees;

select job_id from job_history
minus
select job_id from employees
where department_id = 80;
