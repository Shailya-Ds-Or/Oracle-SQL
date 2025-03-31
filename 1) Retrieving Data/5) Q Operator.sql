-- Dual:
select * from dual;

-- To display a string:
select 'I am Batman' from dual;

-- Using Quote "q" Operator:
select q'[I am Batman]' as "Quote Operator" from dual;

select q'[I'm Batman]' as "Quote Operator" from Dual;

-- Using < instead of [ with Quote Operator:
select q'<I'm Batman>' as "Quote Operator" from dual;

-- Multiple Strings:
select q'*I'm Batman*' as "Name", q'[Gotham]' as "Address" from Dual; 