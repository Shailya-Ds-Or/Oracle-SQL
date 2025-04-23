---------------------------- Advanced SQL Topics -------------------------------

-- 7) Subqueries:

-- 7.1) Subqueries as a Source:
 create view empvw80 as
 select employee_id, first_name, last_name, email, hire_date, job_id, department_id
 from employees
 where department_id = 80;
 
 select state_province, city, department_id, department_name
 from departments join locations
 using (location_id);
 
 select a.first_name, a.last_name, a.hire_date, a.job_id, b.department_name, b.city, b.state_province
 from empvw80 a 
 join (select state_province, city, department_id, department_name
        from departments join locations
        using (location_id)) b
using (department_id);


-- 7.2) Scalar Subqueries:
/*
Returns Exactly One Column for one Row (One Cell).
*/

select department_id from employees
where upper(first_name) = 'LUIS';

select * from employees
where department_id = (
                        select department_id from employees
                        where upper(first_name) = 'LUIS');
                        
select employee_id, first_name, last_name,
       ( case when location_id = (select location_id from locations
                                 where postal_code = '99236')
              then 'San Fransico'
        else 'Outside'
        end ) Country
from employees natural join departments;


-- 7.3) Multiple Column Subqueries:

-- Non-Pairwise Comparision:
select department_id from employees
where upper(first_name) = 'DAVID';

select first_name, last_name, manager_id, department_id
from employees
where department_id in (
                        select department_id from employees
                        where upper(first_name) = 'DAVID'
                        )
and manager_id in (
                    select manager_id from employees
                    where upper(first_name) = 'DAVID'
                 );
                 
-- Pairwise Comparision:
select department_id, manager_id from employees
where upper(first_name) = 'DAVID';

select first_name, last_name, manager_id, department_id
from employees
where (department_id, manager_id) in (
                                      select department_id, manager_id from employees
                                      where upper(first_name) = 'DAVID'
                                      );
                                      
                
-- 7.4) Correlated Subqueries:
-- When Subquery references Column(s) from Parent Query.

select first_name, last_name, manager_id, department_id, salary
from employees a
where salary = (
                select max(salary)
                from employees b
                where a.department_id = b.department_id
                ); -- Employees with Maximum Salary in Their Departments.
                
                
-- 7.5) EXISTS Operator:

select employee_id, first_name, last_name, job_id, department_id
from employees a
where exists (
                select 1
                from employees b
                where b.manager_id = a.employee_id
            ); -- Employees who are Managers too.
            
-- 7.6) NOT EXISTS Operator:

select department_id, department_name
from departments d
where not exists (
                  select 1
                  from employees e
                  where d.department_id = e.department_id
                  ); -- Departments That Have No Employees.
                  
-- 7.7) WITH Clause:
/*
Retrieves Result of a Query Block and Stores it in The User's Temporary Tablespace and
Retrieves Data from This Tablespace Instead of Base Tables.
*/

with max_salaries as (
                      select max(salary) maximum_salary, trunc(avg(salary)) average_salary, department_id
                      from employees
                      group by department_id
                      )
select department_id, department_name, maximum_salary, average_salary
from departments 
natural join max_salaries;


-- 7.8) Recursive WITH Clause:

with all_managers (employee, manager, department) as
(
    select employee_id, manager_id, department_id from employees
    union all
    select all_managers.employee, employees.manager_id, all_managers.department
    from all_managers join employees
    on (all_managers.manager = employees.employee_id)
)
select employee, manager, department
from all_managers
order by employee;
-- Organizing All the Employees with Their Managers, and Their Managers and so on, until
-- Top Level Manager is found in The Same Department. 


-- 7.9) Inserting Data using Subquery:

insert into (
             select department_id, department_name, d.manager_id, d.location_id
             from departments d
             join locations l
             on (d.location_id = l.location_id)
             where l.city = 'Oxford'
             )
values (
        300,
        'Marketing',
        200,
        2500
        );
        
select * from departments;

rollback;

--
insert into (
             select department_id, department_name, manager_id, location_id
             from departments
             where location_id = (
                                select location_id from locations
                                where city = 'Oxford'
                                ) with check option
            ) 
values (
        300,
        'Marketing',
        200,
        2500
        );

select * from departments;
rollback;

--
insert into (
             select department_id, department_name, manager_id, location_id
             from departments
             where location_id = (
                                select location_id from locations
                                where city = 'Oxford'
                                ) with check option
            ) 
values (
        300,
        'Marketing',
        200,
        2000
        ); -- SQL Error: ORA-01402: view WITH CHECK OPTION where-clause violation.


-- 7.10) Correlated Update and Deletes:

drop table employees_copy;

create table employees_copy
as select * from employees;

select * from employees_copy;

update employees_copy e1
set (salary, commission_pct) = (
                                select trunc(avg(salary)), max(commission_pct)
                                from employees_copy e2
                                where e1.department_id = e2.department_id
                                group by e2.department_id
                                );
