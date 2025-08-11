-- 1. Create Database
CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;

-- 2. Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 3. Insert Data
INSERT INTO Customers (name, email, city) VALUES
('Aryan Gupta', 'aryan@example.com', 'Delhi'),
('Riya Sharma', 'riya@example.com', 'Mumbai'),
('Karan Singh', 'karan@example.com', 'Bangalore');

INSERT INTO Products (name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Smartphone', 'Electronics', 20000),
('Headphones', 'Accessories', 2000);

INSERT INTO Orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2025-08-01'),
(2, 2, 2, '2025-08-02'),
(3, 3, 3, '2025-08-03'),
(1, 3, 1, '2025-08-04');

-- 4. Queries for Analysis

-- a) View all orders with customer and product details
SELECT o.order_id, c.name AS customer, p.name AS product, o.quantity, o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- b) Total revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- c) Most purchased product
SELECT p.name, SUM(o.quantity) AS total_quantity
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;

-- d) Orders per customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- e) Revenue by city
SELECT c.city, SUM(p.price * o.quantity) AS city_revenue
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.city;

-- f) Top customer by spending
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- g) Product category sales
SELECT p.category, SUM(o.quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.category;

-- h) Daily sales summary
SELECT o.order_date, SUM(p.price * o.quantity) AS daily_sales
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- i) Customers who haven't placed any orders
SELECT c.name, c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
