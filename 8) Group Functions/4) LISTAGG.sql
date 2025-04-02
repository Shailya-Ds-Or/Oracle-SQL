-- LISTAGG(Column_Name, ] Delimiter]) WITHIN GROUP(ORDER BY sort_expression):

select listagg(salary, ',') from employees;

select listagg(first_name, ',') within group (order by first_name) as Employees
from employees
where job_id = 'ST_CLERK';

select listagg(first_name, ',') within group (order by first_name desc) as Employees
from employees
where job_id = 'ST_CLERK';

select listagg(distinct salary, ',') within group (order by salary) as Salaries
from employees;

select * from locations;
select listagg(city, ',') within group (order by city) as City
from locations
where country_id = 'US';