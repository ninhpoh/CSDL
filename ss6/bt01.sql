create database bt01;
use bt01;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyễn Văn A', 'Hà Nội'),
(2, 'Trần Thị B', 'Đà Nẵng'),
(3, 'Lê Văn C', 'TP. Hồ Chí Minh'),
(4, 'Phạm Thị D', 'Hải Phòng'),
(5, 'Hoàng Văn E', 'Cần Thơ');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2025-12-01', 'completed'),
(102, 2, '2025-12-02', 'pending'),
(103, 1, '2025-12-03', 'completed'),
(104, 3, '2025-12-04', 'cancelled'),
(105, 4, '2025-12-05', 'completed');

SELECT o.order_id, o.order_date, o.status, c.full_name AS customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

SELECT c.customer_id, c.full_name, c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name, c.city
HAVING COUNT(o.order_id) > 1;
