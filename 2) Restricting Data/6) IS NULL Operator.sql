-- IS NULL Operator:

-- IS NULL is not same as = NULL:
select * from employees
where manager_id = null;

select * from employees
where manager_id is null;

-- Employees with no Commisiion:
select * from employees
where commission_pct is null;

-- Employees with Commission:
select * from employees
where commission_pct is not null;