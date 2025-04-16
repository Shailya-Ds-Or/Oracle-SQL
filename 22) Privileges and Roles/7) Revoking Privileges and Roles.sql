select * from dba_sys_privs
where grantee = 'TEMP_USER'; -- SYSTEM

select * from dba_tab_privs
where grantee = 'TEMP_USER';  -- SYSTEM

select * from dba_role_privs
where grantee = 'TEMP_USER';  -- SYSTEM

--------------------------------------------------------------------------------
revoke create view from temp_user; -- SYSTEM

select * from dba_sys_privs
where grantee = 'TEMP_USER';  -- SYSTEM
--------------------------------------------------------------------------------

revoke alter on hr.employees_copy
from temp_user;  -- SYSTEM

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

--------------------------------------------------------------------------------

alter table employees_copy
add primary key (employee_id); -- HR

create table temp (
                    temp_column number,
                    constraint fk_temp foreign key (temp_column) references hr.employees_copy(employee_id)
                    ); -- TEMP_USER
                    
revoke references on hr.employees_copy
from temp_user cascade constraints; -- SYSTEM

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

drop table temp; -- TEMP_USER

--------------------------------------------------------------------------------

revoke update, delete on hr.employees_copy
from temp_user, developer; -- SYSTEM

grant all on employees_copy to temp_user; -- HR

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

revoke all on employees_copy from temp_user; -- HR

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

--------------------------------------------------------------------------------

grant select on redo_db
to hr with grant option; -- SYSTEM

select * from dba_tab_privs
where grantee = 'HR'; -- SYSTEM

grant select on system.redo_db
to temp_user; -- HR

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

revoke select on redo_db from hr; -- SYSTEM

select * from dba_tab_privs
where grantee = 'HR'; -- SYSTEM

select * from dba_tab_privs
where grantee = 'TEMP_USER'; -- SYSTEM

--------------------------------------------------------------------------------

revoke developer from temp_user; -- SYSTEM

select * from dba_role_privs
where grantee = 'TEMP_USER';  -- SYSTEM