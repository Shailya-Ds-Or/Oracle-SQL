-- CASE Conditional Statement:

 -- Simple CASE Expression:
 select first_name, last_name, job_id, salary,
    case job_id
        when 'ST_CLERK' then salary * 1.2
        when 'SA_REP' then salary * 1.3
        when 'IT_PROG' then salary * 1.4
        else salary 
    end "Updated Salary"
from employees;

-- Searched Case Expression:
select first_name, last_name, job_id, salary,
    case
        when job_id = 'ST_CLERK' then salary * 1.2
        when job_id = 'SA_REP' then salary * 1.3
        when job_id = 'IT_PROG' then salary * 1.4
        when last_name = 'King' then salary * 2
        else salary
    end "Updated Salary"
from employees;

-- CASE Expression in WHERE Clause:
select first_name, last_name, job_id, salary
from employees
where (case
            when job_id = 'IT_PROG' and salary > 5000 then 1
            when job_id = 'SA_MAN' and salary > 10000 then 1
            else 0
        end) = 1;