-- List the Product Code, Product Name and Buy Price in ‘products’ table in descending order of the ‘buyPrice’
select productCode, productName, buyPrice 
from products
order by buyPrice DESC;


-- List the country, state and customerName in order of country, and then state within state the name of customers should be descending order from ‘customers’ table.
select country, state, customerName
from customers
order by country, state, customerName DESC;


-- List the productName and TotalAmount of products from the ‘products’ table in descending order. (Total Amount is product of Stock of Product multiplied by Buy Price of the product.)
Select productName, quantityinstock * buyPrice AS TotalAmount
from products 
Order by  TotalAmount desc;


-- Find First Name, Last Name, JobTitle and Extension number of employees who have extension number ‘x102’
Select firstName, lastName, jobTitle, extension 
from employees 
where extension = 'x102'


-- Find first name and last name of customers whose customer number is less than 200 and is from New York state
Select contactfirstname, contactLastName, customerNumber, state 
from customers 
where customernumber < '200' and state = "NY"


-- Find first name and last name of customers whose customer number is less than 200 and is from New York state or Norway country.
Select contactfirstname, contactLastName, customerNumber, state, country 
from customers 
where customernumber < '200' and state = "NY" or country = "Norway"

--  Find the orderNumber and orderAmount of all orders above $10000;
Select orderNumber, quantityOrdered * priceEach AS orderAmount 
from orderdetails 
Where quantityOrdered * priceEach > "10000";


-- Find the contactFirstName, contactLastName, phone, city and state of all customers from state of New York or California.
Select contactfirstname, contactLastName, phone, city, state 
from customers 
where state = "NY" or state = "CA";


-- Repeat the above query by sorting in by state in ascending order and then by city in descending order.
Select contactfirstname, contactLastName, phone, city, state 
from customers 
where state = "NY" or state = "CA"
order by state, city desc;


-- Find all order details in which the quantity ordered in between 22 and 25.
select * from orderdetails 
where quantityOrdered between '22' and '25';


-- Find all payments made in which the amount is between 10000 and 13000.
 Select * from payments 
 where amount between 10000 and 13000;
 
 
 -- Repeat the above query and sort the result by paymentDate.
select * from payments 
where amount between 10000 and 13000 
order by paymentDate;


-- List customerNumber, contactFirstName, contactLastName, phone of all customers whose name starts with ‘W’
select customerNumber, contactFirstName, contactLastName, phone 
from customers 
where contactFirstName like 'w%';


-- List customerNumber, contactFirstName, contactLastName, phone of all customers whose name ends with ‘a’
select customerNumber, contactFirstName, contactLastName, phone 
from customers 
where contactLastName like '%a';


-- List customerNumber, contactFirstName, contactLastName, phone of all customers whose name contains ‘ea’
select customerNumber, contactFirstName, contactLastName, phone 
from customers 
where contactfirstName like '%ea%' or contactlastName like '%ea%';


-- List customerNumber, contactFirstName, contactLastName, phone of all customers whose name has ‘t’ as third character.
select customerNumber, contactFirstName, contactLastName, phone 
from customers 
where contactfirstName like '__t%' ;


-- List customerNumber, contactFirstName, contactLastName, phone of all customers whose name as ‘t’ as third character and ends with ‘e’
select customerNumber, contactFirstName, contactLastName, phone 
from customers 
where contactfirstName like '__t%e';


-- List productCode, productName of all products whose productCode contains ‘12_1’
select productCode, productName 
from products 
where productCode LIKE '%12_1%'


-- Select the distinct customer numbers from payments table who have made any payment
select distinct(customernumber) from payments 


-- List all distinct cities from France which have customers in the customers table
select distinct(city), country 
from customers where country = 'France';


-- List all distinct cities from France which have customers in the customers table and the result should be arranges alphabetically.
select distinct(city), country 
from customers 
where country = 'France' 
order by city;


-- Count from how many cities of France, we have customers from, in the customers table.
select count(distinct(city)), country 
from customers where country = 'France' ;


-- Count from how many cities of France, we have customers from, in the customers table and rename the column as “No of Cities”
select count(distinct(city)) AS No_of_cities, country 
from customers where country = 'France' ;


-- Write a query to find out number of sales representatives in the company as “No of Sales Representative”
select count(distinct(employeeNumber)) AS No_of_sales_representative 
from employees;


-- Write a query to find different productLines available in the products table sorted in ascending order
select distinct(productLine) 
from products 
order by productLine ;


-- Write a query to list top 5 payments from payments table
select * from payments 
order by amount DESC Limit 5;


-- Write a query to list top 3 payments from payments table whose check number start with alphabet M
select * from payments 
where checkNumber like 'M%' order by amount DESC Limit 3;


-- Find all offices details in which the state is null.
select * from offices 
where state is NULL