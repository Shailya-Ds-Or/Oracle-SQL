select * from employees join departments using (department_id);

select first_name, last_name, department_id, manager_id
from employees join departments using (department_id);
/*
Because Manager_Id exists in both tables and we are not using it for join, this query returns
Columns Ambiguously Defined Error
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
*Cause:    
*Action:
Error at Line: 3 Column: 46
*/

-- Using Table name Aliases for Avoiding above Error:
select first_name, last_name, department_id, e.manager_id
from employees e join departments d
using (department_id); -- This Query shows Manager ID of the Employee in the given Row.

select first_name, last_name, department_id, d.manager_id
from employees e join departments d
using (department_id); -- This Query shows Manager ID of The Department in The Given Row.

-- Best Practice - Using Table Aliases before all The Columns in Select except The Column which is 
-- used in USING Clause.
select e.first_name, e.last_name, department_id, e.manager_id
from employees e join departments d
using (department_id);


