-- SET VERIFY ON/OFF: To display Old and New Values of substitute variable while running the script:

set verify on;

select employee_id, first_name, last_name from employees
where employee_id = &emp_id;


set verify off;


-- SET DEFINE OFF: To Stop SQL Developer from storing substitute variables:
set define off;
select * from departments where department_name= 'R&D';
set define on;