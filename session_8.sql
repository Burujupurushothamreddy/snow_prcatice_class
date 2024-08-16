select * from employees order by department_id desc


select max(salary) from employees where departments='clerk';

select max(salary) from employees where department_id= 20

select min(salary) from employees where department_ids = 'salesman'


 select avg(salary) from employees where department_id = 10 


35) Display the total salary drawn by
ANALYST working in depart number 40. 

select sum(salary) from employees where positions= 'analyst' and department_id= 40


select * from employees order by manager_id 

 select first_name from employees order by salary 

 
    select first_name from employees order by salary desc
    
select first_name from employees order by first_name
select first_name, salary * 12 as annual_salary from employees order by annual_salary desc


select employee_id, first_name, department_id, salary from employees order by first_name, department_id, salary

