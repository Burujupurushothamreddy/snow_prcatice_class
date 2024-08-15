use database amma

create or replace table test(
id int,
first_name string,
last_name string,
email string,
gender string,
Job string,
Phone string)

select * from test

show tables

alter table test set data_retention_time_in_days=90

create or replace file format amma_csv
type=csv
field_delimiter=','
skip_header=1

create or replace stage AMMA.PUBLIC.AMM_EXTERNAL
url='s3://data-snowflake-fundamentals/time-travel/'
file_format=amma_csv

list @AMMA.PUBLIC.AMM_EXTERNAL

copy into test
from @AMMA.PUBLIC.AMM_EXTERNAL
files=('customers.csv')

select * from test

update test set first_name='puru'

\\time travel by using offset

select * from test at (offset=> -60*17.5)

select sysdate()

update test set email='null'

\\time travel by using timestamp
 select * from test1 before (timestamp=>'2024-08-15 08:26:35.358'::timestamp)

 
\\time travel by using query_id
select * from test before(statement=>'01b65cac-0001-29c2-0005-493e0002ffbe' )



select * from test1

update test1 set email='na'

select sysdate()
