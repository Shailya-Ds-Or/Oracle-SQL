drop table employees_copy;
create table employees_copy as
select * from employees;

create index emp_cpy_lname_idx on employees_copy(last_name);

select * from employees_copy
where last_name = 'KING'; -- F10

select * from employees_copy
where upper(last_name) = 'KING'; -- F10

drop index emp_cpy_lname_idx;

create index emp_cpy_lname_idx on employees_copy(upper(last_name));

select * from employees_copy
where upper(last_name) = 'KING'; -- F10

select * from employees_copy
where lower(last_name) = 'KING'; -- F10

select * from employees_copy
where last_name = 'KING'; -- F10