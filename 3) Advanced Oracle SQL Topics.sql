----------------------------- Advenced SQL Topics ------------------------------

-- 10) Privileges and Roles:

-- 10.1) Creating Users:

create user temp_user1 identified by 123; -- SYSTEM

alter user temp_user1 account unlock; -- SYSTEM


-- 10.2) Granting System Privileges:

select * from system_privilege_map;

grant create session to temp_user1;

select * from session_privs; -- HR

select * from user_sys_privs; -- HR

grant create table, create view to temp_user1; -- SYSTEM

create table temp_table (id number); -- TEMP_USER1

select * from temp_table; -- TEMP_USER1


-- 10.3) Roles:

create role dev; -- SYSTEM

grant create table, create view, create session, create materialized view to developer; -- SYSTEM

grant dev to temp_user1; -- SYSTEM

select * from user_sys_privs;; -- TEMP_USER1


-- 10.4) Changing User Password:

alter user temp_user1 identified by 123; -- TEMP_USER!, SYSTEM


-- 10.5) Object Privileges:

grant select, update 
on employees_copy
to temp_user1, dev; -- HR

select * from hr.employees_copy; -- TEMP_USER1

select * from role_tab_privs
where role = 'DEV'; -- SYSTEM

grant update(first_name, last_name)
on employees_copy
to temp_user1; -- HR

update hr.employees_copy
set first_name = 'Alex'; -- TEMP_USER1

select * from hr.employees_copy; -- TEMP_USER1

rollback; -- TEMP_USER1

select * from hr.employees_copy; -- TEMP_USER1

--

revoke create view from temp_user1; -- SYSTEM

revoke select, update
on employees_copy
from temp_user1, dev; -- HR


-- 10.6) Privileges in Data Dictionary Views:

select * from role_sys_privs; -- HR

select * from role_tab_privs; -- HR

select * from user_sys_privs; -- HR

select * from user_role_privs; -- HR

select * from session_privs; -- HR

select * from user_tab_privs; -- HR

select * from all_tab_privs; -- HR

select * from user_col_privs; -- HR


-- 11) Hierarchical Retrieval:

-- 11.1) Bottom Up and Top Down Hierarchy:

-- Bottom Up:
select employee_id, first_name, last_name, job_id, manager_id
from employees
start with employee_id = 102
connect by prior manager_id = employee_id;
-- OR
select employee_id, first_name, last_name, job_id, manager_id
from employees
start with employee_id = 102
connect by employee_id = prior manager_id;

-- Top Down:
select employee_id, first_name, last_name, job_id, manager_id
from employees
start with employee_id = 102
connect by prior employee_id = manager_id;
-- OR
select employee_id, first_name, last_name, job_id, manager_id
from employees
start with employee_id = 102
connect by manager_id = prior employee_id;


-- 11.2) Ranking Rows Using LEVEL Pseudocolumn;

select level, employee_id, first_name, last_name, job_id, manager_id
from employees
where level = 2
start with employee_id = 101
connect by prior employee_id = manager_id;

select level, employee_id, first_name, last_name, job_id, manager_id
from employees
--where level = 2
start with employee_id = 101
connect by prior employee_id = manager_id;

select level, employee_id, first_name, last_name, manager_id
from employees
start with manager_id is null
connect by prior employee_id = manager_id; -- Full Hierarchy of Employees Table, Top Down.


-- 11.3) Formatting Hierarchy Using LEVEL and LPAD:

select level, lpad(last_name, length(last_name) + (level * 2) - 2, '> ') as hierarchy
from employees
start with employee_id = 101
connect by prior employee_id = manager_id;

select level, lpad(last_name, length(last_name) + (level * 2) - 2, '> ') as hierarchy
from employees
start with manager_id is null
connect by prior employee_id = manager_id; -- Full Hierarchy of Employees Table, Top Down.


-- 11.4) Pruning Branches:

select level, lpad(last_name, length(last_name) + (level * 2) - 2, '> ') as hierarchy, employee_id,
                   manager_id
from employees
start with employee_id = 101
connect by prior employee_id = manager_id;

-- WHERE Clause Eliminates Records from Hierarchy Which Matches the Condition:
select level, lpad(last_name, length(last_name) + (level * 2) - 2, '> ') as hierarchy, employee_id,
                   manager_id
from employees
where employee_id != 108
start with employee_id = 101
connect by prior employee_id = manager_id; 

-- Condition after The CONNECT BY CLAUSE Eliminates Records That Matches The Condition and
-- Also Their Child Records
select level, lpad(last_name, length(last_name) + (level * 2) - 2, '> ') as hierarchy, employee_id,
                   manager_id
from employees
start with employee_id = 101
connect by prior employee_id = manager_id
and employee_id != 108;


--------------------------------------------------------------------------------

-- 12) Dynamic SQL Scripts:

-- 12.1) To Create Backup Copies of All Tables of Users:
select * from user_tables;

