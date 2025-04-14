create VIEW emp_cx_vw (dname, min_sale, max_sale) as
    select distinct upper(department_name), min(salary), max(salary)
    from employees e join departments d
    using (department_id)
    group by department_name;
    
select * from emp_cx_vw;
