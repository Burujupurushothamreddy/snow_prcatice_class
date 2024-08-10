create table our_first_db.public.loan_payment(
loan_id string,
loan_status string,
Principal STRING,
terms STRING,
effective_date STRING,
due_date STRING,
paid_off_time STRING,
past_due_days STRING,
age STRING,
education STRING,
Gender STRING);

select * from loan_payment
desc table loan_payment

COPY INTO LOAN_PAYMENT
    FROM s3://bucketsnowflakes3/Loan_payments_data.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1);

create or replace table loan_pay1 as (
select
loan_id,
loan_status,
Principal,
terms,
effective_date,
due_date,
paid_off_time,
past_due_days,  
education, 
Gender,
age,
case when age>20 then 'major' else 'minor' end as "status" from loan_payment order by age);

select * from loan_pay2;

create or replace table loan_pay2 as (
select
loan_id,
loan_status,
principal,
terms,
education,
age,
gender,
case when gender='male' and age > 21 then 'major' else 'null' end as "M_status",
case when gender='female' and age> 18 then 'major' else 'null' end as "fe_status"
from loan_pay1 order by age);


SELECT
    Employee_Id,
    Name,
    Salary,
    ROUND(Salary * 0.15, 2) AS HRA,
    ROUND(Salary * 0.10, 2) AS DA,
    ROUND(Salary * 0.05, 2) AS PF,
    ROUND((Salary + Salary * 0.15 + Salary * 0.10) - Salary * 0.05, 2) AS Total_Salary
FROM
    Employee;

    create or replace table emp(Name varchar(30), Salary number)

    insert into emp(name,salary) 
values('raju',15000),
    ('mani', 25000),
    ('nani', 18000)
    select * from emp


select name, salary, 

salary * 0.15 as hra,

salary* 0.10  as da,

salary* 0.05  as PF,

(salary + salary * 0.15+ salary * 0.10 ) - (SALARY * 0.05) as totalsalary
from emp

select * from employees
select department_id,
count (employee_id) as total_employees
from employees
group by department_id;

select job_id, count(employee_id) as total_employees from employees group by job_id
    
select department_id, sum(salary) as totaltalary from employees group by department_id

select department_id, max(salary) from employees group by department_id

select * from employees

select manager_id, sum(salary) from employees group by manager_id 

select department_id from employees group by department_id having count(*) >3

select job_id, sum(salary) as totalsalary from employees group by job_id having totalsalary > 40000

select department_id, sum(salary) as totalsalary from employees group by department_id having totalsalary > 40000

select job_id from employees group by job_id having count(*) > 3
    
select * from employees order by job_id


create or replace stage OUR_FIRST_DB.PUBLIC.ext_loan_stage 
url= 's3://bucketsnowflakes3/Loan_payments_data.csv'


list @OUR_FIRST_DB.PUBLIC.ext_loan_stage ;

CREATE TABLE OUR_FIRST_DB.PUBLIC.LOAN_PAYMENT_V1 (
  Loan_ID STRING,
  loan_status STRING,
  Principal STRING,
  terms STRING,
  effective_date STRING,
  due_date STRING,
  paid_off_time STRING,
  past_due_days STRING,
  age STRING,
  education STRING,
  Gender STRING);

  select * from loan_payment_v1
  
  COPY INTO LOAN_PAYMENT_V1
    FROM @OUR_FIRST_DB.PUBLIC.ext_loan_stage
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1);

select * from loan_payment

create or replace table our_first_db.public.loan_payment(
Loan_ID STRING,
  loan_status STRING,
  Principal STRING,
  terms STRING,
  effective_date STRING,
  due_date STRING,
  paid_off_time STRING,
  past_due_days STRING,
  age STRING,
  education STRING,
  Gender STRING);

  select * from our_first_db.public.loan_payment
  
  copy into our_first_db.public.loan_payment from
  s3://bucketsnowflakes3/Loan_payments_data.csv
  file_format=(type=csv field_delimiter=',' skip_header=1);

  create or replace table loan_pay2 as (
  select
  loan_id,
  loan_status,
  Principal,
  terms,
  age, 
  education, 
  gender,
  case when (gender='male' and age>=21) then 'major'
       when (gender='male' and age<21) then 'minor' else 'na' end as "m_status",
  case when (gender='female' and age>=18) then 'major'
       when (gender='female' and age<18) then 'minor' else 'na' end as "f_status"
       from loan_payment order by age);
       select * from loan_pay2;
       undrop table loan_payment
       undrop table loan_pay2

__________________________________________________________________________________

create or replace stage OUR_FIRST_DB.PUBLIC.EXT_LOAN_STAGE
url= 's3://bucketsnowflakes3/Loan_payments_data.csv'

list @OUR_FIRST_DB.PUBLIC.EXT_LOAN_STAGE
desc stage OUR_FIRST_DB.PUBLIC.EXT_LOAN_STAGE

select
  s.$1,
  s.$9,
  s.$2,
  s.$3from @OUR_FIRST_DB.PUBLIC.EXT_LOAN_STAGE s

  create or replace table OUR_FIRST_DB.PUBLIC.loan_pay_v2(
  loan_id varchar(30),
  loan_status varchar(100),
  principal varchar(20),
  age int,
  gender varchar(100),
  M_status varchar(20),
  F_status varchar(20)
  )
  select * from OUR_FIRST_DB.PUBLIC.loan_pay_v2;
  copy into OUR_FIRST_DB.PUBLIC.loan_pay_v2(loan_id,loan_status,principal,age,gender,M_status,F_status) from
  (select
  s.$1,
  s.$2,
  s.$3,
  s.$9,
  s.$11,
  case when (s.$9>=21 and s.$11='male') then 'major'
       when (s.$9<21 and s.$11='male') then 'minor' else 'na' end as "m_status",
 case when (s.$9>=18 and s.$11='female') then 'major'
       when (s.$9<18 and s.$11='female') then 'minor' else 'na' end as "f_status"
     from @OUR_FIRST_DB.PUBLIC.EXT_LOAN_STAGE s)
     file_format=(type=csv field_delimiter=',' skip_header=1);
     select * from OUR_FIRST_DB.PUBLIC.loan_pay_v2;