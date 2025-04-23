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