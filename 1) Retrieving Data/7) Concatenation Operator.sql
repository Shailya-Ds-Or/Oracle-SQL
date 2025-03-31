-- Using Concatenation Operator:
select 'My name is ' || first_name from employees;

select first_name || ' ' || last_name as "Name" from employees;

-- Concatenation with Null:
select 'Commission Percentage is ' || commission_pct from employees;

-- Full Address:
desc locations;
select street_address || ' ' || city || ' ' || postal_code || ' ' || state_province || ' ' || country_id as "Full Address" from locations;