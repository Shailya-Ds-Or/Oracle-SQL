select * from employees_copy;

-- Deleting All The Rows of a Table:
delete from employees_copy;
select * from employees_copy; -- Rollback After This.

-- Deleting Specific Rows From a Table:
delete from employees_copy
where job_id= 'IT_PROG';
select * from employees_copy; -- Rollback After this.

-- Deleting Rows Based on Subquery:
delete from employees_copy
where department_id in (
                        select department_id
                        from departments
                        where upper(department_name) like '%SALES%');
                        
select * from employees_copy; -- Rollback After This.