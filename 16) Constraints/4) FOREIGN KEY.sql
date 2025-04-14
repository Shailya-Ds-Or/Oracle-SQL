drop table employees_copy;

create table employees_copy (
                             employee_id number(6) constraint emp_id_pk primary key,
                             first_name varchar2(20),
                             last_name varchar2(20),
                             department_id number(4)
                             );
                             
insert into employees_copy
    select employee_id, first_name, last_name, department_id
    from employees;
    
select * from employees_copy;

create table managers (
                        manager_id number constraint mgr_id_pk primary key,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(11),
                        unique (email),
                        constraint mgr_emp_fk foreign key (manager_id) references employees_copy(employee_id)
                        );

insert into managers
values (
        80,
        'John',
        'King',
        90,
        '123-456-789',
        'jking'
        ); -- ORA-02291: integrity constraint (HR.MGR_EMP_FK) violated - parent key not found
        
insert into managers
values (
        100,
        'John',
        'King',
        90,
        '123-456-789',
        'jking'
        );
        
update managers
set manager_id = 70
where manager_id = 100; -- ORA-02291: integrity constraint (HR.MGR_EMP_FK) violated - parent key not found

select * from managers;

delete from employees_copy
where employee_id = 100; -- ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found

update employees_copy
set employee_id = 90
where employee_id = 100; -- ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found

update managers
set manager_id = 101
where manager_id = 100;

delete from employees_copy
where employee_id = 100;

drop table managers;

--------------------------------------------------------------------------------
create table managers (
                        manager_id number constraint mgr_id_uk unique,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(11),
                        unique (email),
                        constraint mgr_emp_fk foreign key (manager_id) references employees_copy(employee_id)
                        );

insert into managers
values (
        103,
        'John',
        'King',
        90,
        '123-456-789',
        'jking');
        
update managers
set manager_id = null; -- UNIQUE KEY Column Can have Null Values.

drop table managers;

--------------------------------------------------------------------------------

drop table employees_copy;

create table employees_copy (
                             employee_id number(6) constraint emp_id_pk primary key,
                             first_name varchar2(50),
                             last_name varchar2(50),
                             department_id number(4),
                             constraint emp_names_comp_uk unique(first_name, last_name)
                             );

create table managers (
                        manager_id number constraint mgr_id_uk unique,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(100),
                        unique(email),
                        constraint mgr_emp_fk foreign key (first_name, last_name) references employees_copy(first_name, last_name)
                        );