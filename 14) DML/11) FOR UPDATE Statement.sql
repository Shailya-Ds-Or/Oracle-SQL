select * from employees_copy
where job_id = 'IT_PROG' for update;

-- Connect with SYSTEM or SYS User and Try to Query and Then Update Same Rows.

rollback;

--------------------------------------

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update;

-- Even Though The Query Contains Columns only From Employees_Copy table,
-- Associated Rows From Departments Table is also Locked. 

rollback;
--------------------------------------

-- Locking Only Some of The Rows in a Join By Specifying Columns:
select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, last_name;

rollback;

---------------------------------------

-- NOWAIT / WAIT Sec Option:

-- Update Employee_id 104's Salary from SYSTEM or SYS User.

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, location_id nowait;


select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, location_id wait 5;

------------------------------------------

-- SKIP LOCKED Option:

-- Update Employee_id 104's Salary from SYSTEM or SYS User.

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, location_id skip locked;