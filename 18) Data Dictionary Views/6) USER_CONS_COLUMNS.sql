select * from user_cons_columns;

select *  from user_cons_columns
where table_name = 'EMPLOYEES';

select a.*, b.constraint_type, b.r_constraint_name from
user_cons_columns a join user_constraints b
on (a.table_name = b.table_name)
and (a.constraint_name = b.constraint_name)
order by a.table_name, a.constraint_name;
--where a.table_name = 'EMPLOYEES';

select * from all_cons_columns;

select * from dba_cons_columns; -- Connect as SYS User
