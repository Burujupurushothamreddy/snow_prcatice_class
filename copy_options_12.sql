CREATE OR REPLACE STAGE purushotham.public.aws_stage_errorex
url='s3://bucketsnowflakes4'

 LIST @purushotham.public.aws_stage_errorex
 CREATE OR REPLACE TABLE purushotham.public.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));
    
    
    copy into purushotham.public.ORDERS_EX
    from @purushotham.public.aws_stage_errorex
    file_format=(type=csv field_delimiter=',' skip_header=1)
    files=('OrderDetails_error.csv')

    select * from purushotham.public.ORDERS_EX

    copy into purushotham.public.ORDERS_EX
    from @purushotham.public.aws_stage_errorex
    file_format=(type=csv field_delimiter=',' skip_header=1)
    files=('OrderDetails_error.csv')
    on_error='continue'
   -- force=true 
   truncate table purushotham.public.ORDERS_EX

    COPY INTO purushotham.PUBLIC.ORDERS_EX
    FROM @purushotham.public.aws_stage_errorex
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'ABORT_STATEMENT';

    SELECT * FROM purushotham.PUBLIC.ORDERS_EX
     SELECT COUNT(*) FROM purushotham.PUBLIC.ORDERS_EX

     truncate table purushotham.public.ORDERS_EX


     COPY INTO purushotham.PUBLIC.ORDERS_EX
    FROM @purushotham.public.aws_stage_errorex
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    --ON_ERROR = 'SKIP_FILE'
    VALIDATION_MODE = RETURN_ERRORS


    
     COPY INTO purushotham.PUBLIC.ORDERS_EX
    FROM @purushotham.public.aws_stage_errorex
   file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE_2'; 


     COPY INTO purushotham.PUBLIC.ORDERS_EX
    FROM @purushotham.public.aws_stage_errorex
   file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = SKIP_FILE_3 
    SIZE_LIMIT = 55000;


    LIST @purushotham.public.aws_stage_errorex


validation method;

CREATE OR REPLACE TABLE  purushotham.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT VARCHAR(30),
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(3),
    SUBCATEGORY VARCHAR(30));

    CREATE OR REPLACE STAGE purushotham.PUBLIC.aws_stage_copy
    url='s3://snowflakebucket-copyoption/size/';

    list @purushotham.PUBLIC.aws_stage_copy

    copy into purushotham.PUBLIC.ORDERS
    from @purushotham.PUBLIC.aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Orders2.*'
    VALIDATION_MODE = RETURN_ERRORS

    truncate table purushotham.PUBLIC.ORDERS
    select * from purushotham.PUBLIC.ORDERS

    create or replace file format my_file_frmt
     type=csv,
     field_delimiter=',',
     skip_header=1;
     

    desc file format my_file_frmt
    
    copy into purushotham.PUBLIC.ORDERS
    from @purushotham.PUBLIC.aws_stage_copy
    file_format= (FORMAT_NAME=my_file_frmt)
    pattern='.*Order.*'
   --VALIDATION_MODE = RETURN_5_ROWS 
     ON_ERROR =CONTINUE 
   --size_Limit = 75000
   -- RETURN_FAILED_ONLY = TRUE
    TRUNCATECOLUMNS = true;

    select * from purushotham.PUBLIC.ORDERS

    truncate table purushotham.PUBLIC.ORDERS
     
     copy into purushotham.PUBLIC.ORDERS
    from @purushotham.PUBLIC.aws_stage_copy
    file_format= (FORMAT_NAME=my_file_frmt)
    pattern='.*Order.*'
    RETURN_FAILED_ONLY = TRUE
