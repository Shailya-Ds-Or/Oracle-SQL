drop table employees_copy;

create table employees_copy as
    select * from employees;
    
--------------------------------------------------------------------------------

create index emp_cpy_dpt_id_idx on employees_copy(department_id);

create index emp_cpy_dpt_id_idx2 on employees_copy(department_id) invisible; -- ORA-01408: such column list already indexed

create bitmap index emp_cpy_dpt_id_idx2 on employees_copy(department_id);  -- ORA-01408: such column list already indexed

create bitmap index emp_cpy_dpt_id_idx2 on employees_copy(department_id) invisible;

select * from employees_copy
where department_id = 20; -- F10

select /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_dpt_id_idx2) */*
from employees_copy
where department_id = 20; -- F10

drop index emp_cpy_dpt_id_idx2;

alter index emp_cpy_dpt_id_idx invisible;

select * from employees_copy
where department_id = 20; -- F10

select /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_dpt_id_idx) */*
from employees_copy
where department_id = 20; -- F10

--------------------------------------------------------------------------------

create unique index emp_cpy_empid_idx on employees_copy(employee_id) invisible;

select * from employees_copy
where employee_id = 103; -- F10

select /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_empid_idx) */*
from employees_copy
where employee_id = 103; -- F10

alter session set optimizer_use_invisible_indexes = TRUE; -- To make oracle Server Use Invisible Indexes
                                                          -- Whenever Possible in current Session.
                                                          
select * from employees_copy
where employee_id = 103; -- F10