-- Substitution Variable: Placeholder in SQL Script to substitute value at Runtime.
-- It is not a feature of SQL itself, but a feature of development enviornments like SQL Developer or SQl Plus.

-- Employees from Hard-Coded Department ID:
select first_name, last_name, department_id from employees
where department_id = 30;

-- Employees from Department Provided at Runtime:
select first_name, last_name, department_id from employees
where department_id = &Department_Number;

-- For Date and Strings, Name of Substitue Variable must be in Quotes:
select first_name, last_name, salary from employees
where first_name = '&First_Name';

select employee_id, first_name, hire_date from employees
where hire_date between '&Beginning_Date' and '&Ending_Date';

-- Multiple Substtute Variables:
select first_name, last_name, &Column_Name from &Table_Name
where &Condition
order by &Order_By;