create user temp_user
identified by 123;

drop user temp_user;

create user temp_user
identified by 123
password expire
account unlock
container = all; -- ORA-65050: Common DDLs only allowed in root. / Can Not Use Container = ALL when
                 -- we are connected to a Pluggable Database.

create user temp_user
identified by 123
password expire
account unlock
container = current;

drop user temp_user cascade; -- To drop All The Objects Belonging to User.

create user temp_user
identified by 123
password expire
account unlock
container = current;

select * from dba_users;

grant create session to temp_user;

select * from dba_users;