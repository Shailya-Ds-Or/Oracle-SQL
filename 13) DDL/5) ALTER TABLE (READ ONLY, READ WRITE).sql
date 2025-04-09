create table emp_temp
as select * from employees;

select * from emp_temp;

alter table emp_temp read only;

select * from emp_temp;

delete emp_temp;
/*
Error starting at line : 10 in command -
delete emp_temp
Error at Command Line : 10 Column : 8
Error report -
SQL Error: ORA-12081: update operation not allowed on table "HR"."EMP_TEMP"
12081. 00000 -  "update operation not allowed on table \"%s\".\"%s\""
*Cause:    An attempt was made to update a read-only materialized view.
*Action:   No action required. Only Oracle is allowed to update a
           read-only materialized view.
*/

alter table emp_temp
add gender varchar2(1); -- This Works as Adding a Column Does Not Change Existing Data in Table. 

alter table emp_temp
drop (gender);
/*
Error starting at line : 26 in command -
alter table emp_temp
drop (gender)
Error report -
ORA-12081: update operation not allowed on table "HR"."EMP_TEMP"
12081. 00000 -  "update operation not allowed on table \"%s\".\"%s\""
*Cause:    An attempt was made to update a read-only materialized view.
*Action:   No action required. Only Oracle is allowed to update a
           read-only materialized view.
*/

drop table emp_temp; -- This Works.

create table emp_temp
as select * from employees;

alter table emp_temp read only;

alter table emp_temp read write;

delete emp_temp;