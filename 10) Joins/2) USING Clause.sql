-- If common Columns in Tables have different data types, we can specify which columns(s) to use for join
-- using USING clause.

select * from employees natural join departments;

select * from employees join departments using (department_id);

select * from employees join departments using (department_id, manager_id); -- Same as Natural Join