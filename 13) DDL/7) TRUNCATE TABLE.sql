select * from employees_copy;
truncate table employees_copy;
select * from employees_copy;
drop table employees_copy;
select * from employees_copy;

create table emp_performance_test as
select e1.first_name, e1.last_name, e1.department_id, e1.salary
from employees e1 cross join employees e2 cross join employees e3;

select count(*) from emp_performance_test;
delete from emp_performance_test;
select count(*) from emp_performance_test; -- use rooback Button above to Get All The Rows Back.
truncate table emp_performance_test;
select count(*) from emp_performance_test;
drop table emp_performance_test;
select * from emp_performance_test;
