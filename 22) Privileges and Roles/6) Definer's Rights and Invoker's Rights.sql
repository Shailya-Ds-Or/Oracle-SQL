create table temp_table (
                         temp_column varchar2(100)
                         ); -- HR
                         
drop table temp_table; -- TEMP_USER
create table temp_table (
                         temp_column varchar2(100)
                         ); -- TEMP_USER
                         
--------------------------------------------------------------------------------

grant create procedure, create view to temp_user; -- SYSTEM

create or replace procedure insert_into_temp_table (insert_value in varchar2) is
begin
    insert into temp_table values (insert_value);
end;  
/
-- TEMP_USER -- By Default, Sub-Programs (Functions, Procedures) are Created with Definer's Rights.

grant execute on insert_into_temp_table to hr; -- TEMP_USER

--------------------------------------------------------------------------------

insert into temp_user.temp_table
values ('User: HR ---> Direct Insert - Insert Privilege for Temp User''s Table: No'); -- HR
-- ERROR, Insufficient Privileges.

EXEC temp_user.insert_into_temp_table('User: HR --> Procedure: Definer''s Rights - INSERT Privilege for Temp_user''s table: No');
-- HR

commit; -- HR                                        

select * from temp_table; -- HR

select * from temp_user.temp_table; -- HR

select * from temp_table; -- TEMP_USER

--------------------------------------------------------------------------------
EXEC temp_user.insert_into_temp_table('User: TEMP_USER --> Procedure: Definer''s Rights'); 
-- TEMP_USER

select * from temp_table; -- TEMP_USER

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
/
CREATE OR REPLACE PROCEDURE insert_into_temp_table (insert_value IN VARCHAR2) AUTHID CURRENT_USER IS 
BEGIN
    INSERT INTO temp_table VALUES (insert_value);
END;
/
-- TEMP_USER -- Procedure With Invoker's Rights


EXEC temp_user.insert_into_temp_table('User: TEMP_USER --> Procedure: Invoker''s Rights');
/                                        
-- TEMP_USER

select * from temp_table; -- TEMP_USER

EXEC temp_user.insert_into_temp_table('User: HR --> Procedure: Invoker''s Rights - INSERT Privilege for Temp_user''s table: No'); 
/
-- HR

commit; -- HR

select * from temp_table; -- HR

select * from temp_table; -- TEMP_USER

drop table temp_table; -- HR

EXEC temp_user.insert_into_temp_table('User: HR --> Procedure: Invoker''s Rights - INSERT Privilege for Temp_user''s table: No'); 
/
-- HR -- Error.

--------------------------------------------------------------------------------

select object_name, object_type, status
from user_objects
where object_name = 'INSERT_INTO_TEMP_TABLE'; -- TEMP_USER

drop table temp_table; -- TEMP_USER

select object_name, object_type, status
from user_objects
where object_name = 'INSERT_INTO_TEMP_TABLE'; -- TEMP_USER

drop procedure insert_into_temp_table; -- TEMP_USER

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

create table temp_table2 (temp_column varchar2(100)); -- TEMP_USER

insert into temp_table2
values ('View Test: Temp Table in TEMP_USER'); -- TEMP_USER

CREATE OR REPLACE FUNCTION get_last_record_from_temp_table RETURN VARCHAR2 AUTHID CURRENT_USER IS
temp_text VARCHAR2(100);
BEGIN
    SELECT temp_column INTO temp_text FROM temp_table2 WHERE ROWNUM = 1;
    RETURN temp_text;
END;
/
-- TEMP_USER -- Function With Invoker's Rights

create or replace view temp_view bequeath definer as
    select get_last_record_from_temp_table temp_text from dual; -- TEMP_USER
-- View with Definer's Rights.    
grant select on temp_view to hr; -- TEMP_USER

select * from temp_user.temp_view; -- HR

select * from temp_user.temp_table2; -- HR -- Error

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW temp_view BEQUEATH CURRENT_USER AS
    SELECT get_last_record_from_temp_table temp_text FROM dual;
/
-- TEMP_USER,  View with Invoker's Rights.

select * from temp_user.temp_view; -- HR -- Error

drop view temp_view; -- TEMP_USER
drop function get_last_record_from_temp_table; -- TEMP_USER
drop table temp_table2; -- TEMP_USER
