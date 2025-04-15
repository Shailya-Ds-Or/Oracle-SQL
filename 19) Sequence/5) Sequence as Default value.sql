select employee_seq.currval from dual;

create table temp (
                    e_id number default employee_seq.nextval,
                    first_name varchar2(50)
                    );
                    
insert into temp(first_name)
values ('Alex');

select * from temp;

insert into temp(first_name)
values ('Alex');
                    
insert into temp(first_name)
values ('Alex');

insert into temp(first_name)
values ('Alex');

insert into temp(first_name)
values ('Alex');

select * from temp;

drop table temp;

create table temp (
                    e_id number default employee_seq.currval,
                    first_name varchar2(50)
                    );
                    
insert into temp(first_name)
values ('Alex');

insert into temp(first_name)
values ('Alex');

insert into temp(first_name)
values ('Alex');

select * from temp;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

select employee_seq.nextval from dual;

insert into temp(first_name)
values ('Alex');

select * from temp;

insert into temp(e_id, first_name)
values (null, 'Alex');

select * from temp;

drop table temp;