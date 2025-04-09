-- Employee_History Table with No Data:
create table employees_history as
select employee_id, first_name, last_name, hire_date
from employees
where 1= 2;

select * from employees_history;

-- Salary_History Table with No Data:
-- 1234 and 12 are just random numbers to make sure The Data Type of Both Year and Month Columns is Number
create table salary_history as
select employee_id, 1234 as year, 12 as month, salary, commission_pct
from employees
where 1 = 2;

select * from salary_history;

insert all
    into employees_history (employee_id, first_name, last_name, hire_date)
    values (employee_id, first_name, last_name, hire_date)
    
    into salary_history (employee_id, year, month, salary, commission_pct)
    values (employee_id, extract(year from sysdate), extract(month from sysdate), salary, commission_pct)

select * from employees
where hire_date> '15-MAR-08';

select * from employees_history;
select * from salary_history;

-- Inserting Multiple Rows into Same Table Using INSERT ALL:
insert all
    into employees_history 
    values (105, 'Adam', 'Smith', sysdate)
    
    into employees_history 
    values (106, 'Paul', 'Smith', sysdate + 1)

select * from dual; -- INSERT ALL Requires Subquery to Get Data From.

select * from employees_history;