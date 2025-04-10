select * from employees_copy;

select * from jobs;

drop table jobs_copy;

create table jobs_copy as
select * from jobs;

select * from jobs_copy;

delete from employees_copy
where job_id = 'IT_PROG';
savepoint A;

update employees_copy
set salary = 1.2 * salary;
savepoint B;

insert into jobs_copy
values ('PY_DEV', 'Python Developer', 12000, 20000);
savepoint C;

delete from employees_copy
where job_id = 'SA_REP';
savepoint D;

select * from employees_copy;
select * from jobs_copy;

rollback to B;

select * from employees_copy;
select * from jobs_copy;

rollback to C; -- Error.

rollback to A;

select * from employees_copy;

-- Execute DMLs With Savepoints B, C and D Again.

select * from employees_copy;
select * from jobs_copy;

rollback;

select * from employees_copy;
select * from jobs_copy;

rollback to A; -- Error.