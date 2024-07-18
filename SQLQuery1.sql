create database case_study2
USE case_study2
CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);
INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

	   
  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')



CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))


INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)


select * from EMPLOYEE

---1. List all the employee details.
select * from EMPLOYEE;


--2. List all the department details.
select * from DEPARTMENT

--3. List all job details.
select * from job

--4. List all the locations.
select * from LOCATION

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select first_name, last_name, salary, Comm from Employee

---6. List out the Employee ID, Last Name, Department ID for all employees and
--alias
--Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".
select EMPLOYEE_id as [ID of the Employee],  Last_Name as [Name of the Employee], Department_ID as [Dep_id] from employee

---7. List out the annual salary of the employees with their names only.
select First_NAME, last_name, salary*12 as [annual salary] 
from employee

--WHERE Condition:
---1. List the details about "Smith".
select * from EMPLOYEE where last_name = 'Smith';

--2. List out the employees who are working in department 20.
select * from EMPLOYEE where  department_id = 20;

---3. List out the employees who are earning salary between 2000 and 3000.
select * from EMPLOYEE where  salary  between 2000 and 3000;

---4. List out the employees who are working in department 10 or 20.
select * from EMPLOYEE where  department_id  in (10, 20);

--5. Find out the employees who are not working in department 10 or 30.
select * from EMPLOYEE where  department_id not  in (10, 30);

---6. List out the employees whose name starts with 'L'.
select * from EMPLOYEE where FIRST_NAME like 'l%';

--7. List out the employees whose name starts with 'L' and ends with 'E'.
select * from EMPLOYEE where FIRST_NAME like 'L%E' ;

----8. List out the employees whose name length is 4 and start with 'J'.
select * from EMPLOYEE where FIRST_NAME like 'J%' AND LEN(FIRST_NAME) = 4 ;

--9. List out the employees who are working in department 30 and draw the
----salaries more than 2500.
select * from EMPLOYEE where department_ID = 30 and salary > 2500

---10. List out the employees who are not receiving commission.
select * from EMPLOYEE where comm is null

---ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the
---Employee ID.
select  Employee_ID, Last_Name from Employee order by Employee_ID 

---2. List out the Employee ID and Name in descending order based on salary.
select  Employee_ID, Last_Name, salary from Employee order by salary  desc

----3. List out the employee details according to their Last Name in ascending-order.
select * from EMPLOYEE order by Last_Name

----4. List out the employee details according to their Last Name in ascending
----order and then Department ID in descending order
select * from EMPLOYEE order by Department_ID desc, Last_Name asc;

---GROUP BY and HAVING Clause:
---1. List out the department wise maximum salary, minimum salary and
---average salary of the employees.
select  max(salary) as [maximum salary], min(salary) as [minimum salary], avg(salary) as [average salary], department_id
from employee
group by department_id  

--2. List out the job wise maximum salary, minimum salary and average
--salary of the employees.
select  max(salary) as [maximum salary], min(salary) as [minimum salary], avg(salary) as [average salary], job_id
from employee
group by job_id  
--3. List out the number of employees who joined each month in ascending order.
select month(hire_date) as month join , count(employees)
--4. List out the number of employees for each month and year in
--ascending order based on the year and month.
SELECT 
    YEAR FROM hire_date AS hire_year,
    MONTH FROM hire_date AS hire_month
    from employee
GROUP BY 
    hire_year, hire_month
ORDER BY 
    hireyear ASC, hire_month ASC;

---5. List out the Department ID having at least four employees.
select DEPARTMENT_ID,COUNT(employee_id) as 'count of emp'
from EMPLOYEE
group by DEPARTMENT_ID
having COUNT(employee_id)> = 4

----6. How many employees joined in February month.
select count(employee_id) as 'totalempjoinedinfeb', month(hire_date) as monthcount from EMPLOYEE
where month(hire_date) = 2
group by month(hire_date)

--7. How many employees joined in May or June month.
select count(employee_id) as 'totalempjoinedinmayorjune', month(hire_date) as monthcount from employee
where month(hire_date) in (5,6)
group by month(hire_date)

---8. How many employees joined in 1985?
select count(employee_id) as 'totalempjoinedin1985', year(hire_date) as  year
from EMPLOYEE
group by year(hire_date)
having  year(HIRE_DATE) = 1985


----9. How many employees joined each month in 1985?
select year(hire_date) as year,MONTH(HIRE_DATE) as month,COUNT(employee_id) as count_id
from EMPLOYEE
group by year(hire_date),MONTH(HIRE_DATE)
having year(hire_date)=1985

---10. How many employees were joined in April 1985?
select year(hire_date) as year,MONTH(HIRE_DATE) as month,COUNT(employee_id) as count_id
from EMPLOYEE
group by year(hire_date),MONTH(HIRE_DATE)
having year(hire_date)=1985 and MONTH(hire_date) = 4

