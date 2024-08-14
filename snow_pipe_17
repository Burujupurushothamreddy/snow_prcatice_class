use database raja

create or replace storage integration s3_int_pipe
type=external_stage
STORAGE_PROVIDER = S3
ENABLED = TRUE 
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090512481:role/buruju_reddy_csv'
STORAGE_ALLOWED_LOCATIONS = ('s3://burujureddy/csv/', 's3://burujureddy/json/')
COMMENT = 'This is my snowpipe practice' 

desc storage integration s3_int_pipe

create or replace stage raja_snow_pipe
url='s3://burujureddy/csv/'
storage_integration= s3_int_pipe
file_format=raja.public.snowpipe_csv

list @raja_snow_pipe

create or replace file format raja.public.snowpipe_csv
type=csv
field_delimiter=','
skip_header=1
null_if= ('null','null')
empty_field_as_null = TRUE

CREATE OR REPLACE TABLE raja.PUBLIC.employees (
  id INT,
  first_name STRING,
  last_name STRING,
  email STRING,
  location STRING,
  department STRING)

  select * from raja.PUBLIC.employees

  create or replace schema pipe_csv

  create or replace pipe raja.pipe_csv.buruju_pipe
  auto_ingest=true
  as
  copy into raja.public.employees
  from @raja.public.raja_snow_pipe

  desc pipe raja.pipe_csv.buruju_pipe

  alter pipe raja.pipe_csv.buruju_pipe refresh;

  select system$pipe_status ('raja.pipe_csv.buruju_pipe')

  alter pipe raja.pipe_csv.buruju_pipe set pipe_execution_paused=true

  alter pipe raja.pipe_csv.buruju_pipe set pipe_execution_paused=false
 

