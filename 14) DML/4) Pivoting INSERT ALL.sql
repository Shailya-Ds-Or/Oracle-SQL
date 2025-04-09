-- Creating PIVOT Table of Sales by Employees on Each Week Day:

create table emp_sales (
                        employee_id number(6),
                        week_id number(2),
                        sales_mon number,
                        sales_tue number,
                        sales_wed number,
                        sales_thu number,
                        sales_fri number
                        );
select * from emp_sales;

-- Creating Normalized Table of Sales by Employees on Each Week Day:

create table emp_sales_normalized (
                                    employee_id number(6),
                                    week_id number(2),
                                    sales number,
                                    day varchar2(3)
                                    );
select * from emp_sales_normalized;

-- Inserting Data into Pivot Table:
insert all
    into emp_sales values (105,23,2500,3200,4700,5600,2900)
    into emp_sales values (106,24,2740,3060,4920,5650,2800)
select * from dual;
select * from emp_sales;

-- Inserting Data From Pivot Table to Normalized Table:
insert all
    into emp_sales_normalized values (employee_id, week_id, sales_mon, 'MON')
    into emp_sales_normalized values (employee_id, week_id, sales_tue, 'TUE')
    into emp_sales_normalized values (employee_id, week_id, sales_wed, 'WED')
    into emp_sales_normalized values (employee_id, week_id, sales_thu, 'THU')
    into emp_sales_normalized values (employee_id, week_id, sales_fri, 'FRI')
select * from emp_sales;

select * from emp_sales_normalized;
select * from emp_sales;