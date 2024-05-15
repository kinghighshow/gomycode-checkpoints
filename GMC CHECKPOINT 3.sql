CREATE DATABASE CHECKPOINT_3
GO

USE CHECKPOINT_3
GO

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