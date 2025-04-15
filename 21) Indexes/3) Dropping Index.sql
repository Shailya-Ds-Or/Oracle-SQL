drop index emp_cpy_comm_idx;

drop index emp_cpy_eid_idx online; -- To allow DML Operations while Index is being Dropped.