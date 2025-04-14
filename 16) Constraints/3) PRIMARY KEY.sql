create table directors (
                        director_id number constraint dir_id_pk primary key,
                        first_name varchar2(50),
                        last_name varchar2(50)
                        );
                        
create table executives (
                          executive_id number,
                          first_name varchar2(50),
                          last_name varchar2(50),
                          constraint exe_id_pk primary key (executive_id, last_name)
                          );
                          
insert into directors
values (
        100,
        'John',
        'Goodman'
        );
        
insert into directors
values (
        100,
        'Xxx',
        'Yyy'
        ); -- ORA-00001: unique constraint (HR.DIR_ID_PK) violated
        
insert into directors
values (
        null,
        'Qqq',
        'Www'
        ); -- SQL Error: ORA-01400: cannot insert NULL into ("HR"."DIRECTORS"."DIRECTOR_ID")
        
insert into executives
values (
        100,
        'John',
        null
        ); -- SQL Error: ORA-01400: cannot insert NULL into ("HR"."EXECUTIVES"."LAST_NAME")
        
drop table managers;
drop table executives;
                          
                        