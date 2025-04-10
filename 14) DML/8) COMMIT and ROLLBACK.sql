select * from employees_copy;

--------------------------------------------------------------------------------
delete from employees_copy
where job_id = 'SA_REP';

select * from employees_copy;

rollback;

select * from employees_copy;

--------------------------------------------------------------------------------

delete from employees_copy
where job_id = 'SA_REP';

update employees_copy
set first_name = 'John';

select * from employees_copy;

rollback;

select * from employees_copy;

--------------------------------------------------------------------------------

select * from employees_copy;

delete from employees_copy
where job_id = 'SA_REP';

update employees_copy
set first_name = 'John';

select * from employees_copy;

commit;

select * from employees_copy;

rollback;

select * from employees_copy;

-- Connect With SYS or SYSTEM User and Check if The changes Are Visible There.
--------------------------------------------------------------------------------

update employees_copy c
set first_name = ( select first_name 
                    from employees e
                    where e.employee_id = c.employee_id);
                    
select * from employees_copy;

insert into employees_copy
select * from employees
where job_id = 'SA_REP';

select * from employees_copy;

commit;

--------------------------------------------------------------------------------

delete from employees_copy
where job_id = 'SA_REP';

create table temp (
                    tmp date
                    );
-- ANY DDL or DCL Statement Implicily Commits Current Transaction.                    

insert into employees_copy
select * from employees
where job_id = 'SA_REP';

drop table temp;