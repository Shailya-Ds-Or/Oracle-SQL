-- SET UNUSED: Mark One or More Columns Unused.

select * from employees_copy;

alter table employees_copy
set unused (
            first_name,
            phone_number,
            salary
            ); -- Setting Multiple Columns as Unused.
            
select * from employees_copy;

desc employees_copy;

select * from user_unused_col_tabs; -- To see Unused Columns.

alter table employees_copy
set unused column last_name online; -- Setting Single Column as Unused, Allows DML Operations.

select * from employees_copy;
desc employees_copy;

select * from user_unused_col_tabs;

alter table employees_copy
drop unused columns; -- To Drop All Unused Columns.

select * from user_unused_col_tabs;
