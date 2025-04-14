drop table managers;
drop table employees_copy;

create table employees_copy
as select * from employees;

alter table employees_copy
add constraint emp_cpy_email_uk unique(email);

alter table employees_copy
add constraint emp_cpy_names_uk unique(first_name, last_name);

alter table employees_copy
add unique(phone_number);

alter table employees_copy
add check (salary >= 10000);
/*
ORA-02293: cannot validate (HR.) - check constraint violated
02293. 00000 - "cannot validate (%s.%s) - check constraint violated"
*Cause:    an alter table operation tried to validate a check constraint to
           populated table that had nocomplying values.
*/

alter table employees_copy
add check (salary >= 1000);

alter table employees_copy
add constraint emp_cpy_emp_id_pk primary key (employee_id);

alter table employees_copy
add constraint emp_cpy_dept_fk foreign key (department_id) references departments(department_id);

alter table employees_copy
modify salary constraint emp_cpy_salary_nn not null; -- To Add Not Null Constraint, We have to use MODIFY
                                                     -- Instead of ADD with ALTER TABLE.
                                                     
alter table employees_copy
modify first_name not null;