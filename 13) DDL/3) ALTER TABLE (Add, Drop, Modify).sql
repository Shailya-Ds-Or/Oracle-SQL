-- ALTER TABLE: Changes The Structure of Existing Table.

-- 1) ALTER TABLE ADD:

desc employees_copy;

alter table employees_copy
add ssn varchar2(11); -- Adding One Column.

desc employees_copy;

select * from employees_copy;


alter table employees_copy
add (
        fax_number varchar2(11),
        birthdate date,
        password varchar2(10) default 'abc@123'
    ); -- Adding Multiple Columns.

desc employees_copy;

select * from employees_copy;

-- ALTER TABLE MODIFY:

desc employees_copy;

alter table employees_copy
modify password varchar2(50); -- Modifying One Column.

desc employees_copy;
select * from employees_copy;

alter table employees_copy
modify (
        fax_number varchar2(11) default '-',
        password varchar2(10)
        ); -- Modifying Multiple Columns.
        
info employees_copy;
select * from employees_copy;

-- ALTER TABLE DROP:

desc employees_copy;

alter table employees_copy
drop column ssn; -- Droping Single Column.

alter table employees_copy
drop (
        birthdate
        ); -- Droping Single Column.

desc employees_copy;

alter table employees_copy
drop (
        fax_number,
        password
        ); -- Droping Multiple Columns.
        
desc employees_copy;       