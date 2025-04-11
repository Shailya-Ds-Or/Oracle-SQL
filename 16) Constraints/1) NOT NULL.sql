desc jobs;

insert into jobs
values ( 100,
        null,
        1,
        10000); -- Cannot Insert NULL in Job Title Column.
        
insert into jobs
values (100,
        'My Job',
        1,
        1000);
        
select * from jobs;

rollback;

select * from jobs;

insert into jobs (job_id, min_salary, max_salary)
values (100,
        1,
        10000); -- Cannot Insert NULL in Job Title Column.
        
--------------------------------------------------------------------------------

create table managers (
                        manager_id number not null,
                        first_name varchar2(50),
                        last_name varchar2(50) constraint lname_not_null not null,
                        department_id number not null
                        );
                        
desc managers; -- Select Table Name and Press SHIFT + F$ to see Constraints.