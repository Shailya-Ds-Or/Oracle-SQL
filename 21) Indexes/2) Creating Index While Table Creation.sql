create table sales (
                    sale_id number primary key,
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number unique,
                    sale_detail_text varchar2(4000)
                    );
                    
select * from sales
where sale_id = 201
and transaction_id = 30123; -- Explain Plan, F10

drop table sales;

--------------------------------------------------------------------------------

create table sales (
                    sale_id number primary key using index (
                            create index sales_sale_id_idx on sales(sale_id)),
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number unique using index (
                                    create index sales_tran_id_idx on sales(transaction_id)),
                    sala_detail_text varchar2(4000)
                    );
                    
select * from sales
where sale_id = 201
and transaction_id = 30123; -- Explain Plan, F10

drop table sales;

--------------------------------------------------------------------------------

create table sales (
                    sale_id number primary key using index (
                            create unique index sales_sale_id_idx on sales(sale_id)),
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number unique using index (
                                    create bitmap index sales_tran_id_idx on sales(transaction_id)),
                    sale_detail_text varchar2(4000)
                    ); -- Error: ORA-00968: missing INDEX keyword
-- Error Because we can't Create BITMAP INDEX with PRIMARY or UNIQUE Key Constraints.

create table sales (
                    sale_id number primary key using index (
                            create unique index sales_sale_id_idx on sales(sale_id)),
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number using index (
                                    create bitmap index sales_tran_id_idx on sales(transaction_id)),
                    sale_detail_text varchar2(4000)
                    ); -- Error : ORA-00907: missing right parenthesis

create table sales (
                    sale_id number primary key using index (
                            create unique index sales_sale_id_idx on sales(sale_id)),
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number using index (
                                    create unique index sales_tran_id_idx on sales(transaction_id)),
                    sale_detail_text varchar2(4000)
                    ); -- Error: ORA-00907: missing right parenthesis
-- Because We can Create Indexes While Creating Tables only for Priamry, UNIQUE or Foreign Key
-- Constraints.

create table sales (
                    sale_id number primary key using index (
                            create unique index sales_sale_id_idx on sales(sale_id)),
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number unique using index (
                                    create unique index sales_tran_id_idx on sales(transaction_id)),
                    sale_detail_text varchar2(4000)
                    );
                    
select * from sales
where sale_id = 201
and transaction_id = 30123; -- Explain Plan, F10

--------------------------------------------------------------------------------

create table sales2 (
                     sale_id number primary key using index sales_sale_id_idx,
                     sale_date date not null,
                     customer_id number not null,
                     transaction_id number unique,
                     sale_detail_text varchar2(4000)
                     ); -- Error: ORA-14196: Specified index cannot be used to enforce the constraint.
                     
-- Index Created for One Table can not be used in Another Table.

--------------------------------------------------------------------------------

drop table sales;

create table sales (
                    sale_id number,
                    sale_date date not null,
                    customer_id number not null,
                    transaction_id number,
                    sale_detail_text varchar2(4000)
                    );

alter table sales
add primary key (sale_id)
using index (create unique index sales_sale_id_idx on sales(sale_id));

create unique index sales_tran_id_idx on sales(transaction_id);

alter table sales
add unique (transaction_id)
using index sales_tran_id_idx;

drop table sales;