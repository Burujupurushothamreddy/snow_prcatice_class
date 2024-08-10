create schema csk;
create table employees(empid number not null, emp_name varchar(20) not null, addr varchar(20) default null, salary number not null, department_id number default null);
desc table employees;
insert into employees (empid, emp_name, addr, salary, department_id) values(110,'nitesh','mum',5000,5);

truncate table employees;                                                             
select * from employees;
show tables;
select * from employees where empid <=101;
select * from employees where empid >=101;
select * from employees where department_id=1 and addr='bang';
select * from employees where department_id=1 or emp_name='rajesh'
select * from employees where department_id is not null; 
select * from employees where department_id is null; 
select * from employees where emp_name like '%a__'
select * from employees where emp_name like '__a%'
select * from employees where emp_name like '%a'
select * from employees where emp_name like 'a%'
select * from employees where salary <> 20000;
select empid, emp_name, addr, salary, department_id from employees;
select * from employees order by salary;
select * from employees order by salary desc;
select max(salary) from employees;
select min(salary) from employees;
select * from employees where salary=(select max(salary) from employees);
select count(*) from employees;
select max(salary) from employees where salary<(select max(salary) from employees)
select distinct(department_id) from employees order by department_id desc ;
select empid from employees where empid between 101 and 110;
select * from employees where empid in (101,105);
select  count(department_id) from employees group by department_id
select department_id, count(*) from employees group by department_id having count(*)>1;
select department_id from employees
select max(salary) from employees where salary not in (select max(salary) from employees)
select max(salary) from employees where salary < (select max(salary) from employees)

select distinct(DEPARTMENT_ID) from employees order by 1
select distinct(DEPARTMENT_ID) from employees order by department_id

assignment;
SELECT emp_name, addr FROM employees WHERE addr <> 'bang'
SELECT emp_name, addr FROM employees WHERE addr != 'mpl'
create table persons (P_Id int, LastName varchar(20),
FirstName varchar(20), Address varchar(20), City varchar(20));
desc table persons;
insert into persons (P_Id, LastName, FirstName, Address, City) values (2,'Svendson','Tove','Borgvn23', 'Sandnes');
insert into persons (P_Id, LastName, FirstName, Address, City) values (3,'Pettersen','Kari','Storgt20', 'Stavanger');
select *  from persons;
show tables;
SELECT P_Id, LastName, FirstName, Address, City FROM persons
SELECT * FROM persons
SELECT LastName,FirstName FROM Persons
SELECT DISTINCT P_Id, LastName, FirstName, Address, CityFROM persons
SELECT DISTINCT City FROM Persons
SELECT * FROM Persons WHERE City='Sandnes'
SELECT * FROM Persons WHERE FirstName='Tove'
SELECT * FROM Persons WHERE FirstName='Tove'AND LastName='Svendson'
SELECT * FROM Persons WHERE FirstName='Tove' OR FirstName='Ola'
SELECT * FROM Persons WHERE LastName='Svendson' AND (FirstName='Tove' OR FirstName='Ola')
SELECT * FROM Persons ORDER BY LastName DESC
SELECT * FROM Persons ORDER BY LastName
select * from persons where LastName='Svendson'
select * from persons where LastName<>'Svendson'
select * from persons where P_ID > 1
select * from persons where P_ID < 3 
select * from persons where P_ID <= 3
select * from persons where P_ID >= 3
select * from persons where P_ID between 1 and 3
select * from persons where LastName like '%s'
select * from persons where P_ID in(2,3) 
select max(salary) from employees where salary not in (select max(salary) from employees);
select * from employees where salary=(select max(salary) from employees)
select salary from employees order by salary desc
select department_id, count(*) from employees group by department_id
select department_id, count(*) from employees group by department_id having count(*)>1
