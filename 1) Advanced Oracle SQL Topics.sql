---------------------------- Advanced SQL Topics --------------------------------

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


--------------------------------------------------------------------------------

-- 5) Views:
/*
Schema Object Based on a Stored Select Statement Based on Another Table or View.
Stored in Data Dictionary as a SELECT Statement.
Used for : Restricting Access to Data,
           Making Complex Queries Easy,
           Presenting Different Views of Same Data.
*/

-- 5.1) Creating Simple Views:

create view empvw90 as
select * from employees
where department_id = 90;

select * from empvw90;

--

create view empvw20 as
select employee_id, first_name, last_name
from employees
where department_id = 20;

select * from empvw20;

--

create view empvw30 as
select employee_id eid, first_name name, last_name surname
from employees
where department_id = 30;

select * from empvw30;

--

create view empvw40 (eid, name, surname) as
select employee_id, first_name, last_name
from employees
where department_id = 40;

select * from empvw40;


-- 5.2) Creating Complex Views:

create view emp_cx_vw (dname, min_sal, max_sal) as
select upper(department_name), min(salary), max(salary)
from employees e join departments d
on (e.department_id = d.department_id)
group by department_name;

select * from emp_cx_vw;


-- 5.3) Modifying Views:

select * from empvw30;

create or replace view empvw30 (eid, full_name, email, phone) as
select employee_id, first_name || ' ' || last_name, email, phone_number
from employees
where department_id = 30;

select * from empvw30;


-- 5.4) USER_VIEWS View:

select * from user_views; -- HR

select * from all_views; -- HR

select * from dba_views; -- SYS, SYSTEM


-- 5.5) DML Operations with Views:

select * from employees_copy;

create or replace view empvw80 as
select employee_id, first_name, last_name, email, hire_date, job_id
from employees_copy
where department_id = 80;

select * from empvw80;

insert into empvw80
values (
        213,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG');

select * from employees_copy;
select * from empvw80;

rollback;


-- 5.6) WITH CHECK OPTION:

create or replace view empvw80 as
select employee_id, first_name, last_name, email, hire_date, job_id
from employees_copy
where department_id = 80;

select * from empvw80;

insert into empvw80
values (
        213,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG');
        
select * from empvw80
where employee_id = 213;

select * from employees_copy
where employee_id = 213;

rollback;

--

create or replace view empvw80 as
select employee_id, first_name, last_name, email, hire_date, job_id, department_id
from employees_copy
where department_id = 80;

select * from empvw80;

insert into empvw80
values (
        213,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG',
        80);
        
select * from employees_copy
where employee_id = 213;

select * from empvw80
where employee_id = 213;

insert into empvw80
values (
        214,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG',
        90);
        
select * from employees_copy
where employee_id = 214;

select * from empvw80
where employee_id = 214;

rollback;
--

create or replace view empvw80 as
select employee_id, first_name, last_name, email, hire_date, job_id, department_id
from employees_copy
where department_id = 80
with check option;

insert into empvw80
values (
        215,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG',
        90); -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation

insert into empvw80
values (
        215,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG',
        80);
        
select * from employees_copy
where employee_id = 215;

select * from empvw80
where employee_id = 215;

rollback;
select * from employees_copy;


-- 5.7) WITH READ ONLY:

create or replace view empvw80 as
select employee_id, first_name, last_name, email, hire_date, job_id,department_id
from employees_copy
where department_id = 80
with read only;

select * from empvw80;

insert into empvw80
values (
        215,
        'Alex',
        'Hummel',
        'AHUMMEL',
        sysdate,
        'IT_PROG',
        80); -- SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
        

-- 5.8) Dropping Views:

select * from user_views;

drop view empvw90;
drop view empvw80;
drop view empvw40;
drop view empvw30;
drop view empvw20;
drop view emp_cx_vw;

select * from user_views;


--------------------------------------------------------------------------------

-- 6) Materialized Views:
/*
Materialized View has a Stored SQL Query and a Table which Keeps the Returning Data of that Query.
Materialized View Refreshes This table on a Specified Time Frequency or On Demand.
Useful for Reducing Network Loads and Reducing SQL Costs. 
*/

-- 6.1) Creating Simple Materialized View:

grant create materialized view to hr; -- SYS

create materialized view department_max_salaries_mv
build immediate
refresh complete on demand
enable query rewrite
as
select department_id, max(salary)
from employees
group by department_id
order by department_id;

select * from department_max_salaries_mv;


-- 6.2) Complex Materialized Views:
/*
Can not be Fast Refreshed or On Commit Refreshed.
*/

create materialized view department_min_salaries_mv
build immediate
refresh complete on demand
enable query rewrite
as
select d.department_name, e.*
from departments d join employees e
on (e.department_id = d.department_id)
where (e.department_id, salary) in 
                                    (select department_id, min(salary)
                                    from employees
                                    group by department_id)
order by e.department_id, salary;

select * from department_min_salaries_mv;

--

create materialized view employee_departments 
as
select distinct department_id from employees
order by department_id;

select * from employee_departments;

--

