drop table employees_copy;
create table employees_copy as
select * from employees;

create or replace view empvw60 as
    select employee_id, first_name, last_name, email, hire_date, job_id
    from employees_copy
    where department_id = 60;
    
select * from employees_copy where department_id = 60;
select * from empvw60;

--------------------------------------------------------------------------------

insert into empvw60
values (213, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG');

select * from empvw60;

select * from employees_copy
where department_id = 60;

select * from employees_copy;

--------------------------------------------------------------------------------

create or replace view empvw60 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 60;

select * from empvw60;

insert into empvw60
values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);

select * from empvw60;

select * from employees_copy
where department_id = 60;

update empvw60
set job_id = 'SA_MAN'
where employee_id = 214;

select * from empvw60;

select * from employees_copy
where department_id = 60;

delete from empvw60;

select * from employees_copy
where department_id = 60;

--------------------------------------------------------------------------------

drop table employees_copy;
create table employees_copy as
select * from employees;

create or replace view empvw60 as
    select distinct employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 60; -- Complex View
    
select * from empvw60;

insert into empvw60
values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60); -- SQL Error: ORA-01732: data manipulation operation not legal on this view

update empvw60
set job_id = 'SA_MAN'
where employee_id = 214; -- SQL Error: ORA-01732: data manipulation operation not legal on this view

delete from empvw60; -- SQL Error: ORA-01732: data manipulation operation not legal on this view

--------------------------------------------------------------------------------

create or replace view empvw60 as
    select rownum rn, employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 60; -- Complex View
    
select * from empvw60;

insert into empvw60
values (1, 214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60); -- SQL Error: ORA-01732: data manipulation operation not legal on this view

--------------------------------------------------------------------------------

create or replace view empvw60 as
    select employee_id, first_name, last_name, email, hire_date,
    job_id, department_id, salary * 12 annual_salary
    from employees_copy
    where department_id = 60; -- Complex View
    
select * from empvw60;

insert into empvw60
values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60, 120000); -- SQL Error: ORA-01733: virtual column not allowed here

update empvw60
set job_id = 'SA_MAN'
where employee_id = 107;

delete from empvw60;