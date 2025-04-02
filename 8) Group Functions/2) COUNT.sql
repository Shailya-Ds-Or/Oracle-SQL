-- COUNT([DISTINCT | ALL] Expression):

select count(*), count(manager_id), count(all manager_id), count(distinct manager_id)
from employees;

select count(*), count(commission_pct), count(distinct commission_pct)
from employees;

select count(nvl(commission_pct, 0))
from employees;

select count(distinct commission_pct), count(distinct nvl(commission_pct, 0))
from employees;