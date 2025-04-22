---------------------------- Advance SQL Topics --------------------------------

-- 1) Data Dictionary Views:
/* Collection of Tables and Views that contains Infromation about The Database,
Created and Maintained by Oracle Server.
*/

-- 1.1) Dictionary Table:
-- Connect as SYS-CDB to view all Comments.

select * from dictionary; -- SYS_CDB
--or
select * from dict; -- SYS_CDB

select * from dict
where table_name = 'USER_TABLES'; -- SYS_CDB

select * from dict
where upper(comments) like '%SECURITY%'; -- SYS_CDB


-- 1.2) USER_OBJECTS, ALL_OBJECTS, DBA_OBJECTS:

select * from user_objects; -- HR, SYS

select * from user_catalog; -- HR, SYS
-- OR
select * from cat;

select * from all_objects; -- HR, SYSTEM, SYS

select * from dba_objects; -- SYS, SYSTEM


-- 1.3) USER_TABLES View:

select * from user_tables; -- HR
-- OR
select * from tabs; -- HR

select * from all_tables; -- HR

select * from dba_tables; -- SYS, SYSTEM


-- 1.4) USER_TAB_COLUMNS View:

select * from user_tab_columns; -- HR
-- OR
select * from cols; -- HR

select * from cols
where table_name = 'EMPLOYEES';  -- HR

select * from all_tab_columns; -- HR

select * from dba_tab_columns; -- SYS, SYSTEM


-- 1.5) USER_CONSTRAINTS View:

select * from user_constraints; -- HR

select * from all_constraints; -- HR

select * from dba_constraints; -- SYS, SYSTEM


-- 1.6) USER_CONS_COLUMNS View:

select * from user_cons_columns; -- HR

select * from user_cons_columns
where table_name = 'EMPLOYEES'; -- HR

select b.constraint_type, a.* 
from user_cons_columns a join user_constraints b
on (a.table_name = b.table_name)
where a.table_name = 'EMPLOYEES'; -- HR

select * from all_cons_columns; -- HR

select * from dba_cons_columns; -- SYS, SYSTEM 


-- 1.7) USER_TAB_COMMENTS and USER_COL_COLUMNS Views:

select * from user_tab_comments; -- HR

select * from user_col_comments; -- HR

select * from all_tab_comments; -- HR
select * from all_col_comments; -- HR

select * from dba_tab_comments; -- SYS, SYSTEM 
select * from dba_col_comments; -- SYS, SYSTEM


--------------------------------------------------------------------------------

-- 2) Sequences:
/* Used to Create Unique Integers automatically.
Is sharable Object, can be used by Multiple Users.
Used for Creating Primary Key Values mainly.
*/

-- 2.1) Creating Sequences:
create sequence seq1
start with 100
increment by 3
maxvalue 99999
cache 50
nocycle
noorder;


-- 2.2) Modifying Sequence:
alter sequence seq1
increment by 4
maxvalue 100000
cache 30
cycle
order;


-- 2.3) Dropping Sequence:
drop sequence seq1;


-- 2.4) Using Sequences:

create sequence seq
start with 100
increment by 3
maxvalue 99999
cache 50
nocycle
noorder;

select seq.currval from dual; -- Error.
select seq.nextval from dual;
select seq.nextval from dual;

select seq.nextval from employees; -- To generate 107 Next Numbers from Sequence (Employees has 107 rows)

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values (
        seq.nextval,
        'Alex',
        'Earnst',
        'ALEXIS',
        sysdate,
        8000,
        'IT_PROG'); -- Using Sequence in a Primary key Column.
        
select * from employees;

rollback;

select * from employees;

select seq.currval from dual;

create table temp (
                    t1 number default seq.nextval not null,
                    t2 varchar2(50)
                    ); -- using Sequence as Default Value for a Column.

insert into temp (t2) values ('Alex');
insert into temp (t2) values ('Brown');
insert into temp values (100, 'Alex');
select * from temp;
select seq.currval from dual;

drop table temp;


-- 2.5) USER_SEQUENCES View:

select * from user_sequences; -- HR

select * from all_sequences; -- HR

select * from dba_sequences; -- SYS, SYSTEM


--------------------------------------------------------------------------------

