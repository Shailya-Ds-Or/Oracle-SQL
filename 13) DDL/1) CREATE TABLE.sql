create table hr.my_employees(
    employee_id number(3) not null,
    first_name varchar2(50) default 'No Name',
    last_name varchar2(50),
    hire_date date default sysdate not null
);

select * from my_employees;

info my_employees;