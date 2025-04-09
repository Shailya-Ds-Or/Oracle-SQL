-- RENAME: To Rename Existing Table or Column.

desc employees_copy;

alter table employees_copy
rename column hire_date to start_date; -- Renaming A Column.

desc employees_copy;

rename employees_copy to employees_backup; -- Renaming A Table.
select * from employees_copy; -- Error.
select * from employees_backup;
alter table employees_backup rename to employees_copy;
select * from employees_backup; -- Error.
select * from employees_copy;