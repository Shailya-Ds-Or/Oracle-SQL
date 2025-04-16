select * from employees_copy; -- HR

select * from hr.employees_copy; -- TEMP_USER

grant select, delete on employees_copy to temp_user, developer; -- HR

select * from hr.employees_copy; -- TEMP_USER

--------------------------------------------------------------------------------
update hr.employees_copy
set salary = 100; -- TEMP_USER

grant update(salary, commission_pct) on employees_copy to temp_user; -- HR

update hr.employees_copy
set salary = 100; -- TEMP_USER

select * from hr.employees_copy; -- TEMP_USER

--------------------------------------------------------------------------------
update hr.employees_copy
set manager_id = 100; -- TEMP_USER

grant update on employees_copy to developer; -- HR

update hr.employees_copy
set manager_id = 100; -- TEMP_USER

select * from hr.employees_copy; -- TEMP_USER

--------------------------------------------------------------------------------
insert into hr.employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)
values (
        207,
        'Alex',
        'Brown',
        'ABROWN',
        sysdate,
        'IT_PROG',
        5000); -- TEMP_USER
        
grant insert on employees_copy to public; -- HR

insert into hr.employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)
values (
        207,
        'Alex',
        'Brown',
        'ABROWN',
        sysdate,
        'IT_PROG',
        5000); -- TEMP_USER

select * from hr.employees_copy; -- TEMP_USER

rollback; -- TEMP_USER

--------------------------------------------------------------------------------

create index idx_emp_cpy on hr.employees_copy(email); -- TEMP_USER

grant all on employees_copy to temp_user; -- HR

create index idx_emp_cpy on hr.employees_copy(email); -- TEMP_USER

grant unlimited tablespace to temp_user; -- SYSTEM

create index idx_emp_cpy on hr.employees_copy(email); -- TEMP_USER

select * from user_tab_privs; -- TEMP_USER;

