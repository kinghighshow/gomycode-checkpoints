create database Checkpoint__5 
go

use Checkpoint__5
go 

--1. Implement the provided relation model using SQL ( DDL part )

create table customer(
Customer_id int primary key,
Customer_Name varchar(30),
Customer_Tel varchar (30) 
);
go

create table Product(
Product_id int primary key,
Product_Name varchar(30),
Category varchar(30),
Price float
);
go

Create TABLE Orders (
 PRIMARY KEY (Customer_id, Product_id),
 Customer_id INT foreign key references Customer(Customer_id),
 Product_id INT foreign key references Product(Product_id),
 OrderDate DATE,
 quantity INT,
 total_amount DECIMAL 
);
go

--2. Insert data into your tables ( DML part )

INSERT INTO Customer (Customer_id, customer_Name, customer_Tel)
VALUES
    (1, 'John Doe', '555-123-4567'),
    (2, 'Jane Smith', '555-987-6543'),
    (3, 'Alice Johnson', '555-555-5555'),
    (4, 'Robert Brown', '555-111-2222'),
    (5, 'Emily White', '555-333-4444'),
    (6, 'Michael Lee', '555-666-7777'),
    (7, 'Olivia Green', '555-888-9999'),
    (8, 'William Turner', '555-444-3333'),
    (9, 'Sophia Adams', '555-777-8888'),
    (10, 'Daniel Harris', '555-222-1111'),
    (11, 'Ava Martinez', '555-666-5555'),
    (12, 'Ethan Clark', '555-999-0000'),
    (13, 'Isabella Hall', '555-555-7777'),
    (14, 'James Rodriguez', '555-333-2222'),
    (15, 'Lily Parker', '555-888-4444');
	go

INSERT INTO Product (Product_id, product_name, category, Price)
VALUES
    (101, 'Widget A', 'widget', 19.99),
    (102, 'Gizmo B', 'Gadgets', 12.49),
    (103, 'Thingamajig C', 'Doohickey', 9.99),
    (104, 'Doodad X', 'Doohickey', 7.99),
    (105, 'Whatchamacallit Y', 'Electronics', 29.99),
    (106, 'Doohickey Z', 'Gadgets', 14.99),
    (107, 'Sprocket S', 'widget', 11.49),
    (108, 'Gadgetron G', 'Accessories', 8.99),
    (109, 'Contraption Q', 'Electronics', 24.99),
    (110, 'Thingummy W', 'Gadgets', 17.49),
    (111, 'Gizmometer M', 'Doohickey', 13.99),
    (112, 'Widgetizer P', 'widget', 10.49),
    (113, 'Doodadtron R', 'Electronics', 27.99),
    (114, 'Whatchamacallotron T', 'Gadgets', 19.49),
    (115, 'Thingamajigatron U', 'Doohickey', 15.99);
	go

	INSERT INTO Orders (Customer_id, Product_id, OrderDate, quantity, total_amount)
VALUES
    (1, 101, '2024-05-01', 2, 39.98),
    (2, 102, '2024-05-02', 3, 37.47),
    (3, 103, '2024-05-03', 1, 9.99),
    (4, 104, '2024-05-04', 5, 39.95),
    (5, 105, '2024-05-05', 2, 59.98),
    (6, 106, '2024-05-06', 4, 59.96),
    (7, 107, '2024-05-07', 1, 11.49),
    (8, 108, '2024-05-08', 3, 26.97),
    (9, 109, '2024-05-09', 2, 49.98),
    (10, 110, '2024-05-10', 1, 17.49),
    (11, 111, '2024-05-11', 3, 41.97),
    (12, 112, '2024-05-12', 4, 41.96),
    (13, 113, '2024-05-13', 2, 55.98),
    (14, 114, '2024-05-14', 1, 19.49),
    (15, 115, '2024-05-15', 5, 79.95);
	go

--3. Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product.

Select customer.Customer_Name, Product.Category,orders.quantity, orders.total_amount
from customer
join Orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE Product.category in ('Gadgets', 'widget') and Orders.quantity >= 1
go

--4. Write a query to retrieve the names of the customers who have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer.

Select customer.Customer_Name, Product.Category,orders.quantity, orders.total_amount
from customer
join Orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE Product.category in ('widget') and Orders.quantity >= 1;

--5. Write a query to retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.

Select customer.Customer_Name, Product.Category,orders.quantity, orders.total_amount
from customer
join Orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE Product.category in ('Gadgets') and Orders.quantity >= 1;

--6. Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.

Select customer.Customer_Name, Product.Category,orders.quantity, orders.total_amount
from customer
join Orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE Product.category in ('Doohickey') and Orders.quantity >= 1;

--7. Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.
Select customer.Customer_Name, Product.Category,orders.quantity, orders.total_amount
from customer
join Orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE Product.category in ('Gadgets', 'widget') 
order by customer.Customer_Name asc;
go

--8. Write a query to retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.

Select  count(Customer.Customer_id)as No_of_customers_who_ordered_product , Product.Product_Name, orders.quantity
from customer
join orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
WHERE  customer.Customer_id >= 1
group by Product_Name, orders.quantity
go

-- 9. Write a query to retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.

Select Customer.Customer_Name, count(Product.Product_id) as number_of_orders_placed, orders.quantity
from customer
join orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
group by customer.Customer_Name, orders.quantity
order by number_of_orders_placed desc
go
-- 10. Write a query to retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.

Select Product.Product_Name, count(Orders.Product_id) as number_of_times_ordered, count(orders.quantity)as quantity_of_Product_ordered
from customer
join orders on Orders.Customer_id=customer.Customer_id
join Product on Orders.Product_id=Product.Product_id
group by Product.Product_Name, orders.quantity
order by number_of_times_ordered desc
go

-- 11. Write a query to retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.

Select customer.Customer_Name, count(Orders.OrderDate) as number_of_times_ordered_weekly, count(orders.quantity)as quantity_of_Product_ordered
from customer
join orders on Orders.Customer_id=customer.Customer_id
group by customer.Customer_Name
Having count(Orders.OrderDate)=7

