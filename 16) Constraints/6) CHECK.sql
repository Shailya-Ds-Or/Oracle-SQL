create table managers2 (
                        manager_id number,
                        first_name varchar2(50),
                        salary number,
                        constraint slary_check check (salary > 100 and salary < 50000)
                        );
                        
insert into managers2
values (
        1,
        'Steven',
        50
        ); -- ORA-02290: check constraint (HR.SLARY_CHECK) violated
        
insert into managers2
values (
        1,
        'Steven',
        2500
        );
        
update managers2
set salary = 20
where manager_id = 1; -- ORA-02290: check constraint (HR.SLARY_CHECK) violated

drop table managers2;

--------------------------------------------------------------------------------

create table managers2 (
                        manager_id number,
                        first_name varchar2(50),
                        salary number,
                        email varchar2(100),
                        constraint demo_check check (salary > 100 and salary < 50000
                                                    and upper(email) like '%.COM')
                        );
                        
insert into managers2
values (
        1,
        'Steven',
        3000,
        'sking'
        ); -- ORA-02290: check constraint (HR.DEMO_CHECK) violated
        
insert into managers2
values (
        1,
        'Steven',
        3000,
        'sking@gmail.com'
        );
        
drop table managers2;