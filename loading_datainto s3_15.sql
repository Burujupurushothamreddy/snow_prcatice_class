create or replace storage integration s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090512481:role/snow_practice'
  STORAGE_ALLOWED_LOCATIONS = ('s3://11ambatch/csv_files/', 's3://11ambatch/json_files/')
   COMMENT = 'This an optional comment' 

desc integration s3_int

CREATE OR REPLACE stage stage_aws_csv
    URL = 's3://11ambatch/csv_files/'
    STORAGE_INTEGRATION = s3_int

    list @stage_aws_csv

    CREATE or replace TABLE countries (
	country_id CHAR (2),
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL);

    select * from countries

    copy into countries
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    files=('COUNTRIES.csv')

     CREATE TABLE locations (
	location_id INT,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL);
    select * from locations 

    copy into locations
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue

    
CREATE TABLE jobs (
	job_id INT,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

select * from jobs

 copy into jobs
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue

CREATE TABLE departments (
	department_id INT IDENTITY(1,1),
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL);

select * from departments

copy into departments
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue

    CREATE TABLE employees (
	employee_id INT IDENTITY(1,1),
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL);
    
    desc table employees;
     
     select * from employees;

     copy into employees
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue

    CREATE TABLE dependents (
	dependent_id INT,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL);
	
    desc table dependents;
 select * from dependents;

      copy into dependents
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue

    select * from BANK.HDFC.REGIONS

    CREATE TABLE regions (
	region_id INT,
	region_name VARCHAR (25) DEFAULT NULL
);

select * from  regions

copy into regions
    from @stage_aws_csv
    file_format=(type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    on_error= continue
-----------------------