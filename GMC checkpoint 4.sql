CREATE DATABASE Checkpoint_4 
go

use CHECKPOINT_4
go

CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	ADDRESS VARCHAR(30) NOT NULL
);
GO

CREATE TABLE PRODUCTS (
	PRODUCT_ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	PRICE DECIMAL(6,2) CHECK(PRICE>0)NOT NULL
);
GO

CREATE TABLE ORDERS(
	ORDER_ID INT PRIMARY KEY NOT NULL,
	CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMERS(CUSTOMER_ID) NOT NULL,
	PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCTS(PRODUCT_ID) NOT NULL,
	QUANTITY INT NOT NULL,
	ORDER_DATE DATE NOT NULL
);
GO 

--inserting values into the tables
insert into PRODUCTS
values 
(1, 'cookies', '10'),
(2, 'candy', '5.2')

insert into CUSTOMERS
values
(1,'Ahmed', 'Tunisia'),
(2, 'Coulibaly', 'Senegal'),
(3, 'Hasan', 'Egypt')

insert into ORDERS
values 
(1,1,2,3,'2023-01-22'),
(2,2,1,10,'2023-04-14')
go


--updating the quantity of the second order 
update orders
set quantity = 6
where order_id = 2
go

--deleting the third customer from customer table 

delete from CUSTOMERS
where CUSTOMER_ID = 3

--deletingtable content and dropping table 
delete from ORDERS;

drop table ORDERS
go