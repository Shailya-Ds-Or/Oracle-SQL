create table employees_copy as
select * from employees;

select * from employees;

comment on column employees_copy.job_id is 'Stores Abbreviation of Job Titles.';
comment on table employees_copy is 'Copy of Employees Table.';

-- Comments can not be directly dropped. Instead we can add Empty String as a Comment.
comment on column employees_copy.hire_date is 'TheDate when Employee Started the Job';
comment on column employees_copy.hire_date is '';

-- To View Comments:
select * from user_tab_comments; -- Table Comment

select * from user_tab_comments
where table_name = 'EMPLOYEES_COPY';

select * from user_col_comments; -- Column Comments.

info employees_copy;

