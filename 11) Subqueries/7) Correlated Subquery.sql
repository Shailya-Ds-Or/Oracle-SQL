-- Correlated Subquery : When a Subquery references to the columns from the
--                       Parent Query, it is called Correlated Subquery.

-- Employees who Earn Highest in Their Respective Departments:

select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
                
/*
Above Query is Same as This One:

select employee_id, first_name, last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                    from employees
                                    group by department_id);

*/

-- Employees who Earn Less than Average Salary of their Department:
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary < (select avg(salary)
                from employees b
                where b.department_id = a.department_id);
                
/*
Above Query is Same as This One:

select a.employee_id, a.first_name, a.last_name, a.department_id, a.salary
from employees a join ( select avg(salary) as "AVG", department_id
                        from employees
                        group by department_id) b
on (a.department_id = b.department_id)
where a.salary < b.AVG;

*/

-- Employees with Average Salary of Their Departments:
select employee_id, first_name, last_name, department_name, salary,
        (select round(avg(salary),2)
        from employees b
        where b.department_id = e.department_id) "Dept_Avge_Salary"
from employees e join departments d
on (e.department_id = d.department_id);