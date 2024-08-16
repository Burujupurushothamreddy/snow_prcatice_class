create table A (num int);
create table B (num int);

insert into A (num) values (1),
(2),
(2),
(3),
(3),
(3),
(4),
(4),
(4),
(4),
(5),
(5),
(5),
(5),
(5),
(null);

insert into B (num) values (1), (1),
(2),
(2),
(3),
(3),
(4),
(4),
(5),
(5),
(5),
(null),
(null);


 select * from A;   select * from B

select x.num, y. num  from A X  inner join B y
on x.num = y.num

Left join;

select x.num, y. num  from A X  left join B y
on x.num = y.num


right;

select x.num, y. num  from A X  right join B y
on x.num = y.num

full outer join;
select x.num, y. num  from A X full outer join B y
on x.num = y.num

class practice;

select * from employees

select * from BANK.HDFC.JOBS

select P.*, '||', B.* from employees P inner join JOBS B on P.JOB_ID = B.JOB_ID

select P.*, '||', B.* from employees P left join JOBS B on P.JOB_ID = B.JOB_ID

select P.*, '||', B.* from employees P right join JOBS B on P.JOB_ID = B.JOB_ID

select P.*, '||', B.* from employees P full outer join JOBS B on P.JOB_ID = B.JOB_ID

select * from BANK.HDFC.LOCATIONS







10 questions assignment;

11) select first_name, salary from employees where department_id in (9, 6, 5) and salary > 3000

12) 



Display the names of the employees who are working in the company for  the past 5 years.

select first_name, hire_date from employees where hire_date >= 'to_date'('2000-01-04 yyyy-mm-dd', -12 * 5)

select * from employees order by hire_date desc

update employees set hire_date= current_date where first_name='Charles' and last_name='Johnson' 

update employees set hire_date= to_date('01-01-2023','dd-mm-yyyy') where  first_name='Steven' 

update employees set hire_date= to_date('02-03-2022','dd-mm-yyyy') where  first_name='David' 

update employees set hire_date= to_date('10-12-2021','dd-mm-yyyy') where  first_name='Alexander' 

update employees set hire_date= to_date('10-12-2020','dd-mm-yyyy') where  first_name='Bruce' 



SELECT first_name, hire_date
FROM employees
WHERE hire_date >= add_months(current_date, -12*5);

select first_name, hire_date from employees where hire_date >= TO_DATE('01-01-2020','dd-mm-yyyy')

13. 
 Display the list of employees who
have joined the company before 
30-JUN-90 or after 31-DEC-90. 


select first_name from employees where hire_date < to_date('30-06-1990','dd-mm-yyyy') or hire_date > to_date('31-12-1990','dd-mm-yyyy')  


select * from employees where hire_date between to_date('30-06-1990','dd-mm-yyyy') and to_date('31-12-1990','dd-mm-yyyy')  
14;

select current_date from dual

select current_timestamp from dual

15;

 show users

16;

show tables

17;

show databases

18;

select first_name  from employees where department_id in(6,5,3) 

19;

select first_name from employees where first_name like 'S%'


20;

 select first_name from employees where first_name like '%S'


 SELECT First_name, salary
FROM EMPLOYEES
WHERE Salary IN (
    SELECT Salary
    FROM EMPLOYEES
    GROUP BY Salary
    HAVING COUNT(*) > 1
) order by first_name ;
