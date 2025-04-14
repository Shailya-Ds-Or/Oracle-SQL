drop table departments_copy;

create table departments_copy as
select * from departments;

alter table departments_copy
add constraint dept_cpy_id_pk primary key (department_id) deferrable initially deferred; 

select * from departments_copy;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        ); -- Insert is Allowed Even when Table Already has Department With ID 10.

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        );
        
commit; -- ORA-02091: transaction rolled back
        -- ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated

--------------------------------------------------------------------------------

set constraint DEPT_CPY_ID_PK immediate;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        ); -- ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated
        
commit;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        );
        
insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        );
        
commit; -- ORA-02091: transaction rolled back
        -- ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated
        
--------------------------------------------------------------------------------

set constraint all immediate;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        ); --ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated
        
--------------------------------------------------------------------------------

alter session set constraints = immediate;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        ); -- ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated

commit;

insert into departments_copy
values (10,
        'Temp',
        200,
        1700
        ); -- ORA-00001: unique constraint (HR.DEPT_CPY_ID_PK) violated
        
--------------------------------------------------------------------------------

alter table departments_copy
drop constraint DEPT_CPY_ID_PK;

alter table departments_copy
add constraint DEPT_CPY_ID_PK primary key (department_id) not deferrable;

set constraint DEPT_CPY_ID_PK immediate; -- ORA-02447: cannot defer a constraint that is not deferrable