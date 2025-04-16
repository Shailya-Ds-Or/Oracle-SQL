select * from system_privilege_map; -- To See all System Privileges.

select * from user_sys_privs; -- Execute this with TEMP_USER.

create table temp_table (
                         temp_number number); -- Execute this with TEMP_USER.
                         

grant create table, create view
to temp_user
with admin option
container = current;

select * from user_sys_privs; -- Execute this with TEMP_USER.


create table temp_table (
                         temp_number number); -- Execute this with TEMP_USER.
                         
select * from session_privs;
