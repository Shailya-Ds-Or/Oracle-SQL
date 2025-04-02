-- MAX(Expression):

select max(salary) from employees;

select max(hire_date) from employees;

select max(first_name) from employees;


-- MIN(Expression):

select min(salary) from employees;

select min(hire_date) from employees;

select min(first_name) from employees;

select min(commission_pct), min(nvl(commission_pct, 0))
from employees;


-- SUM([ALL | DISTINCT] Expression):

select sum(salary), sum(all salary), sum(distinct salary)
from employees;