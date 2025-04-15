drop table employees_copy;

create table employees_copy as
select * from employees;

select * from employees_copy;

select * from employees_copy
where employee_id = 103; -- Press F10 to See 'Explain Plan' of Query Execution.

create unique index emp_cpy_eid_idx
on employees_copy (employee_id);

select * from employees_copy
where employee_id = 103; -- Press F10 to See 'Explain Plan' of Query Execution.

select * from employees_copy
where last_name = 'King';-- Press F10 to See 'Explain Plan' of Query Execution.

--------------------------------------------------------------------------------

create unique index emp_cpy_lname_idx
on employees_copy (last_name); -- ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found

create index emp_cpy_laname_idx
on employees_copy (last_name);

select * from employees_copy
where last_name = 'King';-- Press F10 to See 'Explain Plan' of Query Execution.

--------------------------------------------------------------------------------

create index emp_cpy_name_idx
on employees_copy (first_name, last_name);

select * from employees_copy
where last_name = 'King'; -- Press F10 to See 'Explain Plan' of Query Execution.

select * from employees_copy
where last_name = 'King'
and first_name = 'Steven'; -- Press F10 to See 'Explain Plan' of Query Execution.

--------------------------------------------------------------------------------

create bitmap index emp_cpy_comm_idx
on employees_copy (commission_pct);

select * from employees_copy
where commission_pct = 0.4; -- Press F10 to See 'Explain Plan' of Query Execution.