create or replace table loan_pay2 as ( 
 select
 loan_id,
 loan_status,
 terms,
 principal,
 education,
 age,
 gender,
 case when (gender='male' and age>=21) then 'major'
      when (gender='male' and age<21) then  'minor' else 'NA'  end as "M_status",
 case when (gender='female' and age>=18) then 'major'
      when (gender='female' and age<18) then  'minor' else 'NA'  end as "F_status"
      from loan_payment order by age);
      select * from loan_payment
      select * from loan_pay2

create or replace table our_first_db.public.loan_pay_inter(
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
select * from our_first_db.public.loan_pay_inter;

create or replace stage our_first_db.public.inter_bpr;
list @our_first_db.public.inter_bpr;
select * from loan_payment

copy into our_first_db.public.loan_pay_inter from @our_first_db.public.inter_bpr 
file_format=(type=csv field_delimiter=',' skip_header=1)

desc stage our_first_db.public.inter_bpr; 