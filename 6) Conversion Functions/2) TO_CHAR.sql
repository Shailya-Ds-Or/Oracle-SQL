/*
TO-CHAR( Number | Date, [format model], [nls_parameter]):
        Number or Date to VARCHAR2 Data Type.
*/

-- TO_CHAR for DATES------------------------------------------------------------

-- Year:
select first_name, hire_date, to_char(hire_date, 'yyyy') as "Year of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'year') as "Year of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'yy') as "Year of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'rr') as "Year of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'yyyy') as "Year of Hire"
from employees;

-- Month:
select first_name, hire_date, to_char(hire_date, 'mm') as "Month of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'month') as "Month of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'MONTH') as "Month of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'MON') as "Month of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'Mon') as "Month of Hire"
from employees;

select first_name hire_date, to_char(hire_date, 'MM-yyyy') as "Extracted Date"
from employees;

-- Day:
select first_name, hire_date, to_char(hire_date, 'dd') as "Day of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'day') as "Day of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'Day') as "Day of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'dy') as "Day of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'Dy') as "Day of Hire"
from employees;

select first_name, hire_date, to_char(hire_date, 'dd-mon-yyyy') as "New"
from employees;

-- HOUR:
select first_name, hire_date, to_char(hire_date, 'hh') as "New"
from employees;

select first_name, hire_date, to_char(hire_date, 'hh12') as "New"
from employees;

select first_name, hire_date, to_char(hire_date, 'hh24') as "New"
from employees;

-- MINUTES:
select first_name, hire_date, to_char(hire_date, 'mi') as "New"
from employees;

-- SECONDS:
select first_name, hire_date, to_char(hire_date, 'ss') as "New"
from employees;

select first_name, hire_date, to_char(hire_date, 'hh24:mi:ss') as "Time of Hire"
from employees;

-- TH:
select first_name, hire_date, to_char(hire_date, 'DDTH-MMTH-yyyy') as "Date"
from employees;

-- SP:
select first_name, hire_date, to_char(hire_date, 'DDSP-MMSP-yyyy') as "Date"
from employees;

-- SPTH and THSP:
select first_name, hire_date, to_char(hire_date, 'DDSPTH-MMTHSP-yyyy') as "Date"
from employees;


-- TO_CHAR for NUMBERS----------------------------------------------------------

select salary, salary * commission_pct * 100 as "Original",
        to_char(salary * commission_pct * 100, '$999,999.00') as "Formatted Version"
from employees
where commission_pct is not null;

select salary, salary * commission_pct * 100 as "Original",
        to_char(salary * commission_pct * 100, 'L999,999.00') as "Formatted Version"
from employees
where commission_pct is not null;