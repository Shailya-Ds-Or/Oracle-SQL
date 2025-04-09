-- DROP TABLE: Removes Existing Table with all its Data and Moves in to The Recycle Bin.

select * from employees_copy6;
drop table employees_copy6;
select * from employees_copy6;

select * from employees_copy5;
drop table employees_copy5;
select * from employees_copy5;

select * from employees_copy4;
select * from employees_copy3;
drop table employees_copy4, employees_copy3; -- Error
drop (employees_copy4, employees_copy3); -- Error
drop tables employees_copy4, employees_copy3; -- Error


select * from employees_copy4;
drop table employees_copy4;
select * from employees_copy4;
flashback table employees_copy4 to before drop;
select * from employees_copy4;

select * from employees_copy4;
drop table employees_copy4 purge;
select * from employees_copy4;
flashback table employees_copy4 to before drop;
/*
Error starting at line : 27 in command -
flashback table employees_copy4 to before drop
Error report -
ORA-38305: object not in RECYCLE BIN
38305. 00000 -  "object not in RECYCLE BIN"
*Cause:    Trying to Flashback Drop an object which is not in RecycleBin.
*Action:   Only the objects in RecycleBin can be Flashback Dropped.
*/