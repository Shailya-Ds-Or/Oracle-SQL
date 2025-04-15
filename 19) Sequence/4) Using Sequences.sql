create sequence employee_seq
start with 100
increment by 3
maxvalue 99999
cache 30
nocycle;

select employee_seq.currval from dual; -- ORA-08002: sequence EMPLOYEE_SEQ.CURRVAL is not yet defined in this session

select employee_seq.nextval from dual;

select employee_seq.currval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.currval from dual;

--------------------------------------------------------------------------------

-- Disconnect From HR User and Connect Again to Restart The Session.

select employee_seq.currval from dual; -- ORA-08002: sequence EMPLOYEE_SEQ.CURRVAL is not yet defined in this session

select employee_seq.nextval from dual;

select employee_seq.currval from dual;

--------------------------------------------------------------------------------

insert into employees (employee_id, last_name, email, hire_date, job_id)
values (
        employee_seq.nextval,
        'Smith',
        'SMITH5',
        sysdate,
        'IT_PROG'); -- ORA-00001: unique constraint (HR.EMP_EMP_ID_PK) violated
        
select employee_seq.currval from dual;

select * from employees
where employee_id = 118;

select employee_seq.nextval from employees; -- Next Value for Sequence Gets Executed for Number of 
                                            -- Times of Rows Employees Table has.
                                            
select employee_seq.currval from dual;

insert into employees (employee_id, last_name, email, hire_date, job_id)
values (
        employee_seq.nextval,
        'Smith',
        'SMITH5',
        sysdate,
        'IT_PROG');
        
select * from employees;

rollback;

select * from employees;