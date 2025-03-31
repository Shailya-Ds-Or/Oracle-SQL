select first_name from employees;

-- using Distinct:
select distinct first_name from employees;

-- Using Unique:
select unique first_name from employees;

-- can not use Multiple Distinct in a single query:
select distinct job_id, distinct department_id from employees;

-- With Multiple Columns, Distinct returns Unique Combinations of Columns:
select distinct job_id, department_id from employees;

select distinct first_name, job_id, department_id from employees;

-- Can not use distinct after column name:
select first_nam, distinct job_id from employees;
