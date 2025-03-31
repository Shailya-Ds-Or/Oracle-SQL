-- Logical Operators:

-- AND Operator:
select first_name, last_name, job_id, salary from employees
where job_id = 'SA_REP' and salary > 10000;

select first_name, last_name, job_id, salary from employees
where job_id = 'SA_REP' and salary > 10000 and first_name like 'L%';

-- OR Operator:
select first_name, last_name, job_id, salary from employees
where job_id = 'SA_REP' or salary > 10000;

select first_name, last_name, job_id, salary from employees
where job_id = 'SA_REP' or salary > 10000 or last_name like 'A%';

-- NOT Operator:
select * from employees
where salary > 10000 and job_id in ('SA_MAN', 'SA_REP');

select * from employees
where salary > 10000 and job_id not in ('SA_MAN', 'SA_REP');