-- without any conditions:
select * from employees;

-- with condition:
select * from employees where salary > 15000;

select * from employees where salary >= 15000;

select * from employees where salary < 10000;

select * from employees where salary <= 10000;

select * from employees where hire_date > '01-JAN-05';

select * from employees where hire_date = '21-may-07';

select * from employees where manager_id != 100;

select * from employees where manager_id <> 100;

select * from employees where manager_id = 100;