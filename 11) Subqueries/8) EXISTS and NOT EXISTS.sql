-- EXIST Operator: To check Existence of Rows in the Subquery and Match The 
--                 Records between Subquery and Main Query.

-- Finding Employees Who are Managers:
select employee_id, first_name, last_name, department_id
from employees a
where exists (select null
                from employees
                where manager_id = a.employee_id);
                
-- NOT EXISTS: To test weather a Value in the Main Query Does Not Exist in
--             The Subquery.

-- Departments That have No Employees:

select department_id, department_name
from departments d
where not exists (select null
                    from employees
                    where department_id = d.department_id);