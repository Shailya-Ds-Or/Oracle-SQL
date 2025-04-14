drop table departments_copy;

create table departments_copy as
select *from departments;

alter table departments_copy
add constraint dept_cpy_dept_id_pk primary key (department_id);

--------------------------------------------------------------------------------
-- Disable Novalidate:

alter table departments_copy
disable constraint dept_cpy_dept_id_pk;
-- OR
alter table departments_copy
disable novalidate constraint dept_cpy_dept_id_pk;

update departments_copy
set department_id = 10
where department_id = 20;

--------------------------------------------------------------------------------

-- Disable Validate:

alter table departments_copy
disable validate constraint dept_cpy_dept_id_pk; -- ORA-02437: cannot validate (HR.DEPT_CPY_DEPT_ID_PK) - primary key violated

delete from departments_copy
where department_id = 10;

alter table departments_copy
disable validate constraint dept_cpy_dept_id_pk;

update departments_copy
set department_name = 'Temp'
where department_id = 30; -- SQL Error: ORA-25128: No insert/update/delete on table with constraint (HR.DEPT_CPY_DEPT_ID_PK) disabled and validated

--------------------------------------------------------------------------------

-- Enable Validate:

alter table departments_copy
enable constraint dept_cpy_dept_id_pk;
-- OR
alter table departments_copy
enable validate constraint dept_cpy_dept_id_pk;

--------------------------------------------------------------------------------

-- Enable Novalidate:

alter table departments_copy
disable constraint dept_cpy_dept_id_pk;

update departments_copy
set department_id = null
where department_id = 40;

select * from departments_copy;

alter table departments_copy
enable novalidate constraint dept_cpy_dept_id_pk;

update departments_copy
set department_id = null
where department_id = 50; -- SQL Error: ORA-01407: cannot update ("HR"."DEPARTMENTS_COPY"."DEPARTMENT_ID") to NULL

select * from departments_copy;