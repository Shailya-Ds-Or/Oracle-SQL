select * from employees;

select upper(first_name), lower(last_name), initcap(email) from employees;

select first_name, upper(first_name), last_name, lower(last_name), email, initcap(email) from employees;

select * from employees
where last_name = 'king';

select * from employees
where lower(last_name) = 'king';

select * from employees
where last_name = initcap('king');

select * from employees
where first_name = initcap('&First_Name');