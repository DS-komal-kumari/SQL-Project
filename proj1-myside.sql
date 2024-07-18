CREATE DATABASE adventureworks
USE adventureworks2012
3. Perform the following with help of the above database:

--a. Get all the details from the person table including email ID, phone
--number and phone number type
select * from [Person].[Person]--name P
select * from [Person].[EmailAddress]---emailid PE
select * from [Person].[PersonPhone]---- phonenum PP
select * from [Person].[PhoneNumberType]----phonenumtype PNT

select P.FIRSTNAME, P.LASTNAME, PE.emailAddressid, PP.phonenumber, PNT.NAME FROM [Person].[Person] P
INNER JOIN [Person].[EmailAddress] PE ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN [Person].[PersonPhone] PP ON PE.BusinessEntityID = PP.BusinessEntityID
INNER JOIN [Person].[PhoneNumberType] PNT ON PP.PhoneNumberTypeid = PNT.PhoneNumberTypeid


---b. Get the details of the sales header order made in May 2011

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE  DATENAME(YEAR,OrderDate)= 2011 AND DATENAME(MONTH,OrderDate)= 'MAY' 



--c. Get the details of the sales details order made in the month of May
--2011
select * from [sales].[salesorderDetail] SD INNER JOIN [Sales].[SalesOrderHeader] SH
ON SD.SalesOrderID = SH.SalesOrderID
WHERE  DATENAME(YEAR,OrderDate)= 2011 AND DATENAME(MONTH,OrderDate)= 'MAY' 

--d. Get the total sales made in May 
SELECT * FROM [sales].[SalesOrderDetail]
SELECT  SUM(LineTotal) FROM sales.[SalesOrderDetail] SD INNER JOIN  [Sales].[SalesOrderHeader] SH
ON SD.SalesOrderID = SH.SalesOrderID
WHERE  DATENAME(YEAR,SH.OrderDate)= 2011 AND DATENAME(MONTH,SH.OrderDate)= 'MAY' 


e. Get the total sales made in the year 2011 by month order by
increasing
SELECT  SUM(LineTotal) as total_sales FROM sales.[SalesOrderDetail] SD INNER JOIN  [Sales].[SalesOrderHeader] sh
ON SD.SalesOrderID = SH.SalesOrderID
WHERE  DATENAME(YEAR,SH.OrderDate)= 2011
GROUP BY MONTH(OrderDate) 
ORDER BY total_sales

f. Get the total sales made to the customer with FirstName='Gustavo'
anD LASTNAME = 'Ahong'

