drop table employees_copy;
drop table departments_copy;

create table employees_copy as
select * from employees;

create table departments_copy as
select * from departments;

alter table departments_copy
add constraint dept_cpy_dept_id_pk primary key (department_id);

alter table employees_copy
add constraint emp_dept_cpy_fk foreign key (department_id) references departments_copy(department_id);

--------------------------------------------------------------------------------

-- Disabling A Constraint:

update departments_copy
set department_name = null
where department_id = 10; -- SQL Error: ORA-01407: cannot update ("HR"."DEPARTMENTS_COPY"."DEPARTMENT_NAME") to NULL

alter table departments_copy
disable constraint SYS_C009125;

update departments_copy
set department_name = null
where department_id = 10;

update departments_copy
set department_id = 5
where department_id = 80; -- ORA-02292: integrity constraint (HR.EMP_DEPT_CPY_FK) violated - child record found

alter table departments_copy
disable constraint DEPT_CPY_DEPT_ID_PK; -- ORA-02297: cannot disable constraint (HR.DEPT_CPY_DEPT_ID_PK) - dependencies exist

alter table departments_copy
disable constraint DEPT_CPY_DEPT_ID_PK cascade;

update departments_copy
set department_id = 5
where department_id = 80;

drop table employees_copy;
drop table departments_copy;

--------------------------------------------------------------------------------

-- Creating Disabled Constraint:

create table departments_copy as
select * from departments;

create table employees_copy as
select * from employees;

alter table departments_copy
add constraint dept_cpy_cept_id_pk primary key (department_id) disable;

--------------------------------------------------------------------------------

-- Enabling Constraints:

insert into departments_copy
values (10, 'Temp_Dept', 100, 1700);

insert into departments_copy
values (10, 'Temp_Dept', 100, 1700);

insert into departments_copy
values (10, 'Temp_Dept', 100, 1700);

alter table departments_copy
enable constraint dept_cpy_cept_id_pk; -- ORA-02437: cannot validate (HR.DEPT_CPY_CEPT_ID_PK) - primary key violated

select * from departments_copy;

delete from departments_copy
where department_name = 'Temp_Dept';

alter table departments_copy
enable constraint dept_cpy_cept_id_pk;