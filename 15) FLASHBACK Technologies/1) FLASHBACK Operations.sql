select * from recyclebin;

select * from employees_copy;

delete from employees_copy
where salary > 5000;

commit;

select * from employees_copy;

rollback;

select * from employees_copy;

alter table employees_copy enable row movement; -- Needed to Pefrorm FLASHBACK.

flashback table employees_copy to timestamp sysdate - 5 / 1440;

select * from employees_copy; -- Order of The Rows Will Be Changed.

--------------------------------------------------------------------------------

select dbms_flashback.get_system_change_number as scn from dual; -- Have to Connect as SYS or SYSTEM User
                                                                 -- As HR USer don't have the Privilages
                                                                 -- Reqired to Perform This Operation.
                                                                 
-- Connect Back To HR User.
delete from employees_copy
where salary > 5000;

commit;

flashback table employees_copy to scn 11766054;

select * from employees_copy;

delete from employees_copy
where salary > 5000;

commit;

insert into employees_copy
select * from employees;

commit;

update employees_copy
set salary = 10000;

commit;

select * from employees_copy;

flashback table employees_copy
to scn 11766054;

select * from employees_copy;

--------------------------------------------------------------------------------
select ora_rowscn, first_name from employees_copy;

update employees_copy
set first_name = 'Farah'
where first_name = 'Sarah';

commit;

select ora_rowscn, first_name from employees_copy;

flashback table employees_copy
to scn 11766054;

select ora_rowscn, first_name from employees_copy;

--------------------------------------------------------------------------------

drop table employees_copy;

flashback table employees_copy
to scn 11766054; -- Won't Work As The Table is Dropped.

select * from recyclebin
order by droptime;

select * from "BIN$75sVn/kXQQO+QjSKc6uFBw==$0";

flashback table employees_copy
to before drop;

select * from employees_copy;

--------------------------------------------------------------------------------

create restore point rp_test;-- Have to Connect as SYS or SYSTEM User
                             -- As HR USer don't have the Privilages
                             -- Reqired to Perform This Operation.
                             
flashback table hr.employees_copy
to restore point rp_test;

-- Connect Back to HR User

select * from employees_copy;