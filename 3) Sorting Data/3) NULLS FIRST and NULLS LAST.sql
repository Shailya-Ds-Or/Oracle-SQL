-- NULLS FIRST or NULLS LAST are used to change order of NULL Values in ORDER BY Clause:
select first_name, salary, commission_pct from employees
order by commission_pct;

select first_name, salary, commission_pct from employees
order by commission_pct nulls first;

select first_name, salary, commission_pct from employees
order by commission_pct asc nulls first;

select first_name, salary, commission_pct from employees
order by commission_pct desc nulls first;

select first_name, salary, commission_pct from employees
order by commission_pct desc nulls last;