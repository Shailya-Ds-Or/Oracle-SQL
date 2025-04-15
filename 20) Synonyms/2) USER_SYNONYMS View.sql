desc user_synonyms;

select * from user_synonyms;

create synonym emps
for employees;

select * from user_synonyms;

select * from all_synonyms;

select * from user_synonyms; -- Connect With SYSTEM User.

select * from dba_synonyms; -- Connect with SYS or SYSTEM User.

drop synonym emps;

select * from user_synonyms;