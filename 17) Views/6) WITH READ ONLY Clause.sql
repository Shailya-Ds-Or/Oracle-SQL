drop table employees_copy;
create table employees_copy as
select * from employees;

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 80
    and job_id = 'SA_MAN'
    with read only;
    
select * from empvw80;

insert into empvw80
values (219, 'John3', 'Brown3', 'JBROWN3', sysdate, 'SA_MAN', 80); -- SQL Error: ORA-42399: cannot perform a DML operation on a read-only view

update empvw80
set first_name = 'Steven'
where employee_id = 149; -- SQL Error: ORA-42399: cannot perform a DML operation on a read-only view

delete from empvw80
where employee_id = 149; -- SQL Error: ORA-42399: cannot perform a DML operation on a read-only view