-- Non-Pairwise Comparision- Each Column is Compared with Different Subquery:

select employee_id, first_name, last_name, department_id, salary
from employees
where department_id in (select department_id
                        from employees
                        where employee_id in (103,105,110))
and salary in (select salary
                from employees
                where employee_id in (103,105,110));
                
-- Pairwise Comparision- A Subquery Returning Multiple Columns is Called
--                       Pairwise Comparision Subquery.
select employee_id, first_name, last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, salary
                                    from employees
                                    where employee_id in (103,105,110));
                            
-- Employees Who Earn Highest Salary in Their Respective Departments:

select employee_id, first_name, last_name, department_id, salary
from employees
where department_id in (select department_id from employees)
and salary in (select max(salary)
                from employees
                group by (department_id)); -- Non- Pairwise Comparision

select employee_id, first_name, last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                    from employees
                                    group by department_id); -- Pairwise Comparision, Correct Result.
                                    
-- Finding Employees Who have Reached Max Slary Limit of Their respective Job Id:
select employee_id, first_name, last_name, job_id, salary
from employees
where (job_id, salary) in (select job_id, max_salary
                            from jobs);