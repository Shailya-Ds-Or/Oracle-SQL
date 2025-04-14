select * from employees_copy;

create table managers (
                        manager_id number constraint mgr_id_pk primary key,
                        first_name varchar2(50),
                        last_name varchar2(50),
                        department_id number not null,
                        phone_number varchar2(11) unique not null,
                        email varchar2(100),
                        unique(email),
                        constraint mgr_emp_fk foreign key (manager_id) 
                                              references employees_copy(employee_id)
                      );
                      
alter table employees_copy
drop constraint EMP_CPY_EMP_ID_PK; -- ORA-02273: this unique/primary key is referenced by some foreign keys

alter table employees_copy
drop constraint EMP_CPY_EMP_ID_PK cascade;

alter table employees_copy
drop constraint SYS_C009097 online; -- To allow DML opertaions on Table while Constraint is Being Dropped.

-- Can Not USE CASCADE and ONLINE Together while Dropping Constraints.