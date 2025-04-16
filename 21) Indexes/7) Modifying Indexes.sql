/*
Structure of The Index Can Not be Altered Once it's Created.
i.e. We Can Not Chnage Index From Unique to Non-Unique and vice versa,
i.e. We Can Not Chnage Index from B-Tree (Normal) to Bitmap or vice versa.
*/

drop table employees_copy;

create table employees_copy as
    select * from employees;

alter table employees_copy
add primary key(employee_id);

select * from user_indexes
where table_name = 'EMPLOYEES_COPY';

--------------------------------------------------------------------------------
alter index SYS_C009224
rename to emp_cpy_eid_idx; -- Renaming an Index.

select * from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where employee_id = 104; -- F10

--------------------------------------------------------------------------------
alter index emp_cpy_eid_idx unusable; -- Making an Index Unusable.

select * from employees_copy
where employee_id = 104; -- F10

select index_name, status from user_indexes
where table_name = 'EMPLOYEES_COPY';

--------------------------------------------------------------------------------
alter index emp_cpy_eid_idx compile; -- To Make INVALID Index Valid Again.

select index_name, status from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where employee_id = 104; -- F10

--------------------------------------------------------------------------------
alter index emp_cpy_eid_idx rebuild; -- To REBUILD an Index / To Make UNUSABLE Index Usable Again.

select index_name, status from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where employee_id = 104; -- F10

--------------------------------------------------------------------------------

alter index emp_cpy_eid_idx disable; -- To DISABLE an Index. 
-- Error: Because We van Only Disable or Enable FUNCTION BASED INDEXES.

create index cemp_cpy_name_idx on employees_copy (upper(last_name), first_name);

select index_name, index_type, status, funcidx_status
from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where upper(last_name) = 'KING'; -- F10
           
alter index cemp_cpy_name_idx disable;                           

select index_name, index_type, status, funcidx_status
from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where upper(last_name) = 'KING'; -- F10
-- Error: ORA-30554: function-based index HR.CEMP_CPY_NAME_IDX is disabled

alter index cemp_cpy_name_idx enable;

select * from employees_copy
where upper(last_name) = 'KING'; -- F10

alter index cemp_cpy_name_idx invisible;

select index_name, index_type, status, funcidx_status, visibility
from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where upper(last_name) = 'KING'; -- F10

alter index cemp_cpy_name_idx visible;

select index_name, index_type, status, funcidx_status, visibility
from user_indexes
where table_name = 'EMPLOYEES_COPY';

select * from employees_copy
where upper(last_name) = 'KING'; -- F10