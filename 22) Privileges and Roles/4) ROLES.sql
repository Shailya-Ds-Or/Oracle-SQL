create role developer;

grant create session, 
create sequence,
create table
to developer;

select * from dba_sys_privs
where grantee = 'DEVELOPER';

select * from dba_sys_privs
where grantee = 'TEMP_USER';

grant developer to temp_user;

select * from dba_sys_privs
where grantee = 'TEMP_USER';

select * from user_role_privs; -- SYSTEM, TEMP_USER

select * from session_privs; -- SYSTEM, TEMP_USER

--------------------------------------------------------------------------------

grant create synonym to developer;

create synonym temp_syn for temp_table; -- TEMP_USER

--------------------------------------------------------------------------------

create role test_role
identified by 123;

grant test_role to temp_user;

grant select any table to test_role;

select * from session_privs; -- TEMP_USER

select * from user_role_privs; -- TEMP_USER

set role test_role
identified by 123; -- TEMP_USER

select * from session_privs; -- TEMP_USER

set role all; -- TEMP_USER

select * from session_privs; -- TEMP_USER

set role test_role identified by 123, developer; -- TEMP_USER

select * from session_privs; -- TEMP_USER

set role none; -- TEMP_USER

select * from session_privs; -- TEMP_USER

set role all except test_role;

set role test_role identified by 123, developer; -- TEMP_USER

select * from session_privs; -- TEMP_USER

select * from hr.employees; -- Because of SELECT ANY TABLE Privilege.

drop role test_role; -- SYSTEM

select * from session_privs; -- TEMP_USER