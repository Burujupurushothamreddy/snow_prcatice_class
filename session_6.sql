use database purushotham
use schema csk
show tables
create table test (amount integer)
select amount from test
insert into employees (EMPID, EMP_NAME, ADDR, SALARY, DEPARTMENT_ID) values (112,'data wherehouse','mdp',50000, 9)
insert into test (amount) values (-200)
select amount, case 
when amount < 0 then 'loss' when amount > 0 then 'profit' end as status from test 
select amount, case 
when amount < 0 then 'loss' when amount > 0 then 'profit' end as status from test order by amount
select * from employees
select EMPID, EMP_NAME, ADDR, SALARY, DEPARTMENT_ID, row_number() over(order by salary desc )  as rid from employees 
select (EMPID, EMP_NAME, ADDR, SALARY, DEPARTMENT_ID, rank() over(order by salary desc ) as rid from employees) 
select EMPID, EMP_NAME, ADDR, SALARY, DEPARTMENT_ID, dense_rank () over(order by salary desc )  as rid from employees 

create or replace table bank.hdfc.employee_1 as (
select * from purushotham.csk.employees
)
select * from bank.hdfc.employee_2

create or replace table bank.hdfc.employee_2 as (
select * from purushotham.csk.employees_2 where empid= 100000000000000
)
drop table bank.hdfc.employee_2
string functions;
 1. upper;
  select  upper(emp_name) from employees;
2. lower;
  select lower (emp_name) from employees;
3.length;
   select emp_name, length(emp_name) as len from employees;
4.lpad;
select lpad(emp_name,10,'#*') from employees;
5.rpad;
select rpad(emp_name,11,'123') from employees;
6.ltrim;
select ltrim(emp_name, 'b') from employees
7.rtrim;
select rtrim(emp_name, 'r') from employees
8.replace;
 select replace(emp_name, 'r', 'z') from employees;
9. translate;
   select translate(emp_name, 'r', '9') from employees;
10. substr;
   select substr(emp_name, 1,2) from employees
11. concat;
    select concat(emp_name, addr) from employees

numaric functions;
1.ABS;
select ABS(50000) from employees;
select abs (10) from dual;

2.round;
  select ROUND(3.14159, 3) from dual; 

3.Acos;
  SELECT ACOS(0.5) from dual;

4.ASIN;
  SELECT ASIN(0.7) from dual;

5. ATAN;
   SELECT ATAN(2) from dual;

6. ceiling;
    select CEILING(4.3) from dual;

7.cos;
  select cos(2) from dual;

8.cos
   select cot(1) from dual;

9.degrees;
  SELECT DEGREES(1.5708) from dual;

10. sqrt;
    select sqrt(100) from dual;

show tables;
select * from employees;
update employees set addr='bang' where empid=107
update employees set department_id=null where department_id=6 and emp_name='gaji' where emp_name='gajendra';
delete from employees where empid=107 or empid=112

create or replace table purushotham.csk.test_1 as ( 
select * from purushotham.csk.test)
select * from purushotham.csk.test_1

 select empid, emp_name, addr, department_id, salary, case 
 when salary <= 20000 then 'jr_employee' when salary >= 20000 then 'sr_employee' end as status from employees

 select salary, case when salary >= 20000 then 'sr_employee' else 'jr_employee' end as status from employees;
  select * from employees;

 create or replace table purushotham.csk.employee as (select * from bank.hdfc.employees)
create or replace table purushotham.csk.dependents as (select * from bank.hdfc.dependents); 

  select * from dependents
  select * from employee
  select * from employee where EMPLOYEE_ID in ( select EMPLOYEE_ID from dependents )
  select * from employee where EMPLOYEE_ID not in ( select EMPLOYEE_ID from dependents )

  \\row_number;
  select * from ( select empid, emp_name, addr, salary, department_id, row_number() over (order by salary asc) as rid from employees) where rid =5

  \\rank;
  select * from ( select empid, emp_name, addr, salary, department_id, rank() over (order by salary asc) as rid from employees) where rid =5

  \\dense rank; 
  select * from ( select empid, emp_name, addr, salary, department_id, dense_rank() over (order by salary asc) as rid from employees) where rid =5

  select substr(email, 1,7) from employee;
  select current_timestamp




  select * from employees order by salary desc

  select max(salary) from employees where salary < (select max(salary) from employees)

  