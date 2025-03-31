/* ACCEPT and PROMPT:
        - Accept: Takes input from User and Stores it in a Variable.
        - Prompt: Used to Display a meaningful message to the User while asking for Variable value.
*/
accept emp_id prompt ' Please Enter a Valid Employee ID:'

select employee_id, first_name, last_name, salary from employees
where employee_id = &emp_id;

undefine emp_id;

--
accept min_salary prompt 'Please Provide MINIMUM Salary';
accept max_salary prompt 'Please Provide MAXIMUM Salary';

select first_name, last_name, salary from employees
where salary between &min_salary and &max_salary;

undef min_salary, max_salary;