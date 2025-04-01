select * from employees;

-- SUBSTR(String, Strat_Position, [Length]):
select first_name, substr(first_name, 1, 3) from employees;

select first_name, substr(first_name, 3, 3) from employees;

select first_name, substr(first_name, 3) from employees;

-- LENGTH(String):
select first_name, length(first_name) from employees;

-- CONCAT(String1, String2):
select concat(first_name, last_name) as full_name from employees;

select concat(concat(first_name, ' '), last_name) from employees;


-- INSTR(String, Substring, [Position, Occurence]):
select instr('Shailya', 'i')from dual;

select instr('Shailya', 'z') from dual;

select instr('I am learning how to use Functions in oracle SQL', 'o', 2) from dual;

select instr('I am learning how to use Functions in oracle SQL', 'o', 1, 2) from dual;

select instr('I am learning how to use Functions in oracle SQL', 'o', 10, 3) from dual;

select instr('I am learning how to use Functions in oracle SQL', 'o', -1, 1) from dual;

select instr('I am learning how to use Functions in oracle SQL', 'in', 1,1) from dual;

select instr('I am learning how to use Functions in oracle SQL', 'in', -1,1) from dual;

select first_name, instr(first_name, 'a') from  employees;