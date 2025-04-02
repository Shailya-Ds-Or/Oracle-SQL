/* ORDER of EXECUTION in Oracle:
- FROM Statement,- Choose and Join Tables to get Base Data. 
- WHERE Clause - Filters the Base Data.
- GROUP BY Clause - Aggregates the Base Data.
- HAVING Clause - Filters the Aggregated Data.
- SELECT Statement - Returns the Final Data.
- ORDER BY Clause - Sorts the Final Data.
*/


-- GROUP BY Clause:
select job_id, avg(salary)
from employees
group by job_id
order by avg(salary) desc;

select job_id, department_id, manager_id, avg(salary), count(*)
from employees
group by job_id, department_id, manager_id
order by count(*) desc;

select department_id, job_id, sum(salary), max(salary), min(salary), round(avg(salary),2), count(*)
from employees
group by department_id, job_id
order by department_id nulls first;

select department_id, job_id, round(avg(salary),2) as "Average Salary", count(*) as "Number of Employees"
from employees
where job_id in ('SA_MAN', 'ST_MAN', 'MK_MAN')
group by department_id, job_id
order by avg(salary);

--------------------------------------------------------------------------------
-- GROUP BY with HAVING Clause:

/*
Selecting Jobs That Have Average Salaries more than 10000:
*/
select job_id, round(avg(salary),2)
from employees
where avg(salary) > 10000
group by job_id;  -- Wrong Way

select job_id, round(avg(salary),2)
from employees
group by job_id
having avg(salary) > 10000;

select department_id
from employees
group by department_id
having count(first_name) > 10;


-- Nested GROUP Functions:

select max(avg(salary))
from employees
group by department_id;

select min(avg(salary)), max(avg(salary))
from employees
group by job_id;