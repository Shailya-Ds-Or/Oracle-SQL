select * from employees;
select * from departments;

-- Natural Join:
-- Employees Table and Departments Table have Department_ID and Manager_ID Columns in common:
select * from employees natural join departments;

select * from departments natural join employees;

select first_name, salary, department_name 
from employees natural join departments;



