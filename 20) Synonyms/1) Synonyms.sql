create synonym test_syn
for employees;

select * from hr.test_syn;

create or replace synonym test_syn
for departments;

select * from test_syn;

drop synonym test_syn;

--------------------------------------------------------------------------------

create synonym test_syn
for sys.user_objects;

select * from test_syn;

--------------------------------------------------------------------------------

create or replace public synonym test_syn
for hr.employees; -- Connect to SYSTEM User

select * from test_syn;
/* If we Execute above Statement as SYSTEM User, It will give us Data from Employees table 
in HR Schema, as we created Public Synonym Using SYSTEM User on HR.EMPLOYEES Table.

If we Execute above Statement as HR User, it will return Data from USER_OBJECTS View,
as we have created private synonym with same name TEST_SYN in HR Schema.

If there is Private and Public Synonym with Same Name, Private will Take Precedence.
*/

drop synonym test_syn; -- Execute this with HR User and It will Drop Private Synonym Created by
                       -- HR User on USER_OBJECTS View.
                       
select * from test_syn; -- This will Return Data from Employees Table now, as Private Synonym with
                        -- Same Name is Dropped.

--------------------------------------------------------------------------------

create or replace public synonym test_syn
for system.redo_db; -- Connect to SYSTEM User.

select * from test_syn;
/*
Above Statement will Not Work When Executed as HR User because HR User Does Not Have required
Privilages to View Data From SYSTEM.REDO_DB Table.
*/

--------------------------------------------------------------------------------

create synonym employees
for employees; -- ORA-01471: cannot create a synonym with same name as object

create public synonym employees
for hr.employees; -- Connect to SYSTEM User

--------------------------------------------------------------------------------

create synonym employees2 for departments100;
-- we can Create Synonyms for Objects that Don't Exist Yet.

select * from employees2; -- ORA-00980: synonym translation is no longer valid

drop synonym employees2;

drop public synonym test_syn; -- Connect to SYSTEM User.

drop public synonym employees; -- Connect to SYSTEM User.