select 'CREATE TABLE '||table_name||'_BACKUP '||'as select * from '||table_name||';'
        as "Backup Scripts" 
from user_tables;

-- Backup Scripts Copied From Result of Above Query:
CREATE TABLE REGIONS_BACKUP as select * from REGIONS;
CREATE TABLE COUNTRIES_BACKUP as select * from COUNTRIES;
CREATE TABLE LOCATIONS_BACKUP as select * from LOCATIONS;
CREATE TABLE DEPARTMENTS_BACKUP as select * from DEPARTMENTS;
CREATE TABLE JOBS_BACKUP as select * from JOBS;
CREATE TABLE EMPLOYEES_BACKUP as select * from EMPLOYEES;
CREATE TABLE JOB_HISTORY_BACKUP as select * from JOB_HISTORY;
CREATE TABLE EMPLOYEES_HISTORY_BACKUP as select * from EMPLOYEES_HISTORY;
CREATE TABLE SALARY_HISTORY_BACKUP as select * from SALARY_HISTORY;
CREATE TABLE IT_PROGRAMMERS_BACKUP as select * from IT_PROGRAMMERS;
CREATE TABLE WORKING_IN_THE_US_BACKUP as select * from WORKING_IN_THE_US;
CREATE TABLE LOW_SALARIES_BACKUP as select * from LOW_SALARIES;
CREATE TABLE AVERAGE_SALARIES_BACKUP as select * from AVERAGE_SALARIES;
CREATE TABLE HIGH_SALARIES_BACKUP as select * from HIGH_SALARIES;
CREATE TABLE EMP_SALES_BACKUP as select * from EMP_SALES;
CREATE TABLE EMP_SALES_NORMALIZED_BACKUP as select * from EMP_SALES_NORMALIZED;
CREATE TABLE EMPLOYEES_COPY_BACKUP as select * from EMPLOYEES_COPY;
CREATE TABLE DEPARTMENTS_COPY_BACKUP as select * from DEPARTMENTS_COPY;
CREATE TABLE SHOPPING_CART_BACKUP as select * from SHOPPING_CART;
CREATE TABLE SALES_MANAGERS_BACKUP as select * from SALES_MANAGERS;
CREATE TABLE MANAGERS_BACKUP as select * from MANAGERS;
CREATE TABLE EMPLOYEE_ADDRESSES_BACKUP as select * from EMPLOYEE_ADDRESSES;
CREATE TABLE JOBS_COPY_BACKUP as select * from JOBS_COPY;
CREATE TABLE SYS_TEMP_FBT_BACKUP as select * from SYS_TEMP_FBT;
CREATE TABLE DIRECTORS_BACKUP as select * from DIRECTORS;
CREATE TABLE RETIRED_EMPLOYEES_BACKUP as select * from RETIRED_EMPLOYEES;
CREATE TABLE MY_EMPLOYEES_BACKUP as select * from MY_EMPLOYEES;
CREATE TABLE EMP_TEMP_BACKUP as select * from EMP_TEMP;


-- 12.2) To Drop Multiple Tables at Once:

select 'DROP TABLE '||table_name||';' as "Drop Scripts"
from user_tables
where table_name like '%_BACKUP';

-- Drop Scripts Copied From Result of Above Query:
DROP TABLE WORKING_IN_THE_US_BACKUP;
DROP TABLE REGIONS_BACKUP;
DROP TABLE COUNTRIES_BACKUP;
DROP TABLE LOCATIONS_BACKUP;
DROP TABLE DEPARTMENTS_BACKUP;
DROP TABLE JOBS_BACKUP;
DROP TABLE EMPLOYEES_BACKUP;
DROP TABLE LOW_SALARIES_BACKUP;
DROP TABLE AVERAGE_SALARIES_BACKUP;
DROP TABLE HIGH_SALARIES_BACKUP;
DROP TABLE EMP_SALES_BACKUP;
DROP TABLE EMP_SALES_NORMALIZED_BACKUP;
DROP TABLE EMPLOYEES_COPY_BACKUP;
DROP TABLE DEPARTMENTS_COPY_BACKUP;
DROP TABLE EMPLOYEE_ADDRESSES_BACKUP;
DROP TABLE JOBS_COPY_BACKUP;
DROP TABLE DIRECTORS_BACKUP;
DROP TABLE RETIRED_EMPLOYEES_BACKUP;
DROP TABLE JOB_HISTORY_BACKUP;
DROP TABLE EMPLOYEES_HISTORY_BACKUP;
DROP TABLE SALARY_HISTORY_BACKUP;
DROP TABLE IT_PROGRAMMERS_BACKUP;
DROP TABLE EMP_TEMP_BACKUP;
DROP TABLE MANAGERS_BACKUP;
DROP TABLE MY_EMPLOYEES_BACKUP;
DROP TABLE SALES_MANAGERS_BACKUP;
DROP TABLE SHOPPING_CART_BACKUP;
DROP TABLE SYS_TEMP_FBT_BACKUP;

purge recyclebin;

select * from recyclebin;
