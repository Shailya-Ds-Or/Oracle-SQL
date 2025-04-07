-- IN Operator for Multiple Row Subqueries:

select first_name, last_name, department_id, salary
from employees
where salary in (10000, 15000, 14000);

-- Employees with Least Salary in Each Department:
/* This Query will result in wrong Data as The Inner Subquery does return lowest
salary from each department but the Outer Query compares salary with list of salaries from
Inner Query, regardless of which Department they belong to.
*/

select min(salary)
from employees
group by department_id;

select employee_id, first_name, last_name, department_id, salary
from employees
where salary in (select min(salary)
                    from employees
                    group by department_id); -- See Above Comment.

--------------------------------------------------------------------------------

-- Any Operator:
/*
< ANY: Less Than The Maximum.
= ANY: Equal to one of the element (Same as IN Operator).
> ANY: More than The Minimum.
*/

-- Employees Earning More Than At Least One Sales Manager:
select salary
from employees
where job_id = 'SA_MAN';

select employee_id, first_name, last_name, salary
from employees
where salary > any (select salary
                from employees
                where job_id = 'SA_MAN');
                
-- Employees Earning Less Than At least One Sales Manager:  
select employee_id, first_name, last_name, salary
from employees
where salary < any (select salary
                from employees
                where job_id = 'SA_MAN');

-- Employees earning Same as Any One Sales Manager:                
select employee_id, first_name, last_name, salary
from employees
where salary = any (select salary
                from employees
                where job_id = 'SA_MAN'); -- Same as IN.
                
--------------------------------------------------------------------------------
-- ALL Operator:
/*
< ALL: Less Than The Minimum.
= ANY: Means Nothing if Subquery returns MOre Than One Row.
> ALL: More than The Maximum.
*/

-- Employees who Earn More Than All Sales Managers:
select employee_id, first_name, last_name, salary
from employees
where salary > all (select salary
                    from employees
                    where job_id = 'SA_MAN');
                    
-- Employees who Earn Less Than All The Sales Managers:
select employee_id, first_name, last_name, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id = 'SA_MAN');

--------------------------------------------------------------------------------                    
-- Employees who Work in UK:
select * from employees;
select * from departments;
select * from locations;
select * from countries;

select e.employee_id, e.first_name, e.last_name, e.department_id, l.country_id,
        c.country_name
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id)
join countries c
on(l.country_id = c.country_id)
where c.country_name = 'United Kingdom'; -- Using Joins

-- Using Subqueries:
select employee_id, first_name, last_name, department_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id in (select location_id
                                                from locations
                                                where country_id in (select country_id
                                                                    from countries
                                                                    where country_name = 'United Kingdom')));                                                    