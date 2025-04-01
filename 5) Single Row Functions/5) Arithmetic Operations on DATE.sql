select * from employees;

-- SYSDATE: Current date and time of OS where the Database is Installed
select sysdate from dual;

-- CURRENT_DATE: Date and Time of OS from where the USer's Session is Logged in From
select current_date from dual;

-- SESSIONTIMEZONE: Time Zone of User's Session
select sessiontimezone from dual;

-- SYSTIMESTAMP: Date and Time with Timezone of OS where Database is Installed
select systimestamp from dual;

-- CURRENT_TIMESTAMP: Date and Time of OS from where USer is Logged in from
select current_timestamp from dual;

select sysdate, current_date, sessiontimezone, systimestamp, current_timestamp from dual;


-- Arithmetic Operations on DATE:
select sysdate, sysdate + 4 from dual;

select sysdate,sysdate - 4 from dual;

select sysdate, sysdate + 1/24 from dual; -- Adding An Hour to Date

select sysdate, sysdate + 1/(24 * 60) from dual; -- Adding a Minute to Date

------

select employee_id, hire_date, sysdate from employees;

select employee_id, hire_date, sysdate - hire_date as "Days Worked" from employees;

select hire_date, trunc(sysdate - hire_date) as "Days Worked" from employees;

select hire_date, trunc((sysdate - hire_date) / 365) as "Years Worked" from employees;

select hire_date, trunc((sysdate - hire_date) / 365) as "Years Worked" from employees
order by "Years Worked" desc;