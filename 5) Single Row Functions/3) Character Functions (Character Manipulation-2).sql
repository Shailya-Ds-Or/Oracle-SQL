-- TRIM([[LEADING | TRAILING | BOTH] trim_characters FROM] String):

select trim('       I am Batman      ') as "Trimmed Text" from dual;

select trim(' ' from '      I am Batman      ') as "Trimmed Text" from dual;

select trim(both ' ' from '      I am Batman    ') as "Trimmed Text" from dual;

select trim(leading ' ' from '      I am Batman     ') as "Trimmed Text" from dual;

select trim(trailing ' ' from '     I am Batman     ') as "Trimmed Text" from dual;

select trim(leading 'I' from 'I am Batman') as "Trimmed Text" from dual;

select trim(leading 'I' from 'IIIIIIIIIIIIIII am Batman') as "Trimmed Text" from dual;

select trim(trailing 'n' from 'I am Batman') as "Trimmed Text" from dual;

select trim(trailing 'n' from 'I am Batmannnnnnnnnn') as "Trimmed Text" from dual;


/* 
RTRIM(String, [Trim_String]):
LTRIM(String, [Trim_String]):
*/
select rtrim('       I am Batman     ') as "Trimmed Text" from dual;
select ltrim('       I am Batman     ') as "Trimmed_Text" from dual;

select ltrim('my name is batman', 'my') as "Trimmed Text" from dual;

select ltrim(rtrim('www.Websiteurl.com', '.com'), 'www.') as Website_Name from dual; -- Won't Work if first letter of website name is 'w' instead of 'W'


-------------------------------------------------------------------------------

-- REPLACE(String, String_To_Replace, [Replacement-String]):
select first_name, replace(first_name, 'a') as New from employees;

select first_name, replace(first_name, 'a', 'A') as New from employees;

select first_name, replace(first_name, 'le', '-') as New from employees;

select first_name, replace(first_name, 'und', '-') as New from employees;

/*
LPAD(String, target_length, Padding_Expression)
RPAD(String, target_length, Padding_Expression)
*/

select first_name, lpad(first_name, 10, '*') as New from employees;

select first_name, rpad(first_name, 10, '*') as New from employees;

select first_name, lpad(first_name, 6, '-') as New from employees;

select first_name, rpad(first_name, 6, '-') as New from employees;

select rpad('My name is ' || last_name, 20, '-') as Intro from employees; 