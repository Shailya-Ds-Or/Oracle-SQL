-- IN Operator:
select employee_id, first_name, last_name, salary from employees
where employee_id in (100,105,102,200);

select * from employees 
where employee_id in (50, 100, 65, 210);

select * from employees
where employee_id in (50, 100, 210, 65, 150);

select * from employees
where first_name in ('Steven', 'Adam', 'Peter');

select * from employees
where first_name in ('Aa', 'Peter');

select * from employees
where hire_date in ('8-mar-8', '30-jan-5');