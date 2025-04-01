/*
NVL(EXP1, EXP2):
    Replaces NULL value with meaningful replacement.
*/

select employee_id, salary, commission_pct, salary + (salary * nvl(commission_pct, 0)) as "New Salary"
from employees;

--------------------------------------------------------------------------------
/*
NVL2(EXP1, EXP2, EXP3):
    Returns EXP2 if EXP1 is not NUll,
    Returns EXP3 if EXP1 is NULL.
*/

select first_name, salary, nvl2(commission_pct, 'has', 'does not have') as "Commission"
from employees;

--------------------------------------------------------------------------------
/*
NULLIF(EXP1, EXP2):
    Returns NULL if EXP1 and EXP2 are Equal.
    Returns EXP1 if EXP1 and EXP2 are not Equal.
*/
select first_name, last_name,
length(first_name) Len1,
length(last_name) Len2,
nullif(length(first_name), length(last_name))
from employees;

-- Checking Employees whose First Name and Last Name has Same Length:
select first_name, last_name
from employees
where nullif(length(first_name), length(last_name)) is null;

--------------------------------------------------------------------------------
/*
COALESCE(EXP1, EXP2, EXP3, ...... EXPN):
    Returns first non null value from list of expressions.
*/
select coalesce(null, null, null, 1, 2, 3, null) from dual;

select coalesce(null, null, null, null) from dual;

select * from locations;

select state_province, city, coalesce(state_province, city) from locations;