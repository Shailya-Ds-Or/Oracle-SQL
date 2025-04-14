drop table employees_copy;
drop table departments_copy;

create table employees_copy as
select * from employees;

create table departments_copy as
select * from departments;

alter table departments_copy
add constraint dep_cpy_dep_id_pk primary key(department_id);

alter table employees_copy
add constraint em_dep_cpy_fk foreign key (department_id) references departments_copy(department_id);

alter table departments_copy
drop column department_id; -- ORA-12992: cannot drop parent key column

alter table departments_copy
drop column department_id cascade constraints;

--------------------------------------------------------------------------------

alter table employees_copy
add unique (first_name, last_name);

alter table employees_copy
drop column last_name; -- ORA-12991: column is referenced in a multi-column constraint

alter table employees_copy
drop column last_name cascade constraints;

drop table employees_copy;
drop table departments_copy;