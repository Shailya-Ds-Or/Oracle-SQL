/*
TO_NUMBER(char, [Format Model]):
        Text to Number.
*/

select to_number('$5,322.45', '$99,999.99') "Formatted Number"
from dual;



/*
TO_DATE(Char, [Format Model]):
        Text to Date.
*/

select to_date('1-feb-1992', 'dd-mon-yyyy') from dual;