create table jobs_copy as
select * from jobs;

select * from jobs_copy;

--
insert into jobs_copy (job_id, job_title, min_salary, max_salary)
values ('GR_LDR', 'Group Leader',8500, 20000);
select * from jobs_copy;
--

insert into jobs_copy (job_id, job_title, min_salary, max_salary)
values ('PR_MGR', 'Project Manager', 7000, 18000);
select * from jobs_copy;
--

insert into jobs_copy (job_title, min_salary, job_id, max_salary)
values ('Architect', 6500, 'ARCH', 18000); -- Different Column Order Than in The Table.
select * from jobs_copy;
--

insert into jobs_copy
values ('DATA_ENG', 'Data Engineer', 8000, 21000); -- Without Specifying Column Names.
select * from jobs_copy;
--

insert into jobs_copy (job_id, job_title, min_salary)
values ('DATA_ARCH', 'Data Architecture', 8000); -- Without Specifying All The Columns.
select * from jobs_copy;
--

alter table jobs_copy
modify max_salary default 10000;
insert into jobs_copy (job_id, job_title, min_salary)
values ('DATA_ARCH2', 'Data Architecture2', 8000);
select * from jobs_copy;
--

-- Using NULL for Inserting Values without Specifying Columns:
insert into jobs_copy
values ('DATA_ARCH3', 'Data Architecture3', 8000, null);
select * from jobs_copy;

-- Using Single Row Functions in Insert:
insert into jobs_copy
values (upper('data_arch4'), initcap('data architecture4'), 8000, null);
select * from jobs_copy;

-- INSERT INTO SELECT: Inserting Data into Table from Another Table using Query.
select * from employees_copy;
drop table employees_copy;

create table employees_copy as
select * from employees
where 1 = 2;
select * from employees_copy;

insert into employees_copy
select * from employees;
select* from employees_copy;

insert into employees_copy (first_name, last_name, email, hire_date, job_id)
select first_name, last_name, email, hire_date, job_id from employees
where job_id = 'IT_PROG';
select * from employees_copy;

insert into employee_addresses
select employee_id, first_name, last_name, city || '-' || street_address Address
from employees join departments
using (department_id)
join locations
using (location_id); -- Error as we Don't have Employee_Addresses Table Yet.

create table employee_addresses as
select employee_id, first_name, last_name, city || '-' || street_address Address
from employees join departments
using (department_id)
join locations
using (location_id)
where 1 = 2; -- Creating Emploee_Addresses Empty Table with Desired Structure and Columns.

select * from employee_addresses;

insert into employee_addresses
select employee_id, first_name, last_name, city || '-' || street_address Address
from employees join departments
using (department_id)
join locations
using (location_id);

select * from employee_addresses;