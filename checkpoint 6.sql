create database Checkpoint__6
go 

use Checkpoint__6

--1. Convert the given entity-relationship diagram into a relational model.

-- Google Docs link (https://docs.google.com/document/d/1kAJQnAhRe0uGrv6NSpetnmrW_qerZ4gaA_ct2-QfOGo/edit?usp=sharing)

--2. Implement the relational model using SQL.

CREATE TABLE Wine (
    NumW int Primary Key,
    Category varchar(30),
    Year int,
    Degree int
);
go

CREATE TABLE Producer (
    NumP int Primary Key,
    FirstName varchar(30),
    LastName varchar(30),
    Region varchar(30)
);
go

CREATE TABLE Harvest (
	Primary key ( NumW,NumP),
    NumW int foreign key references Wine(NumW),
    NumP int foreign key references Producer(NumP),
    Quantity int
);
go

--3. Insert data into the database tables.

INSERT INTO Wine (NumW, Category, Year, Degree)
VALUES
    (1, 'Red', 2015, '23'),
    (2, 'White', 2018, '43'),
    (3, 'Rosé', 2020, '23'),
    (4, 'Red', 2017, '23'),
    (5, 'White', 2019, '2'),
    (6, 'Red', 2016, '54'),
    (7, 'Rosé', 2021, '6'),
    (8, 'White', 2022, '43'),
    (9, 'Red', 2019, '78'),
    (10, 'White', 2016, '6'),
	(11, 'Red', 2023, '3'),
    (12, 'White', 2022, '12'),
    (13, 'Rosé', 2021, '14');

INSERT INTO Producer (NumP, FirstName, LastName, Region)
VALUES
    (101, 'John', 'Smith', 'Sousse'),
    (102, 'Maria', 'Garcia', 'Bordeaux'),
    (103, 'Robert', 'Lee', 'Tuscany'),
    (104, 'Sophie', 'Martin', 'Champagne'),
    (105, 'David', 'Nguyen', 'Sousse'),
    (106, 'Emma', 'Brown', 'Rioja'),
    (107, 'Michael', 'Kim', 'Mosel'),
    (108, 'Olivia', 'Wang', 'Sousse'),
    (109, 'William', 'Lopez', 'Piedmont'),
    (110, 'Emily', 'Chen', 'Stellenbosch'),
	(111, 'Laura', 'Rodriguez', 'Sonoma County'),
    (112, 'Daniel', 'Kim', 'Sousse'),
    (113, 'Sophia', 'Chen', 'Margaret River');

INSERT INTO Harvest (NumW, NumP, Quantity)
VALUES
    (1, 101, 500),
    (2, 102, 300),
    (3, 103, 700),
    (4, 104, 400),
    (5, 105, 600),
    (6, 106, 350),
    (7, 107, 550),
    (8, 108, 250),
    (9, 109, 450),
    (10, 110, 400),
	(11, 111, 350),
    (12, 112, 200),
    (13, 113, 450);
go

--4. Give the list the producers.

select concat(Producer.FirstName,' ', Producer.LastName) as Names_of_Producers
from Producer

--5. Give the list of producers sorted by name.

select concat(Producer.FirstName,' ', Producer.LastName) as Names_of_Producers
from Producer
order by Names_of_Producers asc

--6. Give the list the producers of Sousse.

select concat(Producer.FirstName,' ', Producer.LastName) as Names_of_Producers , Producer.Region
from Producer
where Region = 'Sousse'

--7. Calculate the total quantity of wine produced having the number 12.
select Wine.NumW, sum(Harvest.Quantity) as Total_quantity_Produced
from wine
join Harvest on wine.NumW = Harvest.NumW
where wine.NumW = 12
group by wine.NumW

--8. Calculate the quantity of wine produced by category.
select Wine.Category, sum(Harvest.Quantity) as Quantity
from wine
join Harvest on Wine.NumW=Harvest.NumW
group by Category

--9. Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order.

SELECT concat(producer.FirstName, ' ', Producer.LastName) as Producer_name, Producer.Region, harvest.Quantity
from Producer
join Harvest on Producer.NumP=Harvest.NumP
where Producer.Region = 'sousse'
group by Region, harvest.Quantity, concat(producer.FirstName, ' ', Producer.LastName)
Having Harvest.Quantity > 300
order by Producer_name asc

--10. List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24. 

select harvest.NumW as wine_number, Harvest.NumP as Producer_number, wine.Degree
from wine
join harvest on wine.NumW=Harvest.NumW
where wine.degree > 12 and Harvest.NumP = 24


