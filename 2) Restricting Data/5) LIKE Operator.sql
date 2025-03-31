-- LIKE Operator:

/* Wildcard Operators:
% Matches with any number of characters including 0 or more characters.
_ Matches exactly One Character.
*/

-- using LIKE instead of =:
select * from employees
where job_id = 'SA_REP';

select * from employees
where job_id like 'SA_REP';

-- Job IDs starting with 'SA':
select * from employees
where job_id like 'SA%';

-- First Names Starting with 'A':
select * from employees
where first_name like 'A%';

-- First Names ending with 'a':
select * from employees
where first_name like '%a';

-- First Names having "a" anywhere:
select * from employees
where first_name like '%a%';

-- First names having "r" as a second character:
select * from employees
where first_name like '_r%';