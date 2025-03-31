/* Operator Precedence:

1. Arithmetic Operators
2. Concatenation Operator
3. Comparision Conditions
4. is [not] null, like, [not] in
5. [not] between
6. !=
7. NOT Logical Operator
8. AND Logical Operator
9. OR Logical Operator.

*/

--
select first_name, last_name, job_id, salary from employees
where job_id = 'IT_PROG' or job_id = 'ST_CLERK' and salary > 5000;

select first_name, last_name, job_id, salary from employees
where (job_id = 'IT_PROG' or job_id = 'ST_CLERK') and salary > 5000;

--
select first_name, last_name, department_id, salary from employees
where salary > 10000 and department_id = 20 or department_id = 30;

select first_name, last_name, department_id, salary from employees
where salary > 10000 and (department_id = 20 or department_id = 30);
