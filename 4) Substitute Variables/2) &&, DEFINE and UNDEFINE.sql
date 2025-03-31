-- Using Same Substitute Variable Multiple Times in Same Query:
-- && Allows to use same substitute variable multiple times in same query and also in different queries.

select employee_id, first_name, last_name, salary from employees
where salary between &sal and &sal + 1000;

-- Adding && in front of First Appearance of Variable:
select employee_id, first_name, last_name, salary from employees
where salary between &&sal and &sal + 1000;

select employee_id, first_name, last_name, &&Column_Name from employees
order by &Column_Name;

select employee_id, first_name, &Column_name from employees;

/* DEFINE and UNDEFINE:
 DEFINE and UNDEFINE allows us to explicitely define and delete user variables.
 */
 
 define emp_num = 100;
 
 select * from employees
 where employee_id = &emp_num;
 
 undefine emp_num;
 
 -- Checking all User Variables
 define;
 define column_name;
 