-- Setting Salaries and Commission PCT of all Employees to Average Salary and Maximum
-- Commission PCt of Their Departments.

select * from employees_copy;

rollback;

--
delete from employees_copy
where department_id in (
                        select department_id
                        from departments join locations
                        using (location_id)
                        where country_id = 'UK'
                        );
-- Deleting All The Employees Whose Departments are Based in UK.

select * from employees_copy;

rollback;


--------------------------------------------------------------------------------

-- 8) Advanced DML Operations:

-- 8.1) Using DEFAULT Keyword While Inserting and Updating:
drop table departments_copy;

create table departments_copy
as select * from departments;

select * from departments_copy;

info departments_copy;

alter table departments_copy
modify manager_id number(6) default 100;

info departments_copy;

insert into departments_copy (department_id, department_name, manager_id, location_id)
values (
        310,
        'Temp Dept',
        default,
        2000
        );

select * from departments_copy;

update departments_copy
set manager_id = default;

select * from departments_copy;

rollback;


-- 8.2) Multitable Insert Statements:

-- 8.2.1) Unconditional Insert All Statement:

create table employees_history
as
select employee_id, first_name, last_name, hire_date
from employees
where 1 = 2;

create table salary_history (
                             employee_id number,
                             year number,
                             month number,
                             salary number,
                             commission_pct number
                             );
                             
select * from employees_history;
select * from salary_history;

insert all
into employees_history
values (employee_id, first_name, last_name, hire_date)

into salary_history
values (employee_id, extract(year from sysdate), extract(month from sysdate), salary, commission_pct)

select * from employees
where department_id = 80;

select * from employees_history;
select * from salary_history;


-- 8.2.2) Conditional Insert All Statement:

truncate table employees_history;
truncate table salary_history;

create table it_programmers
as
select employee_id, first_name, last_name, hire_date
from employees
where 1 = 2;

create table working_in_the_us
as
select employee_id, first_name, last_name, job_id, department_id
from employees
where 1 = 2;

select * from employees_history;
select * from salary_history;
select * from it_programmers;
select * from working_in_the_us;

insert all
    when hire_date > to_date('15-MAR-08') then
        into employees_history values (employee_id, first_name, last_name, hire_date)
        into salary_history values (employee_id, extract(year from sysdate), extract(month from sysdate),
                                    salary, commission_pct)
    
    when job_id = 'IT_PROG' then
        into it_programmers values (employee_id, first_name, last_name, hire_date)
    
    when department_id in (
                            select department_id from departments
                            where location_id in (
                                                  select location_id from locations
                                                  where country_id = 'US')) then
        into working_in_the_us values (employee_id, first_name, last_name, job_id, department_id)

select * from employees;

select * from employees_history;
select * from salary_history;
select * from it_programmers;
select * from working_in_the_us;


-- 8.2.3) Conditional Insert First Statement:

create table low_salaries as
    select employee_id, department_id, salary
    from employees
    where 1 = 2;
select * from low_salaries;

create table average_salaries as
    select employee_id, department_id, salary
    from employees
    where 1 = 2;
select * from average_salaries;

create table high_salaries as
    select employee_id, department_id, salary
    from employees
    where 1 = 2;
select * from high_salaries;

insert first
    when salary < 5000 then
        into low_salaries values (employee_id, department_id, salary)
    
    when salary between 5000 and 10000 then
        into average_salaries values (employee_id, department_id, salary)
        
    else
        into high_salaries values (employee_id, department_id, salary)

select * from employees;

select * from low_salaries;
select * from average_salaries;
select * from high_salaries;


-- 8.2.4) Pivoting Insert Statement:

-- Creating PIVOT Table of Sales by Employees on Each Week Day:

create table emp_sales (
                        employee_id number(6),
                        week_id number(2),
                        sales_mon number,
                        sales_tue number,
                        sales_wed number,
                        sales_thu number,
                        sales_fri number
                        );
select * from emp_sales;

-- Creating Normalized Table of Sales by Employees on Each Week Day:

create table emp_sales_normalized (
                                    employee_id number(6),
                                    week_id number(2),
                                    sales number,
                                    day varchar2(3)
                                    );
select * from emp_sales_normalized;

-- Inserting Data into Pivot Table:
insert all
    into emp_sales values (105,23,2500,3200,4700,5600,2900)
    into emp_sales values (106,24,2740,3060,4920,5650,2800)
select * from dual;
select * from emp_sales;

insert all
    into emp_sales_normalized values (employee_id, week_id, sales_mon, 'MON')
    into emp_sales_normalized values (employee_id, week_id, sales_tue, 'TUE')
    into emp_sales_normalized values (employee_id, week_id, sales_wed, 'WED')
    into emp_sales_normalized values (employee_id, week_id, sales_thu, 'THU')
    into emp_sales_normalized values (employee_id, week_id, sales_fri, 'FRI')
select * from emp_sales;