create materialized view mview_employees
as
select employee_id, first_name, last_name, department_id, job_id
from employees
where department_id = 80

union all

select employee_id, first_name, last_name, department_id, job_id
from employees
where job_id = 'IT_PROG';

select * from mview_employees;

--

create materialized view emp_depts
as
select employee_id, first_name, last_name, department_name
from employees e join departments d
on (e.department_id = d.department_id);

select * from emp_depts;

--

create materialized view avg_salaries
as
select avg(salary) "Average Salary", count(*)
from employees;

select * from avg_salaries;


-- 6.3) Refreshing Materialized Views:

/*
1) Fast Refresh: Changes (DML) made on Master Tables are Stored in Materialized View Log.
                 On Refresh, only These Changes are Applied to Materialized View Instead of
                 Completely Refreshing it.
                 
                 We need to Create a Materialized View Log Associated with Master Table(s)
                 for using Fast Refresh.
*/
create materialized view log on employees_copy;

create materialized view sales_managers_mv
build immediate
refresh fast on commit
as
select * from employees_copy
where job_id = 'SA_MAN';

select * from sales_managers_mv;

insert into employees_copy
values (
        500,
        'Alex',
        'Brown',
        'ABROWN',
        '011.44.1344.429000',
        sysdate,
        'SA_MAN',
        10000,
        null,
        102,
        60);

select * from employees_copy
where employee_id = 500;

select * from sales_managers_mv;

commit;

select * from sales_managers_mv;

/*
2) Complete Refresh: Truncates The Whole table Associated With Materialized View and
                     Refills it Completely from Defining Query.
                     If we Request Complete Refresh, Oracle Will Perform Complete Refresh even
                     if Fast Refresh is Suitable and Available.
*/

drop materialized view log on employees;
drop materialized view sales_managers_mv;

create materialized view sales_managers_mv
build immediate
refresh complete on commit
as
select * from employees_copy
where job_id = 'SA_MAN';

select * from sales_managers_mv;

insert into employees_copy
values (
        501,
        'Alex',
        'Kumar',
        'AKUMAR',
        '011.44.1344.429111',
        sysdate,
        'SA_MAN',
        10000,
        null,
        102,
        60);

select * from employees_copy
where employee_id = 501;

select * from sales_managers_mv;

commit;

select * from sales_managers_mv;

/*
3) FORCE REFRESH: Default.
                  If Specified, Oracle will Try to Perform Fast Refresh if Possible.
                  If Not Possible, Oracle will Perfrom Complete Refresh.
*/

create materialized view it_programmers_mv
build immediate
refresh force on commit
as
select * from employees_copy
where job_id = 'IT_PROG'
order by department_id;

select * from it_programmers_mv;

insert into employees_copy
values (
        502,
        'It',
        'Guru',
        'IGURU',
        '011.44.1344.429222',
        sysdate,
        'IT_PROG',
        10000,
        null,
        103,
        60);

select * from employees_copy
where employee_id = 502;

select * from it_programmers_mv;

commit;

select *  from it_programmers_mv;

--

select * from user_mviews;

drop materialized view DEPARTMENT_MAX_SALARIES_MV;
drop materialized view DEPARTMENT_MIN_SALARIES_MV;
drop materialized view EMPLOYEE_DEPARTMENTS;
drop materialized view MVIEW_EMPLOYEES;
drop materialized view EMP_DEPTS;
drop materialized view AVG_SALARIES;
drop materialized view SALES_MANAGERS_MV;
drop materialized view IT_PROGRAMMERS_MV;


-- 6.4) Manual Refresh of Materialized Views:

-- 1) Using DBMS_MVIEW.REFRESH('MVIEW_NAME', REFRESH_TYPE) Procedure: (Refresh Type: F: FORCE, C: COMPLETE)

create materialized view it_programmers_mv
build immediate
refresh force
as
select * from employees_copy
where job_id = 'IT_PROG'
order by department_id;

select * from it_programmers_mv;

select * from employees_copy
where job_id = 'IT_PROG'
order by department_id;

insert into employees_copy
values (
        333,
        'Alex',
        'Green',
        'AGREEN',
        '590.423.4500',
        sysdate,
        'IT_PROG',
        10000,
        null,
        102,
        70);
        
commit;

select * from employees_copy
where job_id = 'IT_PROG'
order by department_id;

select * from it_programmers_mv;

execute dbms_mview.refresh('it_programmers_mv', 'F');

select * from it_programmers_mv;

delete from employees_copy
where employee_id = 333;

commit;

select * from it_programmers_mv;

execute dbms_snapshot.refresh('it_programmers_mv', 'C');

select * from it_programmers_mv;

select * from user_mviews;

drop materialized view it_programmers_mv;


-- 6.5) Scheduling Periodic Refresh:

create materialized view sales_managers_mv
build immediate
refresh force
start with sysdate + 3/24 -- (First Refresh after 3 Hours of Creation)
next sysdate + 5 -- (All Consecutive Updates will be at 5 Days Intervals)
as
select * from employees_copy
where job_id = 'SA_MAN'
order by department_id;

select * from sales_managers_mv;

drop materialized view sales_managers_mv;
