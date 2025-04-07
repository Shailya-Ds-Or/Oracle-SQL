select *
from (select department_id, department_name, state_province, city
        from departments join locations
        using (location_id)
        order by department_id);
        

select e.employee_id, e.first_name, e.last_name, e.salary, b.department_name, b.state_province, b.city
from employees e join (select department_id, department_name, state_province, city
                        from departments join locations
                        using (location_id)) b
using (department_id);