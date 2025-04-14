/*
Oracle will not Show Comments about Dictionary Views to Most Users,
especially Users with connections from Pluggable Database.

We will Create a second SYS connections Using
Name : sys-cdb
User name: sys
Connection Type: Basic
Host Name: localhost
Port Name: 1521
Service Name: orcl

 Connect as This User to See All Data Dictionary Views Names in Dictionary View and All The Comments.
*/

select * from dictionary;

select * from dict;

select * from dict
where table_name = 'USER_CONSTRAINTS';

select * from dict
where upper(comments) like '%CONSTRAINT%'