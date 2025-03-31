-- ASC and DESC with Order By:
select employee_id, first_name, last_name, salary from employees
order by first_name;

select employee_id, first_name, last_name, salary from employees
order by first_name desc;

-- Order By on Multiple Columns with Individual Column Orders:
select employee_id, first_name, last_name, salary from employees
order by first_name desc, last_name asc;

select employee_id, first_name, last_name, salary from employees
order by first_name desc, last_name desc;

select first_name, department_id, salary from employees
order by first_name desc, department_id desc;

-- Using Aliases with ASC and DESC:
select first_name, last_name, salary s from employees
order by s desc;

-- NULL Values are displayed last in ASCENDING Order:
select first_name, salary, commission_pct from employees;

select first_name, salary, commission_pct from employees
order by commission_pct;

select first_name, salary, commission_pct from employees
order by commission_pct desc;
