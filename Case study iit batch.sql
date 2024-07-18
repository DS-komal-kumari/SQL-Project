create database casestudy2

use casestudy2

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

Select * from LOCATION
select * from job
select * from DEPARTMENT
select * from EMPLOYEE

--Simple Queries:
--1. List all the employee details.

select * from EMPLOYEE

--2. List all the department details.

select * from DEPARTMENT

--3. List all job details.

select * from JOB

--4. List all the locations.

select * from LOCATION

--5. List out the First Name, Last Name, 
--Salary, Commission for all Employees.

select FIRST_NAME,LAST_NAME,SALARY,COMM
from EMPLOYEE

--6. List out the Employee ID, Last Name, 
--Department ID for all employees and
--alias
--Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".

select EMPLOYEE_ID as [ID of the Employee],LAST_NAME as [Name of the
Employee],DEPARTMENT_ID as Dep_id
from EMPLOYEE

--7. List out the annual salary of the employees with their names only

select * from EMPLOYEE

select SALARY*12 as 'annual salary',FIRST_NAME,LAST_NAME
from EMPLOYEE

--WHERE Condition:

--1. List the details about "Smith".

select * from EMPLOYEE
where LAST_NAME ='smith'

--2. List out the employees who are working in department 20.

select * from EMPLOYEE
where DEPARTMENT_ID = 20

--3. List out the employees who are earning salary between 2000 and 3000.

select * from EMPLOYEE

select * from EMPLOYEE
where SALARY between 2000 and 3000

--4. List out the employees who are working in department 10 or 20.

select * from EMPLOYEE
where DEPARTMENT_ID in (10,20)


--5. Find out the employees who are not working in department 10 or 30.

select * from EMPLOYEE
where DEPARTMENT_ID not in (10,30)

--6. List out the employees whose name starts with 'L'.

select * from EMPLOYEE
where FIRST_NAME like 'L%'


--7. List out the employees whose name starts with 'L' and ends with 'E'.

select * from EMPLOYEE
where FIRST_NAME Like 'L%E'

--8. List out the employees whose name length is 4 and start with 'J'.

select * from EMPLOYEE
where FIRST_NAME like 'J%' and LEN(first_name) = 4


--9. List out the employees who are working in department 30 and draw the
--salaries more than 2500.
select * from EMPLOYEEwhere DEPARTMENT_ID=30 and SALARY>2500 --10. List out the employees who are not receiving commission.select * from EMPLOYEEwhere comm is NULL--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the
--Employee ID.

select EMPLOYEE_ID,LAST_NAME
from EMPLOYEE
order by EMPLOYEE_ID


--2. List out the Employee ID and Name in descending order based on salary.

select EMPLOYEE_ID,LAST_NAME,first_name,SALARY
from EMPLOYEE
order by SALARY desc

select EMPLOYEE_ID, FIRST_NAME+ ' ' +LAST_NAME as NAME, SALARY from EMPLOYEE order by  SALARY DESC


--3. List out the employee details according to their Last Name in ascending-order.

select * from EMPLOYEE
order by LAST_NAME 

--4. List out the employee details according to their Last Name in ascending
--order and then Department ID in descending order.select * from EMPLOYEEorder by LAST_NAME asc,DEPARTMENT_ID descselect * from EMPLOYEEorder by DEPARTMENT_ID desc,LAST_NAME asc--GROUP BY and HAVING Clause:
--1. List out the department wise maximum salary, minimum salary and
--average salary of the employees.

select max(salary) as 'max salary' ,min(salary) as min_salary ,avg(salary) as avg_salary,DEPARTMENT_ID
from EMPLOYEE
group by DEPARTMENT_ID

--2. List out the job wise maximum salary, minimum salary and average
--salary of the employees.


select max(salary) as 'max salary' ,min(salary) as min_salary ,avg(salary) as avg_salary,JOB_ID
from EMPLOYEE
group by JOB_ID


--3. List out the number of employees who joined each month in ascending order.

select MONTH(hire_date) as monthofjoining,count(employee_id) as numberofcount
from EMPLOYEE
group by MONTH(hire_date)
order by MONTH(hire_date)

--4. List out the number of employees for each month and year in
--ascending order based on the year and month.

select Year(Hire_Date) as Year, month(Hire_Date) as Month, count(Employee_Id) as No_Of_Emp       from employeegroup by year(hire_date), month(Hire_Date)
order by  year(hire_date), month(Hire_Date)

--5. List out the Department ID having at least four employees.

select DEPARTMENT_ID,COUNT(employee_id) as 'count of emp'
from EMPLOYEE
group by DEPARTMENT_ID
having COUNT(employee_id)> = 4

select * from EMPLOYEE

--6. How many employees joined in February month.

select COUNT(employee_id) as 'totalempjoinedinfeb',month(HIRE_DATE) as mounthcount
from EMPLOYEE
where 
month(HIRE_DATE) = 2
group by month(HIRE_DATE) 


--7. How many employees joined in May or June month.

select count(employee_id) as "Tot Emp Joined"
from EMPLOYEE 
where month(HIRE_DATE) in (5,6);

--8. How many employees joined in 1985?

select year(hire_date),count(employee_id)
from EMPLOYEE
group by year(hire_date)
having year(hire_date)= 1985


--9. How many employees joined each month in 1985?

select year(hire_date) as year,MONTH(HIRE_DATE) as month,COUNT(employee_id) as count_id
from EMPLOYEE
group by year(hire_date),MONTH(HIRE_DATE)
having year(hire_date)=1985

--10. How many employees were joined in April 1985?

select year(hire_date) as year,MONTH(HIRE_DATE) as month,COUNT(employee_id) as count_id
from EMPLOYEE
group by year(hire_date),MONTH(HIRE_DATE)
having year(hire_date)=1985 and MONTH(hire_date) = 4

--11. Which is the Department ID having greater than or equal to 3 employees
--joining in April 1985?select DEPARTMENT_ID,count(employee_id)from EMPLOYEEwhere year(hire_date) =1985 and MONTH(hire_date) =4group by DEPARTMENT_IDhaving count(employee_id)>=3--Joins:
--1. List out employees with their department names.

select E.*,D.Name
from EMPLOYEE E
inner join 
DEPARTMENT D
on 
E.DEPARTMENT_ID=D.Department_Id

select * from DEPARTMENT
--2. Display employees with their designations.

select E.*,J.Designation
from EMPLOYEE E
inner join
Job J
on
E.JOB_ID=J.Job_ID


--3. Display the employees with their department names and city.

select E.*,D.Name,L.Location_ID
from EMPLOYEE E
inner join
DEPARTMENT D
on
E.DEPARTMENT_ID=D.Department_Id
inner join
LOCATION L
on
L.Location_ID=D.Location_Id


--4. How many employees are working in different departments? Display with
--department names.