/* ORDER BY with Compound Queries: ORDER BY is used only once at the end of the 
    Compound Query and it Sorts the Whole Result Set, Not Just Last Query.
                                 
    ORDER BY Recognises Columns and Aliases from First Query Only.
    
    If There are Just Two Queries in SET Operation, We have to use alias in the 
    First Query (We can Use it in Last Query too, But its optional.)
    
    If there are more than One SET Operation and We want to Use Column Alias,
    We have to USe it in All The Queries except last one Mandatorily (Using
    Alias in Last Query is Optional).
    
    By Default, Compound Queries are Sorted by First Column of First Query in 
    Ascending Order.
*/
select first_name, last_name, salary, department_id
from employees
union
select first_name, last_name, salary, department_id
from retired_employees;

select first_name, last_name, salary, department_id
from employees
union
select first_name, last_name, salary, department_id
from retired_employees
order by salary;

select first_name, last_name, salary, department_id
from employees
order by salary
union
select first_name, last_name, salary, department_id
from retired_employees; -- ERROR

select first_name, last_name, salary, department_id
from employees
union all
select first_name, last_name, salary, department_id
from employees
where department_id = 30
union
select first_name, last_name, salary, department_id
from retired_employees
order by salary;

select first_name, last_name, salary s, department_id
from employees
union all
select first_name, last_name, salary s, department_id
from employees
where department_id = 30
union
select first_name, last_name, salary, department_id
from retired_employees
order by s;