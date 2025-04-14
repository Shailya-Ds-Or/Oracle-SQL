create table employees_copy as
select * from employees;

alter table employees_copy
rename constraint SYS_C009118 to email_nn;

alter table employees_copy
rename constraint SYS_C009117 to last_name_nn;