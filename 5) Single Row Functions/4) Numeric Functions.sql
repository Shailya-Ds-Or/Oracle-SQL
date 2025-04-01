-- ROUND(Number, [Decimal]):
select round(12.12345) from dual;

select round(12.12345, 2) from dual;

select round(12.12345, 4) from dual;

select round(12.5) from dual;

select round(12.56, -1) from dual;

select round(1234.67, -2) from dual;


-- TRUNC(Number, [Decimal]):
select trunc(12.12345) from dual;

select trunc(12.5) from dual;

select trunc(12.37, 1) from dual;

select trunc(1234.567, -1) from dual;

select trunc(1234.567, -2) from dual;

-- CEIL(Number);
select ceil(1.23) from dual;

select ceil(2.99) from dual;

select ceil(2.000001) from dual;

select ceil(12) from dual;

select ceil(-2.45) from dual;

-- FLOOR(Number):
select floor(1.23) from dual;

select floor(2.99) from dual;

select floor(2.999999) from dual;

select floor(12) from dual;

select floor(-2.45) from dual;

-- MOD(Number, Divisor):
select mod(10, 3) from dual;

select mod(20, 2) from dual;

select mod(-10,-3) from dual;