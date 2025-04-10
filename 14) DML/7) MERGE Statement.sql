select * from employees_copy;
delete from employees_copy;
select * from employees_copy;

insert into employees_copy
    select * from employees where job_id = 'SA_REP';
select * from employees_copy;

update employees_copy
set first_name = 'Alex';
select * from employees_copy;

merge into employees_copy c
using (select * from employees) e
on (c.employee_id = e.employee_id)
    when matched then
        update set
            c.first_name = e.first_name,
            c.last_name = e.last_name,
            c.salary = e.salary
        delete where department_id is null
    when not matched then
        insert values(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                      e.hire_date, e.job_id, e.salary,e.commission_pct, e.manager_id,
                      e.department_id);

select * from employees_copy;

--------------------------------------------------------------------------------

update employees_copy 
set first_name = 'Alex';
select * from employees_copy;

merge into employees_copy c
using (select * from employees
        where job_id = 'IT_PROG') e
on (c.employee_id = e.employee_id)
    when matched then
        update set
            c.first_name = e.first_name,
            c.last_name = e.last_name,
            c.salary = e.salary
        delete where department_id is null
    when not matched then
        insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                       e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id,
                       e.department_id);
                       
select * from employees_copy;

-- Run First Merge Query Again to Update all The Rows again and Match Them to Employees Table.




