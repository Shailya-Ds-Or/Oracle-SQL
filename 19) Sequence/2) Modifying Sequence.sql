alter sequence employee_seq
start with 10
increment by 5
maxvalue 99999
cache 30
nocycle; -- ORA-02283: cannot alter starting sequence number


alter sequence employee_seq
increment by 5
maxvalue 99999
cache 30
nocycle;

alter sequence employee_seq
increment by 4
nocycle;