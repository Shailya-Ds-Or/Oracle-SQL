create view empvw90 as
select * from employees
where department_id = 90;

select * from empvw90;

select * from empvw90
where salary < 20000;

--------------------------------------------------------------------------------

create view empvw20 as
select employee_id, first_name, last_name
from employees
where department_id = 20;

select * from empvw20;

select first_name, last_name from empvw20;

--------------------------------------------------------------------------------

create view empvw30 as
select employee_id e_id, first_name name, last_name surname
from employees
where department_id = 30;

select * from empvw30;

--------------------------------------------------------------------------------

create view empvw40 (e_id, name, surname, email) as
select employee_id, first_name, last_name, email
from employees
where department_id = 40;

select * from empvw40;