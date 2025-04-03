select * from employees;

select worker.first_name, worker.employee_id, worker.manager_id,
    manager.employee_id, manager.first_name, manager.last_name
from employees worker join employees manager
on(worker.manager_id = manager.employee_id);

select worker.first_name || ' ' || worker.last_name as "Employee Name",
        manager.first_name || ' ' || manager.last_name as "Manager Name"
from employees worker join employees manager
on (worker.manager_id = manager.employee_id);