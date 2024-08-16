create or replace stage copy_db.public.aws_stage_copy
url= 's3://snowflakebucket-copyoption/returnfailed/';

list@copy_db.public.aws_stage_copy

create or replace table copy_db.public.orders(
order_id varchar(30),
amount int,
profit int,
quantity int,
category varchar(30),
subcategory varchar(30));

select * from copy_db.public.orders

copy into copy_db.public.orders
from @copy_db.public.aws_stage_copy
file_format=(type=csv field_delimiter=',' skip_header=1)
pattern='.*Order.*'
validation_mode= RETURN_errors

copy into copy_db.public.orders
from @copy_db.public.aws_stage_copy
file_format=(type=csv field_delimiter=',' skip_header=1)
pattern='.*Order.*'
On_error=continue

create or replace table rejected as 
select rejected_record from table(result_scan(last_query_id()))

select * from rejected

select * from orders

select count(*) from orders

create or replace table rejected_1 as 
 select
 split_part(rejected_record,',',1) as order_id,
 split_part(rejected_record,',',2) as amount,
 split_part(rejected_record,',',3) as profit,
 split_part(rejected_record,',',4) as quantity,
 split_part(rejected_record,',',5) as category,
 split_part(rejected_record,',',6) as subcategory from rejected
 
select * from REJECTED_1 

update REJECTED_1 set PROFIT=1000 where PROFIT='one thousand';
update REJECTED_1 set PROFIT=220 where PROFIT='two hundred twenty';
update REJECTED_1 set QUANTITY=7 where QUANTITY='7-';
update REJECTED_1 set QUANTITY=3 where QUANTITY='3a';

insert into orders (select * from REJECTED_1 )
