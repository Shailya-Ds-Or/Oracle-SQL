-- ADD_MONTHS(Date, n):
select sysdate, add_months(sysdate, 5) from dual;

select sysdate, add_months(sysdate, -2) from dual;

select sysdate, add_months(sysdate, 15) from dual;

-- MONTHS_BETWEEN(Date1, Date2)

select hire_date, months_between(hire_date, sysdate) as "Months Worked" from employees;

-- ROUND(Date, [Format]):
-- TRUNC(Date, [format]):
select employee_id, hire_date,
        trunc(hire_date, 'MONTH') as "Truncated Result",
        round(hire_date, 'MONTH') as "Rounded Result"
from employees;

select employee_id, hire_date,
        trunc(hire_date, 'YEAR') as "Truncated Result",
        round(hire_date, 'YEAR') as "Rounded Result"
from employees;

-- EXTRACT(Date_Component from Date):
select sysdate, extract(month from sysdate) from dual;
select sysdate, extract(day from sysdate) from dual;
select sysdate, extract(year from sysdate) from dual;

-- NEXT_DAY(Date, Day of Week):
select next_day(sysdate, 'sunday') from dual;

-- LAST_DAY(Date):
select last_day(sysdate) from dual;