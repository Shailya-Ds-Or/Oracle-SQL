drop table managers;

create table managers(
                      manager_id number constraint mgr_id_uk unique,
                      first_name varchar2(50),
                      last_name varchar2(50),
                      department_id number not null,
                      phone_number varchar2(11) unique not null,
                      email varchar2(100),
                      unique (email),
                      constraint mgr_composite_uk unique (first_name, last_name, department_id)
                      );

insert into managers
values (100,
        'Alex',
        'Brown',
        80,
        '123-456-789',
        'abrown');
select * from managers;

insert into managers
values (100,
        'Alex',
        'Brown',
        80,
        '123-456-789',
        'abrown'); -- UNIQUE Manager ID Constraint Violated.

insert into managers
values (101,
        'Alex',
        'Brown',
        80,
        '123-456-789',
        'abrown'); -- UNIQUE Phone Number Constraint Violated.
        
insert into managers
values (101,
        'Alex',
        'Brown',
        80,
        '123-456-780',
        'abrown'); -- UNIQUE Email Constraint Violated.
        
insert into managers
values (101,
        'Alex',
        'Brown',
        80,
        '123-456-780',
        'abrown2'); -- Composite Key UNIQUE Constraint Violated.
        
insert into managers
values (101,
        'Alex',
        'Brown',
        90,
        '123-456-780',
        'abrown2');
select * from managers;

insert into managers
values ( null,
         null,
         null,
         90,
         '123-456-000',
         null);
select * from managers;

insert into managers
values ( null,
         null,
         null,
         90,
         '123-456-001',
         null); -- Composite Key UNIQUE Constraint Violated.

insert into managers
values ( null,
         null,
         null,
         100,
         '123-456-002',
         null);
select * from managers;

update managers
set department_id = 90
where manager_id = 100; -- Composite Key UNIQUE Constraint Violated.