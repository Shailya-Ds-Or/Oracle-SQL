-- Arithmatic Operation:
select employee_id, salary, salary*12 as "Annual Salary" from employees;

select employee_id, salary, (salary+500)*12 as "Annual Salary after Increment" from employees;

-- Arithmatic Operation with Date Datatype (return DATE):
select sysdate from dual;
select sysdate+5 from dual;

select employee_id, hire_date from employees;

select employee_id, hire_date, hire_date + 5 from employees;

-- Arithmatic Operation with Null (Returns Null):
select * from employees;

select salary, commission_pct, salary * commission_pct from employees;