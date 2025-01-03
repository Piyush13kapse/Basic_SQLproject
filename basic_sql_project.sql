create database basic_project;
use basic_project;


create table customers
(customerid int primary key ,Name varchar(100), age int,  gender varchar(100), location varchar(50) , Date date );
create table productes
(productid  int primary key , productname varchar (100) , catagory  varchar(100), price varchar(50)  );
create table saleq
(salesid  int primary key , customerid  int, productid  int, salesdate date , quantity int , totalamount decimal(10,2)  );

insert into customers 
(customerid  ,Name , age ,  gender , location  , Date  )
values
(1, "piyush", 20 , "male", "Nagpur", "2024-12-21"),
(2, "akhil", 22, "female", "Mumbai", "2024-12-22"),
(3, "cp", 29 , "male", "Dwlhi", "2024-12-23");

insert into productes
(productid   , productname , catagory  , price  )
values
(101, "Laptop", "electronic" , 20000 ),
(102, "Laptop", "electronic", 30000),
(103, "Tshit","Cloths" ,5000);

insert into saleq
(salesid  , customerid  , productid  , salesdate  , quantity  , totalamount)
values
(1, 1,101 , '2024-02-12',4,20000 ),
(2, 2, 103,'2024-03-22',5 ,30000),
(3, 3,102,'2024-04-14',6 ,5000);

-- Q1. calculate the total revenu generated from sales 
select sum(totalamount) as totalrevenu from sales;

-- Q2 identify the top selling products 
 select productes.productname , sum(saleq.quantity) as totalquantity from saleq 
 join
 productes on saleq.productid = productes.productid 
 group by productes.productname 
 order by totalquantity desc
 limit 1
 ;
 
 -- Q3 find the total spending each coustomer
 
select customers.Name , sum(saleq.totalamount) as totalspend
from customers
join 
saleq on customers.customerid = saleq.customerid
group by customers.Name
order by totalspend desc
limit 1
;

 --  Q4 find enveneu by months 
 select extract(month from salesdate) as months , sum(totalamount) as monthlyrevenu from sales
 group by months 
 ;
 
 -- Q5 find region wise sales 
 select c.location , sum(s.totalamount) as totalrevenu from customers c 
 join 
 saleq s on c.customerid  = s.customerid  
 group by c.location
 order by totalrevenu desc
 limit 1 
 ;
 
 
 
 
 
 


