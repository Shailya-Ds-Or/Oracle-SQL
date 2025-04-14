drop table managers;
drop table employees_copy;

create table employees_copy(
                            employee_id number constraint emp_id_pk primary key,
                            first_name varchar2(50),
                            last_name varchar2(50),
                            department_id number
                            );
insert into employees_copy
    select employee_id, first_name, last_name, department_id
    from employees;
    
    
create table managers (
                        manager_id number constraint mgr_id_uk unique,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(100),
                        unique(email),
                        constraint mgr_emp_fk foreign key (manager_id) references employees_copy (employee_id)
                        );
                        
insert into managers
values (
        103,
        'John',
        'King',
        90,
        '123-456-789',
        'jking'
        );
        
insert into managers
values (
        104,
        'John2',
        'King',
        90,
        '123-456-780',
        'jking2'
        );

insert into managers
values (
        105,
        'John3',
        'King',
        90,
        '123-456-781',
        'jking3'
        );
        
delete from employees_copy
where employee_id = 103; --ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found

--------------------------------------------------------------------------------

drop table managers;

create table managers (
                        manager_id number constraint mgr_id_uk unique,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(100),
                        unique(email),
                        constraint mgr_emp_fk foreign key (manager_id) references 
                        employees_copy (employee_id) on delete set null
                        );
                        
insert into managers
values (
        103,
        'John',
        'King',
        90,
        '123-456-789',
        'jking'
        );
        
insert into managers
values (
        104,
        'John2',
        'King',
        90,
        '123-456-780',
        'jking2'
        );

insert into managers
values (
        105,
        'John3',
        'King',
        90,
        '123-456-781',
        'jking3'
        );
        
select * from managers;

delete from employees_copy
where employee_id = 103;

select * from employees_copy;
select * from managers;

rollback;
--------------------------------------------------------------------------------

drop table managers;

create table managers (
                        manager_id number constraint mgr_id_uk unique,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(100),
                        unique(email),
                        constraint mgr_emp_fk foreign key (manager_id) references 
                        employees_copy (employee_id) on delete cascade
                        );
                        
insert into managers
values (
        103,
        'John',
        'King',
        90,
        '123-456-789',
        'jking'
        );
        
insert into managers
values (
        104,
        'John2',
        'King',
        90,
        '123-456-780',
        'jking2'
        );

insert into managers
values (
        105,
        'John3',
        'King',
        90,
        '123-456-781',
        'jking3'
        );
        
select * from managers;
select * from employees_copy;

delete from employees_copy
where employee_id = 104;

select * from employees_copy;
select * from managers;

update employees_copy
set employee_id = 300
where employee_id = 105; --ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found