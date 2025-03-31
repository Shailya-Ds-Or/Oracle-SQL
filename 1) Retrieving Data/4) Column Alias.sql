-- Without Using as:
select first_name Name, last_name Surname, salary KharchaPaani from employees;

-- Using as for more readability:
select first_name as Name, last_name as Surname, salary as kharchapaani from employees;

-- Quotes to use Spaces, Special Characters, Case Sensitive Coolumn Aliases:
select first_name as "N@ * me", last_name as "Sur_N@me", salary as "Kharcha_Paani" from employees;