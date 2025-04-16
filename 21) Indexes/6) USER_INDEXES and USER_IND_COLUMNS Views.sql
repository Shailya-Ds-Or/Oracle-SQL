select * from user_indexes;

select * from user_ind_columns;

select * from user_ind_columns
where table_name = 'EMPLOYEES';

select * from employees
where first_name = 'Steven'; -- F10

select * from employees
where last_name = 'King'; -- F10

select * from employees
where last_name = 'King'
and first_name = 'Steven'; -- F10