select * from emp_sales_normalized;


-- 8.3) MERGE Statement:

select * from employees_copy;

delete from employees_copy
where job_id != 'SA_REP';

select * from employees_copy;

update employees_copy
set first_name = 'Alex';

select * from employees_copy;

merge into employees_copy c
using (select * from employees) e
on (c.employee_id = e.employee_id)
when matched then
    update set
        c.first_name = e.first_name,
        c.last_name = e.last_name
    
    delete where department_id is null

when not matched then
    insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date,
                    e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);
                    
select * from employees_copy;


-- 8.4) FLASHBACK Operations:

select * from recyclebin;

select * from employees_copy;

delete from employees_copy
where salary > 5000;

commit;

select * from employees_copy;

alter table employees_copy enable row movement;

flashback table employees_copy to timestamp sysdate - 2/1440;

select * from employees_copy;

--
select dbms_flashback.get_system_change_number from dual; -- SYSTEM

delete from employees_copy
where department_id = 80;

commit;

select * from employees_copy;

flashback table employees_copy to scn 12351744;

select * from employees_copy;

--
drop table employees_copy;

select * from recyclebin;

flashback table employees_copy to before drop;

select * from employees_copy;


-- 8.5) Purge Operations:

select * from recyclebin;

create table emp_cpy
as
select * from employees;

select * from emp_cpy;

drop table emp_cpy;

select * from recyclebin;

flashback table emp_cpy to before drop;

select * from emp_cpy;

drop table emp_cpy purge;

select * from recyclebin;

purge recyclebin;

select * from recyclebin;


-- 8.5) FLASHBACK QUERY and FLASHBACK VERSIONS QUERY:

select * from employees_copy;

select salary from employees_copy
where employee_id = 100;

select dbms_flashback.get_system_change_number from dual; -- SYSTEM

update employees_copy
set salary = 15000
where employee_id = 100;

select salary from employees_copy
where employee_id = 100;

select salary from employees_copy
as of scn 12353540
where employee_id = 100;

select salary from employees_copy
as of timestamp (sysdate - interval '2' minute)
where employee_id = 100;

rollback;

--

select * from employees_copy
where employee_id = 100;

select dbms_flashback.get_system_change_number from dual; -- SYSTEM

update employees_copy
set salary = 10000
where employee_id = 100;
commit;

update employees_copy
set salary = 15000
where employee_id = 100;
commit;

update employees_copy
set salary = 20000
where employee_id = 100;
commit;

select * from employees_copy
where employee_id = 100;

select versions_starttime, salary from employees_copy
versions between timestamp (sysdate - interval '1' minute) and sysdate
where employee_id = 100;

select dbms_flashback.get_system_change_number from dual; -- SYSTEM

select versions_starttime, salary from employees_copy
versions between scn 12354274 and 12354334
where employee_id = 100;


--------------------------------------------------------------------------------

-- 9) Constraints:

-- 9.1) Adding Constraints:

select * from employees_copy;

alter table employees_copy
add constraint temp_cons unique(email);

alter table employees_copy
add constraint temp_cons2 unique (first_name, last_name);

alter table employees_copy
add unique(phone_number);

alter table employees_copy
modify first_name constraint first_name_nn not null;

alter table employees_copy
modify employee_id not null;


-- 9.2) Removing Constraints:

alter table employees_copy
drop constraint temp_cons;

alter table employees_copy
drop constraint temp_cons2;

alter table employees_copy
drop constraint first_name_nn;

alter table employees_copy
drop constraint SYS_C009355 online;

alter table employees_copy
drop constraint SYS_C009357 cascade;


-- 9.3) ON DELETE CASCASE and ON DELETE SET NULL:

select * from salary_history;

alter table employees_copy
add constraint emp_id_pk primary key (employee_id);

alter table salary_history
add constraint sal_emp_fk foreign key (employee_id)
references employees_copy(employee_id);

delete from employees_copy
where employee_id = 166; -- ORA-02292: integrity constraint (HR.SAL_EMP_FK) violated - child record found

--
alter table salary_history
drop constraint sal_emp_fk;

alter table salary_history
add constraint sal_emp_fk foreign key(employee_id)
references employees_copy(employee_id) on delete cascade;

delete from employees_copy
where employee_id = 166;

select * from salary_history;

rollback;

--
alter table salary_history
drop constraint sal_emp_fk;

alter table salary_history
add constraint sal_emp_fk foreign key(employee_id)
references employees_copy(employee_id) on delete set null;

select * from salary_history;

delete from employees_copy
where employee_id = 167;

select * from salary_history;

rollback;


-- 9.4) Cascading Constraints:

alter table employees_copy
drop column employee_id; -- RA-12992: cannot drop parent key column

alter table employees_copy
drop column employee_id cascade constraints;


-- 9.5) Renaming Constraints:

select * from employees_copy;

alter table employees_copy
rename constraint SYS_C009349 to last_name_nn;
