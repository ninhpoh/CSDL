DROP DATABASE IF EXISTS bt01;
create database bt01;
use bt01; 

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, name, email) VALUES
(1, 'An', 'an@example.com'),
(2, 'Binh', 'binh@example.com'),
(3, 'Chi', 'chi@example.com'),
(4, 'Dung', 'dung@example.com'),
(5, 'Hoa', 'hoa@example.com'),
(6, 'Lan', 'lan@example.com'),
(7, 'Minh', 'minh@example.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(101, 1, '2023-10-01', 100.50),
(102, 2, '2023-10-02', 200.00),
(103, 3, '2023-10-03', 150.00),
(104, 1, '2023-10-04', 50.00),
(105, 5, '2023-10-05', 300.20),
(106, 6, '2023-10-06', 120.00),
(107, 2, '2023-10-07', 90.00);

SELECT * FROM customers 
WHERE id IN (SELECT DISTINCT customer_id FROM orders);

