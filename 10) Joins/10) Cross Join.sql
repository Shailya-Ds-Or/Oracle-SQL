select first_name, last_name, department_name
from employees cross join departments;

select first_name, last_name, department_name, job_title
from employees cross join departments
cross join jobs;

select * from employees, departments; -- OLD Oracle SQL Syntax for Cross Join.

--------------------------------------------------------------------------------
-- Getting Total Number of Employees in Each Department and Each Job Title:

select * from employees;
select * from departments;
select * from jobs;

select d.department_name, j.job_title, count(*) as "Number of Employees"
from employees e join departments d
on (e.department_id = d.department_id)
join jobs j
on (e.job_id = j.job_id)
group by d.department_name, j.job_title
order by d.department_name, j.job_title;
 -- This is Correct Query but it will not show All The combinations of Department Names and
 -- Ob Titles, Only those in which atleast one employee exists.
 
 
select temp.department_name, temp.job_title, count(*) as "Number of Employees"
from
    (select d.department_id, d.department_name, j.job_id, j.job_title
        from departments d cross join jobs j) temp
left join employees e
on (e.department_id = temp.department_id and e.job_id = temp.job_id)
group by temp.department_name, temp.job_title
order by temp.department_name, temp.job_title;
-- This will Return Employee count as Atleast One for All Combinations as It is Counting Rows from subquery.

select temp.department_name, temp.job_title, count(e.employee_id) as "Number of Employees"
from
    (select d.department_name, d.department_id, j.job_id, j.job_title
        from departments d cross join jobs j) temp
left join employees e
on (e.department_id= temp. department_id and e.job_id = temp.job_id)
group by department_name, job_title
order by department_name, job_title;