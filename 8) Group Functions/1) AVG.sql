-- AVG([DISTINCT | ALL] Expression):

select avg(salary), avg(all salary), avg(distinct salary)
from employees;

select round(avg(salary),2), round(avg(all salary),2), round(avg(distinct salary),2)
from employees;

select round(avg(salary),2), round(avg(distinct salary),2)
from employees
where job_id = 'IT_PROG';

select commission_pct from employees;
select avg(commission_pct) from employees;
select avg(nvl(commission_pct,0)) from employees;