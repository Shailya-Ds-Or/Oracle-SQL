-- Employees Who Work in Same Department as John (Emloyee Id = 145):

select department_id
from employees
where employee_id = 145;

select department_id, first_name, last_name
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 145);
                        
-- Employees Who Work in Same Department as John (Emloyee Id = 145) and Earns less than him:

select department_id, first_name, last_name
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 145)
and salary < (select salary
                from employees
                where employee_id = 145);
                
-- Employee That was Hired First:
select min(hire_date)
from employees;

select employee_id, first_name,last_name, hire_date
from employees
where hire_date = (select min(hire_date)
                    from employees);
                    
-- Most Recently Hired Employee:
select employee_id, first_name, last_name, hire_date
from employees
where hire_date = (select max(hire_date)
                    from employees);
                    
                    
-- Single Row Subquery Should Return only One Row:
select max(hire_date)
from employees
group by (department_id);

select employee_id, first_name, last_name, hire_date
from employees
where hire_date = (select max(hire_date)
                    from employees
                    group by department_id); -- Error
                    
-- If Subquery Returns Null, The Whole Query will Return Nothing:
select department_id
from employees
where employee_id = 178;

select * from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 178);