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
