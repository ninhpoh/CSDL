CREATE DATABASE bt05;
USE bt05;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Nguyen Van A'),
(2, 'Tran Thi B'),
(3, 'Le Van C');

INSERT INTO products VALUES
(1, 'Laptop Dell', 20000000),
(2, 'Chuột Logitech', 500000),
(3, 'Bàn phím cơ', 1500000),
(4, 'Màn hình LG', 4500000),
(5, 'Tai nghe Sony', 2500000);

INSERT INTO orders VALUES
(1, 1, '2024-01-01', 'completed'),
(2, 1, '2024-01-05', 'completed'),
(3, 1, '2024-01-10', 'completed'),
(4, 2, '2024-01-03', 'completed'),
(5, 3, '2024-01-07', 'pending');

INSERT INTO order_items VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 2),
(2, 4, 1),
(3, 1, 1),
(3, 5, 2),
(4, 4, 2);

SELECT c.customer_id, c.customer_name, COUNT(DISTINCT o.order_id) AS total_orders, SUM(oi.quantity * p.price) AS total_spent, SUM(oi.quantity * p.price) / COUNT(DISTINCT o.order_id)
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) >= 3
   AND SUM(oi.quantity * p.price) > 10000000
ORDER BY total_spent DESC;
