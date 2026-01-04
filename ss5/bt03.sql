create database bt03;
use bt03;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('pending', 'completed', 'cancelled') NOT NULL
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(1, 1, 3200000, '2024-01-05', 'completed'),
(2, 2, 8500000, '2024-01-07', 'completed'),
(3, 3, 1200000, '2024-01-10', 'pending'),
(4, 4, 6700000, '2024-01-12', 'completed'),
(5, 5, 4500000, '2024-01-15', 'cancelled'),
(6, 1, 9800000, '2024-01-18', 'completed'),
(7, 6, 2300000, '2024-01-20', 'pending'),
(8, 7, 5600000, '2024-01-22', 'completed'),
(9, 8, 1500000, '2024-01-25', 'cancelled'),
(10, 9, 7200000, '2024-01-28', 'completed');

SELECT *
FROM orders
WHERE status = 'completed';

SELECT *
FROM orders
WHERE total_amount > 5000000;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;

SELECT *
FROM orders
WHERE status = 'completed'
ORDER BY total_amount DESC;
