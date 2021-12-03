CREATE DATABASE salescampany;

USE salescompany

CREATE TABLE salespeople
(sname VARCHAR(20) UNIQUE,
snum INT PRIMARY KEY,
city VARCHAR(20),
comm INT);

INSERT INTO salespeople VALUES
('Peel', 1001, 'London', 12)
('Serres', 1002, 'Sanjose', 13)
('Motika', 1004, 'London', 11)
('Rifkin', 1007, 'Barcelona', 15)
('Axelrod', 1003, 'Newyork', 10);

CREATE TABLE customers
(cnum INT PRIMARY KEY,
cname VARCHAR(20),
city VARCHAR(10) NOT NULL,
snum INT,
FOREIGN KEY (snum) REFERENCES salespeple(snum) ON DELETE SET NULL);


INSERT INTO customers VALUES
(2001,'Hoffman','London',1001)
(2002,'Giovanni','Rome',1003)
(2003,'Liu','Sanjose',1002)
(2004,'Grass','Berlin',1002)
(2006,'Clemens','London',1001)
(2008,'Cisneros','Sanjose',1007)
(2007,'Pereira','Rome',1004);

CREATE TABLE orders
(onum INT PRIMARY KEY,
amt FLOAT(10,2),
odate DATE,
cnum INT,
snum INT,
FOREIGN KEY(cnum) REFERENCES customers(cnum) ON DELETE SET NULL,
FOREIGN KEY(snum) REFERENCES salespeople(snum) ON DELETE SET NULL);

INSERT INTO orders VALUES
(3001,18.69,'1990-10-3',2008,1007)
(3003,767.19,'1990-10-3',2001,1001)
(3002,1900.10,'1990-10-3',2007,1004)
(3005,5160.45,'1990-10-3',2003,1002)
(3006,1098.16,'1990-10-3',2008,1007)
(3009,1713.23,'1990-10-4',2002,1003)
(3007,75.75,'1990-10-4',2004,1002)
(3008,4273.00,'1990-10-5',2006,1001)
(3010,1309.95,'1990-10-6',2004,1002)
(3011,9891.88,'1990-10-6',2006,1001);

Q1) Count the number of Salesperson whose name begin with ‘a’/’A’.
Sol.SELECT LEFT(sname,1),COUNT(LEFT(sname,1)) FROM salespeople WHERE LEFT(sname,1) LIKE '%A' OR LEFT(sname,1) LIKE '%a';

Q2) Display all the Salesperson whose all orders worth is more than Rs. 2000
Sol.SELECT salespeople.sname, orders.snum, orders.amt from orders,salespeople WHERE orders.amt>2000 AND orders.snum=salespeople.snum;

Q3) Count the number of Salesperson belonging to Newyork.
Sol.SELECT sname,city,COUNT(sname) FROM salespeople WHERE city = 'newyork';

Q4) Display the number of Salespeople belonging to London and belonging to Paris
Sol.SELECT *  FROM salespeople WHERE city = 'London'AND city = 'Paris';
    SELECT *  FROM salespeople WHERE city = 'London' OR city = 'Paris';

Q5) Display the number of orders taken by each Salesperson and their date of orders.
Sol.SELECT DISTINCT orders.snum, salespeople.sname, COUNT(onum) FROM orders,salespeople WHERE orders.snum = salespeople.snum GROUP BY salespeople.snum;