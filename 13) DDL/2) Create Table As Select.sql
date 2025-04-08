select * from employees;

select * from employees
where 1=2;

-- Copy of Employees table:
create table employees_copy
as select * from employees;

select * from employees;
select * from employees_copy;

-- Copy of Employees Table without its Data (Blank Copy)
create table employees_copy2
as select * from employees
where 1=2;

select * from employees_copy2;

-- Creating Table with Specific Data from Employees:
create table employees_copy3
as select * from employees
where job_id = 'IT_PROG';

select * from employees_copy3;

-- Creatting Table with Specific Columns from Employees;
create table employees_copy4
as select first_name, last_name, salary
from employees;

select * from employees_copy4;

-- Using Column Aliases to Change Column Names in New Table:
create table employees_copy5
as select first_name f_name, last_name l_name, salary sal
from employees;

select * from employees_copy5;

-- Defining Column Names in Create Table:
create table employees_copy6 (name, surname, annual_salary)
as select first_name, last_name, salary * 12
from employees;

select * from employees_copy6;

/*
Note: While Creating a Table from Select Query, only NOY NULL Constraints
      Are Inherited from Original Table.
*/

info employees;
info employees_copy;