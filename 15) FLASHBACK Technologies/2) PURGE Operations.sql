select * from recyclebin;

purge recyclebin; -- Irreversible Operation.

select * from recyclebin;

drop table employees_copy;

select * from employees_copy;

select * from recyclebin;

flashback table employees_copy
to before drop;

select * from recyclebin;

--------------------------------------------------------------------------------

select * from employees_copy;

drop table employees_copy purge; -- Irreversible Operation.

select * from recyclebin;

flashback table employees_copy
to before drop; -- Error.
/*
Error report -
ORA-38305: object not in RECYCLE BIN
38305. 00000 -  "object not in RECYCLE BIN"
*Cause:    Trying to Flashback Drop an object which is not in RecycleBin.
*Action:   Only the objects in RecycleBin can be Flashback Dropped.
*/
--------------------------------------------------------------------------------

create table employees_copy
as select * from employees;

create table employees_copy2
as select * from employees;

create table employees_copy3
as select * from employees;

drop table employees_copy;

drop table employees_copy2;

drop table employees_copy3;

select * from recyclebin;

purge table employees_copy2;

select * from recyclebin;

purge table employees_copy3;

select * from recyclebin;

flashback table employees_copy
to before drop;

select * from employees_copy;