----11. Which is the Department ID having greater than or equal to 3 employees
---joining in April 1985?

select DEPARTMENT_ID,count(employee_id)
from EMPLOYEE
where year(hire_date) =1985 and MONTH(hire_date) =4
group by DEPARTMENT_ID
having count(employee_id)>=3







---Joins
--1. List out employees with their department names
select e.*, d.name from  employee  as e inner join department as d on e.Department_Id = d.Department_Id

---2. Display employees with their designation
select e.*, j.Designation from employee  as e inner join job as j on e.job_Id = j.job_Id

--3. Display the employees with their department names and city.
select e.*,d.name, l.city from employee  as e inner join department as d on e.Department_Id = d.Department_Id
inner join LOCATION as l
on d.Location_ID = l.Location_ID

--4. How many employees are working in different departments? Display with
---department names.
select count(EMPLOYEE_id) as 'num_emplo', d.name from employee as e  join DEPARTMENT as d
on d.department_id = e.DEPARTMENT_ID
group by d.name

---5. How many employees are working in the sales department?
select count(EMPLOYEE_id) as 'num_emplo', d.name from  employee as e  join DEPARTMENT as d
on d.department_id = e.DEPARTMENT_ID
where d.name = 'sales'
group by d.name


--6. Which is the department having greater than or equal to 3
--employees and display the department names in
--ascending order.
select count(e.employee_id) as 'num_employee',d.name from department d 
join employee e
on d.Department_Id = e.DEPARTMENT_ID
group by d.name
having count(e.employee_id) >=3
order by d.name

---7. How many employees are working in 'Dallas'?
select count(e.employee_id) as 'totalemployee',d.name from employee e
join DEPARTMENT d 
on e.DEPARTMENT_ID = d.Department_Id
join LOCATION l on l.Location_ID = d.Location_Id
where l.City = 'dallas'
group by d.name


8. Display all employees in sales or operation departments

select * from employee e join DEPARTMENT d 
on e.DEPARTMENT_ID = d.Department_Id
where d.name in ('sales' ,'operation')




---CONDITIONAL STATEMENT
--1. Display the employee details with salary grades. Use conditional statement to
---create a grade column.
select 
employee_id,
first_name,
salary,
case
when salary >=2500 then 'a'
when salary >=2500 and salary<2500 then 'b'
when salary >=800 and salary<200 then 'c'
else 'd'
end as grade 
from 
employee;


---2. List out the number of employees grade wise. Use conditional statement to
---create a grade column.
select
grade,
count(*) as num_employe
from (
select
EMPLOYEE_ID,
first_name,
salary,
case
when salary >=2500 THEN 'a'
when salary >=2000 and salary<2500 then 'b'
when salary >=800 and salary<2000 then 'c'
else 'd'
end as grade 
from 
employee
) as grade_table
group by grade

--3. Display the employee salary grades and the number of employees between
---2000 to 5000 range of salary
select salary,grade,count(*) as num_employee
from EMPLOYEE
where salary between 2000 and 5000
group by salary,grade



Subqueries:
--1. Display the employees list who got the maximum salary.
SELECT * 
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

--2. Display the employees who are working in the sales department.
SELECT * 
FROM employee
WHERE department_id = (SELECT department_id FROM department where name='sales');

----3. Display the employees who are working as 'Clerk'.
SELECT * 
FROM employee
WHERE Job_ID = (SELECT Job_ID FROM Job where Designation='Clerk');


---4. Display the list of employees who are living in 'Boston'.
SELECT count(EMPLOYEE_ID)
FROM employee
where department_id in (select department_id from department where location_id in 
( select location_id from location where city ='boston'))

---5. Find out the number of employees working in the sales department.
select count(*) as 'number of employee' from EMPLOYEE
where DEPARTMENT_ID = ( select DEPARTMENT_ID from DEPARTMENT where name = 'sales')


---6. Update the salaries of employees who are working as clerks on the basis of
---10%
select * from job

update employee
set salary = salary * 1.1
where job_id = (select job_id from job where designation = 'clerk')

.
--7. Display the second highest salary drawing employee details.
select * from EMPLOYEE 
where salary = ( select max(salary) from employee 
where salary<(select max(salary) from employee)
);
---8. List out the employees who earn more than every employee in department 30.

select * from employee
where salary > all(select salary from EMPLOYEE where DEPARTMENT_ID = 30)

--9. Find out which department has no employees.
select DEPARTMENt_id,name from DEPARTMENT
where DEPARTMENT_id not in (select department_id from EMPLOYEE)
select * from DEPARTMENT

--10. Find out the employees who earn greater than the average salary for
--their department.
select * from employee e where salary >
( select avg(salary) from employee 
where department_id = e.department_id)

