CREATE DATABASE bt04;
USE bt04;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers (id, name, email) VALUES
(1, 'Nguyen Van A', 'a@gmail.com'),
(2, 'Tran Thi B', 'b@gmail.com'),
(3, 'Le Van C', 'c@gmail.com'),
(4, 'Pham Thi D', 'd@gmail.com'),
(5, 'Hoang Van E', 'e@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-01-01', 500.00),
(102, 1, '2024-01-05', 700.00),
(103, 2, '2024-01-03', 300.00),
(104, 3, '2024-01-07', 900.00),
(105, 3, '2024-01-10', 1200.00),
(106, 3, '2024-01-12', 400.00);

select name, (select count(*) from orders o where o.customer_id = customers.id) as order_count
from customers;