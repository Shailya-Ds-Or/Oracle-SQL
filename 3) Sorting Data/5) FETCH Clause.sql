/* FETCH: Used in Conjuction with Select and ORDER BY Clauses to Limit The Number of Rows Retrieved by an Query.
    - OFFSET: Specifies Number of Rows to Skip before Row Limiting Starts. (Optional, default value is 0)
    - ROW | ROWS: Both of Them Can Be Used based on theReturning Rown in Order to Increase Semantic Clarity.
    - FETCH: Specifies Number of Rows or Percentage of Rows to return.
    - FIRST | NEXT: Samr thing, can be used Interchangeably.
    - row_count | percent PERCENT: row_count to specify number of rows to return, PERCENT specifiespercentage of total number of selected rows to return.
    - ONLY | WITH TIES: ONLY is used to exactly the specified number of rows or percentage of rows.
                        WITH TIES returns extra rows with the same value as last row fetched. ORDER BY must be used with WITH TIES option, or no extra rows will be fetched.
                        
*/

select first_name, last_name, salary from employees
order by salary desc;

-- Selecting first 10 highest salaries except the CEO (Steven King):
select first_name, last_name, salary from employees
order by salary desc
offset 1 row
fetch first 10 rows with ties;

-- Just offsetting first 5 rows:
select first_name, last_name, salary from employees
order by salary desc
offset 5 rows;

-- Fetching first 10 rows without offset:
select first_name, last_name, salary from employees
order by salary desc
fetch next 10 rows only;

