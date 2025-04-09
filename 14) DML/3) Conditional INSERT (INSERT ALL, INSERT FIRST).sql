-- Conditional INSERT ALL Statement:

select * from employees_history;
select * from salary_history;
-- Creating Table IT_PROGRAMMERS with No Data Based on Employees Table:
create table it_programmers as
    select employee_id, first_name, last_name, hire_date
    from employees
    where 1 = 2;

select * from it_programmers;

-- Creating Table Working_in_the_US with No Data Based on Employees Table:
create table working_in_the_us as
    select employee_id, first_name, last_name, job_id, department_id
    from employees
    where 1 = 2;

select * from working_in_the_us;

-- Conditional INSERT:
insert all
    when hire_date > to_date('15-MAR-08') then
        into employees_history values (employee_id, first_name, last_name, hire_date)
        into salary_history values (employee_id, extract(year from sysdate), extract(month from sysdate),
                                    salary, commission_pct)
    
    when job_id = 'IT_PROG' then
        into it_programmers values (employee_id, first_name, last_name, hire_date)
        
    when department_id in
        (select department_id from departments
            where location_id in (
                                    select location_id from locations
                                    where country_id = 'US')) then
        into working_in_the_us values (employee_id, first_name, last_name, job_id, department_id)
select * from employees;

select * from working_in_the_us;
select * from it_programmers;
select * from employees_history;
select * from salary_history;

--------------------------------------------------------------------------------

-- Conditional INSERT FIRST Statement:

-- Creeating Tables LOW_SALARIES, AVERAGE_SALARIES, HIGH_SALARIES with No Data Based on Employees Table:

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
        into high_salaries VALUES (employee_id, department_id, salary)
select * from employees;

select * from low_salaries;
select * from average_salaries;
select * from high_salaries;
