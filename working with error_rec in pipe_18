elect * from employees2

  create or replace pipe puru_error_snowpipe
  auto_ingest=true
  as
  copy into raja.PUBLIC.employees2
  from @error_snow_pipe


  desc pipe puru_error_snowpipe

  select system$pipe_status ('puru_error_snowpipe')

  alter pipe puru_error_snowpipe refresh;

  SELECT * FROM TABLE(VALIDATE_PIPE_LOAD(
    PIPE_NAME => 'puru_error_snowpipe',
    START_TIME => DATEADD(HOUR,-2,CURRENT_TIMESTAMP())))

create or replace table puru_error_records as (
select REJECTED_RECORD from table(result_scan(LAST_QUERY_ID())))

select * from  puru_error_records

select * from raja.PUBLIC.employees2

select * from puru_error_records

insert into  raja.PUBLIC.employees2 (
select
split_part(REJECTED_RECORD,',',1) as id,
split_part(REJECTED_RECORD,',',2) as first_name,
split_part(REJECTED_RECORD,',',3) as last_name, 
split_part(REJECTED_RECORD,',',4) as email,
split_part(REJECTED_RECORD,',',5) as locations,
split_part(REJECTED_RECORD,',',6) as department from puru_error_records
)
