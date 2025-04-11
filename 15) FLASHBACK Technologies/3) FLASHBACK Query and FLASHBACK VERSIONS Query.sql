-- FLASHBACK Query:

select * from employees_copy;

select dbms_flashback.get_system_change_number from dual; -- Change to SYS or SYSTEM User.

-- 11769815

update employees_copy
set salary = 18000
where employee_id =100;

select * from employees_copy;

commit;

select * from employees_copy
as of timestamp sysdate - 3/1440
where employee_id = 100;

select * from employees_copy
as of scn 11769815
where employee_id = 100;

--------------------------------------------------------------------------------

-- FLASHBACK VERSIONS Query:

select * from employees_copy;

update employees_copy
set salary = 15000
where employee_id = 100;

commit;

update employees_copy
set salary = 10000
where employee_id = 100;

commit;

select versions_starttime, versions_endtime, versions_startscn, versions_endscn, 
        versions_operation, versions_xid, employees_copy.*
from employees_copy
versions between scn minvalue and maxvalue
where employee_id = 100;

select versions_starttime, versions_endtime, versions_startscn, versions_endscn,
        versions_operation, versions_xid, employees_copy.*
from employees_copy
versions between timestamp (sysdate - interval '5' minute) and sysdate
where employee_id = 100;