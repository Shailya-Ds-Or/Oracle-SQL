-- DECODE (Particular to ORACLE SQL, not in other SQLs):
select decode(1,1,'One',2,'Two') from dual;
select decode(3,1,'One',2,'Two',3,'Three') from dual;
select decode(50,1,'One',2,'Two',3,'Three','Not Found') from dual;


select first_name, last_name, job_id, salary,
decode(job_id, 
    'ST_CLERK', salary * 1.2, 
    'SA_REP', salary * 1.3, 
    'IT_PROG', salary * 1.5, 
    salary) as "Updated Salary"
from employees;
        