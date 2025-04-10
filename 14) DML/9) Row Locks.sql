select * from employees_copy;

update employees_copy
set salary = salary + 500
where employee_id = 102;

select employee_id, first_name, last_name, salary
from employees_copy
where employee_id = 102;

-- Run above SELECT Statement as SYSTEM or SYS
-- User.

-- Without Performing COMMIT or Rollback by HR User, Try to
-- Update the Same Row by SYS or SYSTEM User.

-- Session of SYS or System USer will Wait Untill HR User
-- Performs either Commit or Rollback to Release The Row from Lock.

commit;

select employee_id, first_name, last_name, salary
from employees_copy
where employee_id = 102;