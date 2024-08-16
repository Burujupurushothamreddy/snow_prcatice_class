WORKING WITH JSON FILES
--------------------------------------------------------------------------------
create database raja;

create or replace stage raja.public.json_stage
url='s3://bucketsnowflake-jsondemo';

list @raja.public.json_stage;

create or replace table raja.public.json_data(raw_files variant);

desc table raja.public.json_data;

select * from raja.public.json_data;

create or replace file format json_format
type='json';

desc file format json_format

copy into raja.public.json_data
from @raja.public.json_stage
file_format=raja.public.json_format
files=('HR_data.json');

select * from raja.public.json_data

select $1:city :: string as city, 
       $1:first_name :: string as fname,
       $1:gender :: string as gender, 
       $1:id :: int as sid, 
       $1:job.salary :: int as salary, 
       $1:job.title :: string as title from raja.public.JSON_DATA

       create or replace table raja.public.json_data1 as (
       select $1:id :: int as sid,
       $1:city :: string as city,
       $1:first_name :: string as fname,
       $1:gender :: string as gender,  
       $1:job.salary :: int as salary, 
       $1:job.title :: string as title from raja.public.JSON_DATA)
       
       select * from raja.public.json_data1

        create or replace table raja.public.json_data2 as(
       select $1:id :: int as sid,
              $1:last_name :: string as lname,
              $1:prev_company :: string as Pcompany,
              $1:spoken_languages[0].language :: string as first_language,
              $1:spoken_languages[0].level :: string as first_lan_level,
              $1:spoken_languages[1].language :: string as sec_language,
              $1:spoken_languages[1].level :: string as second_lan_level from raja.public.json_data)

       select * from raja.public.json_data2
       
       select p.*, b.* from  json_data1 p inner join json_data2 b 
       on p.sid=b.sid;

       select p.*, b.* from  json_data1 p , json_data2 b 
       where p.sid=b.sid;

       
       create or replace table raja.public.json_data3 as(
       select $1:id :: int as sid,
       $1:city :: string as city,
       $1:first_name :: string as fname,
       $1:gender :: string as gender,  
       $1:job.salary :: int as salary, 
       $1:job.title :: string as title,
       $1:last_name :: string as lname,
              $1:prev_company :: string as Pcompany,
              $1:spoken_languages[0].language :: string as first_language,
              $1:spoken_languages[0].level :: string as first_lan_level,
              $1:spoken_languages[1].language :: string as sec_language,
              $1:spoken_languages[1].level :: string as second_lan_level from raja.public.json_data)

   select * from raja.public.json_data3  

working with PARQUET files:
---------------------------------------------------------------------------------
create or replace file format raja.public.PARQUET_FORMAT
type=PARQUET;

create or replace stage raja.public.PARQUET_stage 
url = 's3://snowflakeparquetdemo'
file_format=raja.public.PARQUET_format 

list @raja.public.PARQUET_stage;

select * from @raja.public.PARQUET_stage 

select $1:__index_level_0__ :: int as indel_level1,
       $1:cat_id :: string as cid,
       $1:date :: int as Mdate,
       $1:dept_id :: string as Did,
       $1:id :: string as sid,
       $1:item_id :: string as itemid,
       $1:state_id :: string as state_id,
       $1:store_id :: string as store_id,
       $1:value :: int as value from @raja.public.PARQUET_stage 
       

create or replace table parquet1 as (
select $1:__index_level_0__ :: int as indel_level1,
       $1:cat_id :: string as cid,
       $1:date :: int as Mdate,
       $1:dept_id :: string as Did,
       $1:id :: string as sid,
       $1:item_id :: string as itemid,
       $1:state_id :: string as state_id,
       $1:store_id :: string as store_id,
       $1:value :: int as value from @raja.public.PARQUET_stage) 

       select * from parquet1;

 UPDATE parquet1
SET mdate = EXTRACT(EPOCH FROM CURRENT_TIMESTAMP());


assignment
__________________________________________

create or replace storage integration s3_int1
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090512481:role/json_files_snowflake'
  STORAGE_ALLOWED_LOCATIONS = ('s3://purushothamreddy/for_csv1/', 's3://purushothamreddy/for_json1/')
   COMMENT = 'This an optional comment' 

   desc integration s3_int1

   create or replace stage puru_json
   url='s3://purushothamreddy/for_json1/'
  storage_integration= s3_int1

   list @puru_json

create or replace table puru_json(raw_files variant);

select * from puru_json

create or replace file format puru_format
type=json;

copy into puru_json
from @puru_json
file_format=puru_format
files=('Musical_Instruments_5.json')

select * from puru_json

select raw_files:asin :: string as asin,
       raw_files:helpful[0] :: int as helpful,
       raw_files:overall :: int as overall,
        raw_files:reviewText :: string as reviewtext,
        raw_files:reviewTime :: string as reviewtime,
        raw_files:reviewerID :: string as reviewerID,
        raw_files:reviewerName :: string as reviewerName,
        raw_files:summary :: string as summary,
        raw_files:unixReviewTime :: int as unixReviewTime from puru_json
        

create or replace table puru_json1 as (
select raw_files:asin :: string as asin,
       raw_files:helpful[0]:: int as helpful,
       raw_files:overall :: int as overall,
        raw_files:reviewText :: string as reviewtext,
        raw_files:reviewTime :: string as reviewtime,
        raw_files:reviewerID :: string as reviewerID,
        raw_files:reviewerName :: string as reviewerName,
        raw_files:summary :: string as summary,
        raw_files:unixReviewTime :: int as unixReviewTime from puru_json)

        select * from puru_json1

        create or replace stage puru_csv
        url= 's3://purushothamreddy/for_csv1/'
        storage_integration= s3_int1

        list @puru_csv

        create or replace table emp (id number, first_name varchar(100), last_name varchar(100), email varchar(100), location varchar(50), department varchar(30));

  select * from emp 
  copy into emp 
  from @puru_csv
  file_format=(type=csv field_delimiter=',' skip_header=1)
  files=('employee_data_1 - employee_data_1.csv')
        