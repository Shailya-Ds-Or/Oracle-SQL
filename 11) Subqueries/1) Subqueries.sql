-- Finding Employees Whose Salary is MOre Than Employee Named John (Employee Id = 145):
select salary from employees
where employee_id = 145;

select employee_id, first_name, last_name
from employees where salary > 14000; -- Wrong Way.

select employee_id,first_name, last_name
from employees
where salary > (select salary from employees
                where employee_id = 145); -- Correct Way.
                
-- Finding Employees from Same Department as Employee Named Douglas (First Name):
select department_id, first_name, last_name
from employees
where department_id = (select department_id
                        from employees
                        where first_name = 'Douglas');