drop sequence employee_seq;

-- Any Sequence can be dropped Even if it is being USed for Primary Key or Default Value for a column
-- etc. We will get and error next time we try to Insert a Row if Sequence does not Exist.