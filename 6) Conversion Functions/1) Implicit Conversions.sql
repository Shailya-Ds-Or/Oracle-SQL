-- VARCHAR2 to Number:
select * from employees where salary > '5000';

-- VARCHAR2 to DATE:
select * from employees where hire_date = '17-jun-03';

-- NUMBER to VARCHAR2:
select department_id || department_name from departments;

-- DATE to VARCHAR2:
select first_name || sysdate from employees;