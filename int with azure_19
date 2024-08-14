use database amma
use schema public

create or replace storage integration azure_1
type=external_stage
storage_provider=azure
ENABLED = TRUE 
azure_tenant_id = 'fb4d3693-290b-469a-8748-61c7fd2c03be'
STORAGE_ALLOWED_LOCATIONS =('azure://purushothamreddy.blob.core.windows.net/employeesdetailsdata')

desc storage integration azure_1

create or replace stage amma.public.azure_stage
url='azure://purushothamreddy.blob.core.windows.net/employeesdetailsdata'
storage_integration=azure_1
file_format=azure_format

list @amma.public.azure_stage

create or replace file format azure_format
type=csv
field_delimiter=','
skip_header=1
null_if=('null','null')
empty_field_as_null=true

create or replace table employee_azure(
id int,
first_name string,
last_name string,
email string,
location string,
department string)

select * from employee_azure
