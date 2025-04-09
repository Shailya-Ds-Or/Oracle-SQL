drop table employees_copy;

create table employees_copy as
select * from employees;

select * from employees_copy;

-- Updating All The Rows of Specified Column:
update employees_copy
set salary = 500;

select * from employees_copy; -- Rollback after this.

-- Updating Filtered Rows of Specified Column:
update employees_copy
set salary = 50000
where job_id = 'IT_PROG';

select * from employees_copy;

-- Updating Multiple Columns:
update employees_copy
set salary = 9999,
    department_id = null
where job_id = 'IT_PROG';

select * from employees_copy;

-- Updating Multiple Columns Using Subquery:
update employees_copy
set (salary, commission_pct) = (select max(salary), max(commission_pct) from employees)
where job_id = 'IT_PROG';

select * from employees_copy;

-- Subquery in WHERE Clause:
update employees_copy
set salary = 100000
where hire_date = (select max(hire_date) from employees);

select * from employees_copy
where hire_date = (select max(hire_date) from employees);