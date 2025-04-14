drop table employees_copy;

create table employees_copy as
select * from employees;

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id
    from employees_copy
    where department_id = 80;
    
select * from empvw80;

insert into empvw80
values (215, 'John', 'Brown', 'JBROWN', sysdate, 'SA_MAN');

select * from empvw80;
select * from employees_copy;

--------------------------------------------------------------------------------

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id
    from employees_copy
    where department_id = 80
    with check option constraint empvw80_dept80_chk;
    
insert into empvw80
values (216, 'John2', 'Brown2', 'JBROWN2', sysdate, 'SA_MAN'); -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation

--------------------------------------------------------------------------------

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employeeS_copy
    where department_id = 80
    with check option;
    
select * from empvw80;

insert into empvw80
values (217, 'John3', 'Brown3', 'JBROWN3', sysdate, 'SA_MAN', 80);
 
insert into empvw80
values (218, 'John4', 'Brown4', 'JBROWN4', sysdate, 'SA_MAN', 60); -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation

--------------------------------------------------------------------------------

create or replace view empvw80 as
    select employee_id, first_name, last_name, email ,hire_date, job_id, department_id
    from employees_copy
    where department_id = 80
    and job_id = 'SA_MAN'
    with check option;

select * from empvw80;

insert into empvw80
values (218, 'John5', 'Brown5', 'JBROWN5', sysdate, 'IT_PROG', 80); -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation

update empvw80
set first_name = 'Steve'
where employee_id = 217;

select * from empvw80;

update empvw80
set department_id = 70
where employee_id = 217; -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation

--------------------------------------------------------------------------------

select * from user_constraints where table_name = 'EMPVW80';