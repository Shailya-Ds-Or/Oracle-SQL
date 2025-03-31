-- ORDER BY Clause:
select first_name, last_name, salary from employees;

-- By First Name:
select first_name, last_name, salary from employees order by first_name;

-- By Last Name:
select first_name, last_name, salary from employees order by last_name;

-- Using Column Name Alias in  Order By:
select first_name, last_name, salary, (10 * (salary/5) + 3000) - 100 as New_Salary from employees order by New_salary;

-- Using Numeric Position of Column from Select List in Order By:
select first_name, last_name, salary from employees order by 1;
select first_name, last_name, salary from employees order by 2;

-- Using Numeric Position of Column from Table:
/* Not Recommended as Column Orders in Table can change by Inerting New Columns or Deleting Columns*/
select * from employees order by 1;
select * from employees order by 5;
select * from employees order by 11;

-- With Multiple Columns:
select first_name, last_name, salary from employees order by first_name, last_name;

select department_id, first_name, salary from employees order by department_id, first_name;