-- 3) Synonyms:
/*
Database Object Created to Give an Alternative Name to Another Database object.
Can be thought of simply as an Alias.
Useful for Hiding Name and Location of an Object.
Used for Abbreviating Complex Object Names and Eliminating Need to Write Schema Name before Object Name.
*/

-- 3.1) Creating and Dropping Synonyms:

create synonym sy for employees;

select * from sy;

create public synonym sy2 for employees; -- HR, Error.

create public synonym sy2 for hr.employees; -- SYSTEM

select * from sy2; -- SYS

drop synonym sy; -- HR

drop public synonym sy2; -- SYSTEM


-- 3.2) Using Synonyms:

create synonym sy for user_objects;

select * from sy
where object_name = 'EMPLOYEES';

drop synonym sy;


-- 3.3) USER_SYNONYMS View:

select * from user_synonyms; -- HR

select * from all_synonyms; -- HR

select * from dba_synonyms; -- SYS, SYSTEM


--------------------------------------------------------------------------------

-- 4) Index:

-- 4.1) Creating Index:

create unique index temp_idx
on employees (employee_id); -- Error.

--
create unique index phone_num_idx
on employees(phone_number);

select * from employees 
where last_name = 'King'; -- F10

select * from employees
where phone_number = '515.123.4567';
--

create unique index name_idx
on employees (first_name, last_name);

select * from employees
where first_name = 'Steven'; -- F10

select* from employees
where last_name = 'King'; -- F10

select * from employees
where last_name = 'King' and first_name = 'Steven'; -- F10

select * from employees
where first_name = 'Steven' and last_name = 'King'; -- F10
--

create bitmap index comm_pct_idx
on employees (commission_pct); -- F10

select * from employees
where commission_pct = 0.25; --F10


-- 4.2) Creating Index while Table Creation:

create table employee_temp (
                            emp_id number(6) primary key using index(
                                                create index emp_id_idx on employee_temp(emp_id)),
                            first_name varchar2(50),
                            last_name varchar2(50)
                            );

select * from employee_temp; -- SHIFT+F4

drop table employee_temp;
--

create table employee_temp (
                            emp_id number,
                            first_name varchar2(50),
                            last_name varchar2(50)
                            );
    
create index emp_id_idx
on employee_temp (emp_id);

alter table employee_temp
add primary key (emp_id)
using index emp_id_idx;

select * from employee_temp; -- SHIFT+F4

drop table employee_temp;


-- 4.3) Function Based Index:

select * from employees
where upper(first_name) = 'ALEX'; -- F10

create index first_name_idx
on employees (upper(first_name));

select * from employees
where upper(first_name) = 'ALEX'; -- F10


-- 4.4) Multiple Indexes on Same Column:
/*
Multiple Indexes on Same Set of Columns have to be Different Kind of Indexes.
If we have Multiple Indexes on Same Set of Columns, Only One Index can be Visible at a Time. 
*/

create table employee_temp (
                            emp_id number,
                            first_name varchar2(50),
                            last_name varchar2(50)
                            );
                            
create index temp_idx
on employee_temp(first_name, last_name);

create bitmap index temp_idx2
on employee_temp(first_name, last_name); -- Error.

alter index temp_idx invisible;

create bitmap index temp_idx2
on employee_temp(first_name, last_name);

select * from employee_temp
where first_name = 'Xx'
and last_name = 'Yy'; -- F10

alter index temp_idx2 invisible;

select * from employee_temp
where first_name = 'Xx'
and last_name = 'Yy'; -- F10

alter index temp_idx visible;

select * from employee_temp
where first_name = 'Xx'
and last_name = 'Yy'; -- F10


-- 4.5) Dropping Index:

drop index temp_idx;

drop index temp_idx2 online;

drop table employee_temp;


-- 4.6) USER_INDEXES and USER_IND_COLUMNS View:

select * from user_indexes; -- HR
select * from user_ind_columns; -- HR

select * from all_indexes; -- HR
select * from all_ind_columns; --HR

select * from dba_indexes; -- SYS, SYSTEM
select * from dba_ind_columns; -- SYS, SYSTEM

select * from dba_synonyms
where owner = 'OE'; -- SYS, SYSTEM
