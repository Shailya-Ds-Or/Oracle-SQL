/* 
ROWID: Unique Identifier which contains Physical Address of a Row.
        - Generated Automatically at The Time of Row Insertion.
        - Identifies where a Row Resides on a Disk.
        - Contains Disk Number, Cylinder Number, Block, Block Offset etc.
        - Fastest Way to Access a Single Row.
        - Permanent for Each Row.
        - Is changed for a Row when Row is Dropped from Database and Inserted Again.
        
ROWNUM: Consecutive Logical Sequence Number Given to Rows Fetched from The Table by An Query.
        - To limit The Rows Returned by An Query, ROWNUM Pseudo Column can be Used.
        - Its Temporary, changed by Query to Query.

*/

select employee_id, first_name, last_name, salary, rowid, rownum from employees;

select employee_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 60;

-- Limiting Rows Fetched using ROWNUM:
select employee_id, first_name, last_name, salary from employees
where department_id = 80;

select employee_id, first_name, last_name, salary from employees
where department_id = 80 and
rownum <= 15;

-- Selecting Top 5 Earners from Department ID 80 Using ROWNUM:

/* This one's wrong as Query first select first 5 rows of department id 80 and then sorts them */
select first_name, last_name, department_id, salary from employees
where department_id= 80 and
rownum <= 5
order by salary desc;

/* Correct Way */
select * from (
        select first_name, last_name, department_id, salary from employees
        where department_id = 80
        order by salary desc)
where rownum <= 5;

-- Using ROWID to Search for Row:
/* Using ROWID to search for Rows is the Fastest way as we provide exact address of the Row on Disk in Query. */
select * from employees
where ROWID = 'AAARzEAAEAAAIxLAAB';
