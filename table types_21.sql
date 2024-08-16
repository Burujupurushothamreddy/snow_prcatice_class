use database pdb

use schema dhoni

create database pdb

create or replace table pdb.dhoni.healper(
id int,
fname string,
lname string,
email string,
gender string,
job string,
phone string)

select * from pdb.dhoni.healper;

create or replace file format pdb.dhoni.csv_files1
type=csv field_delimiter=',' skip_header=1

create or replace stage pdb.dhoni.external_stage
url= 's3://data-snowflake-fundamentals/time-travel/'
file_format=pdb.dhoni.csv_files1;

list @pdb.dhoni.external_stage

copy into pdb.dhoni.healper
from @pdb.dhoni.external_stage
files=('customers.csv')

select * from pdb.dhoni.healper

show tables

alter table healper set data_retention_time_in_days=90



\\transient tables

create or replace transient database tbd_trans 

create or replace transient schema dhoni_trans


create or replace table tbd_trans.dhoni_trans.healper_trans(
id int,
fname string,
lname string,
email string,
gender string,
job string,
phone string)

create or replace file format tbd_trans.dhoni_trans.csv_files_trans
type=csv field_delimiter=',' skip_header=1

create or replace stage tbd_trans.dhoni_trans.external_stage_trans
url= 's3://data-snowflake-fundamentals/time-travel/'
file_format=tbd_trans.dhoni_trans.csv_files_trans;

list @tbd_trans.dhoni_trans.external_stage_trans

copy into tbd_trans.dhoni_trans.healper_trans
from @tbd_trans.dhoni_trans.external_stage_trans
files=('customers.csv')

select * from tbd_trans.dhoni_trans.healper_trans
show tables

\\temporary tables

create or replace temporary table tbd_trans.dhoni_trans.healper_temp(
id int,
fname string,
lname string,
email string,
gender string,
job string,
phone string)

copy into tbd_trans.dhoni_trans.healper_temp
from @tbd_trans.dhoni_trans.external_stage_trans
files=('customers.csv')

show tables