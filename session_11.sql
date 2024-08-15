use database bank;
use schema hdfc;
create or replace stage bank.hdfc.aws_stage
url='s3://bucketsnowflakes3'
list @bank.hdfc.aws_stage;

CREATE OR REPLACE TABLE bank.hdfc.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));
select * from bank.hdfc.ORDERS;
copy into bank.hdfc.ORDERS from @bank.hdfc.aws_stage 
file_format=(type=csv field_delimiter=',' skip_header=1)
pattern='.*Order.*';

select * from bank.hdfc.ORDERS; 

create or replace table bank.hdfc.orders1 as (select * from our_first_db.public.loan_payment where 1=2);
select * from bank.hdfc.orders1

copy into bank.hdfc.orders1 from @bank.hdfc.aws_stage
file_format=(type=csv field_delimiter=',' skip_header=1)
pattern='.*Loan_payments_data.*';

_____________________________________________________________________
create or replace table order_ex as(
select
ORDER_ID,
AMOUNT from orders)
select * from order_ex

select category, count(*) from bank.hdfc.orders group by category;

create or replace table bank.hdfc.order_ex1(
order_id varchar,
amount int,
profit int, non_profitable varchar(20), profitable varchar(20));

select * from order_ex1
copy into order_ex1(order_id, amount, profit, non_profitable, profitable) from 
(select
      b.$1,
      b.$2,
      b.$3,
      case when b.$3<=0  then 'loss' else 'na' end as "non_profitable",
      case when b.$3>0  then 'profit' else 'na' end as "profitable" from @bank.hdfc.aws_stage b)
      file_format=(type=csv field_delimiter=',' skip_header=1)
      files=('OrderDetails.csv');

      create or replace table bank.hdfc.order_ex2(
order_id varchar(20),
amount int,
profit int,
CATEGORY varchar(20))

select * from order_ex2
copy into order_ex2(order_id, amount, profit, category) from 
(select
      b.$1,
      b.$2,
      b.$3,
      substring (b.$5,1,6) from @bank.hdfc.aws_stage b)
      file_format=(type=csv field_delimiter=',' skip_header=1)
      files=('OrderDetails.csv');

COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX
    FROM (select 
            s.$1,
            s.$2, 
            s.$3,
            substring(s.$5,1,5) 
          from @MANAGE_DB.external_stages.aws_stage s)
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files=('OrderDetails.csv');
select * from bank.hdfc.ORDERS; 
select * from employees;
51) select first_name from employees where salary=(select max(salary) from employees)
52) select employee_id, first_name from employees where department='clerk' and salary=(select max(salary) from employees where department='cleark' )
53) select first_name from employees where department_id=7 and salary>(select max(salary) from employees where department_id=9 ) 
54) select first_name from employees where department_id=9 and salary<(select max(salary) from employees where department_id=7 )
    select first_name from employees where salary> (select max(salary) from employees where first_name='Alexander')
                                         or salary>(select max(salary) from employees where first_name='Shelli');

55) select * from(
select first_name, dense_rank() over(partition by department_id order by salary desc) as rnk from employees) where rnk=1;

56)  select first_name, department_id from employees where department_id=5; 

    select job_id, sum(salary) from employees group by job_id having sum(salary)> (select max(salary) from employees where job_id=5) 

select first_name from employees where department_id=10 and salary> (select max (salary) from employees where department_id=9)
61) select first_name from employees where department_id=10 and salary>(select avg(salary) from employees where department_id <>10)
62) select upper(first_name) from employees
63) select lower(first_name) from employees
64) select initcap(first_name) from employees
65) select length('burujupurushothamreddy') from dual;
66) select length(first_name) as LN from employees 
67) select employee_id || ',' || first_name from employees
68) select substr(first_name,1,2) from employees
69) select charindex('a', 'Computer Maintenance Corporation') from dual
70) select translate(first_name,'A','B') from employees 
71)select replace(first_name, 'Den','boos') from employees  
72)select employee_id, first_name, department_id,decode(department_id,9, '99', 10 ,'100' , 'na') as dept_no from employees
73) SELECT DATEDIFF(DAY, to_date ('31-12-1999','dd-mm-yyyy'), sysdate()) AS AgeInDays;
74) SELECT DATEDIFF(month, to_date ('31-12-1999','dd-mm-yyyy'), sysdate()) AS AgeInmonths;
75) SELECT CAST('1997-08-15' AS DATE) AS current_date;
