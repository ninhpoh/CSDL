CREATE DATABASE bt03;
USE bt03;

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10 , 2 )
);

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-01', 500.00),
(2, 102, '2024-01-03', 1200.00),
(3, 103, '2024-01-05', 300.00),
(4, 104, '2024-01-07', 800.00),
(5, 105, '2024-01-10', 1500.00);

SELECT * FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);