-- Scalar Subquery: Subquery that returns only One Column for One Row.

select sysdate from dual;

select (select sysdate from dual) from dual;

-- Employees who Earn More than Average Salary of All Employees:
select avg(salary) from employees;

select first_name, last_name, job_id, salary
from employees
where salary > (select avg(salary) from employees);

-- Employees who work in Same Department as Employee Luis:
select department_id from employees
where first_name = 'Luis';

select *
from employees
where department_id = (select department_id
                        from employees
                        where first_name = 'Luis');
                        
--
select employee_id, first_name, last_name, (case
                                            when location_id = (select location_id from locations 
                                                                where postal_code = '99236')
                                            then 'San Francisco'
                                            else 'Other'
                                            end) City
from employees natural join departments;                                            

                                            