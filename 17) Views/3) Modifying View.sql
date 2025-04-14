select * from empvw30;

create or replace view empvw30 as
    select employee_id e_id, first_name name, last_name surname, job_id
    from employees
    where department_id = 30;

select * from empvw30;

create or replace view empvw30 as
    select employee_id e_id, first_name || ' ' || last_name name, job_id
    from employees
    where department_id = 30;

select * from empvw30;