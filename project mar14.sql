use [AdventureWorks2012]

---Perform the following with help of the above database:

--a. Get all the details from the person table including email ID, phone
--number and phone number type
select * from [Person].[Person]---name
select * from [Person].[EmailAddress]---email
select * from [Person].[PersonPhone]--phone no
 
select P.firstname,P.lastname,E.emailaddress,PH.phonenumber,pht.name from
person.person P
inner join person.EmailAddress E on P.BusinessEntityID=E.BusinessEntityID
inner join person.PersonPhone PH on ph.BusinessEntityID=E.BusinessEntityID
inner join person.PhoneNumberType PHT on 
pht.PhoneNumberTypeID=ph.PhoneNumberTypeID


--b. Get the details of the sales header order made in May 2011
select * from sales.SalesOrderHeader where OrderDate between('2011-05-01') and('2011-05-31')
--or
SELECT * FROM Sales.SalesOrderHeader WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2011;
--or
select *from [Sales].[SalesOrderHeader]
where datename(year,orderdate)=2011 and datename(month,orderdate)='May';

--c. Get the details of the sales details order made in the month of May 2011
select * from [Sales].[SalesOrderDetail]
select * from [Sales].[SalesOrderHeader]

select * from sales.SalesOrderDetail SD
inner join sales.SalesOrderHeader SH on SD.SalesOrderID=Sh.SalesOrderID
where sh.OrderDate between ('2011-05-01') and ('2011-05-31')

--or

SELECT * FROM Sales.SalesOrderDetail o join Sales.SalesOrderHeader d 
on o.SalesOrderID = d.SalesOrderID WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2011;

--d. Get the total sales made in May 2011
select * from Sales.[SalesOrderDetail]

select sum(linetotal) as total_sales from sales.SalesOrderDetail sd
inner join sales.SalesOrderHeader sh on SD.SalesOrderID=Sh.SalesOrderID
where sh.OrderDate between ('2011-05-01') and ('2011-05-31')

--e. Get the total sales made in the year 2011 by month order by increasing sales
--may month but for all the months of 2011

select sum(linetotal) as total_sales, month(orderdate) as salesmonth from 
sales.SalesOrderDetail sd inner join sales.SalesOrderHeader sh
on sd.SalesOrderID=sh.SalesOrderID
where year(orderdate)=2011
group by month(orderdate)
order by total_sales

--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'
select * from [Sales].[Customer]
select * from [Person].[Person] where FirstName='gustavo'

select firstname,lastname,sum(linetotal) as totalsales from person.person p
inner join sales.Customer c on
p.BusinessEntityID=c.PersonID
inner join sales.SalesOrderHeader sh
on sh.customerid=c.CustomerID
inner join sales.SalesOrderDetail sd on sd.SalesOrderID=sh.SalesOrderID
where p.FirstName='gustavo' and p.LastName='achong'
group by p.BusinessEntityID,p.FirstName,p.LastName
