create database bt04;
use bt04;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop Dell', 20000000),
(2, 'Chuột Logitech', 500000),
(3, 'Bàn phím cơ', 1500000),
(4, 'Màn hình LG', 4500000),
(5, 'Tai nghe Sony', 2500000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 4, 2),
(104, 5, 3);

SELECT p.product_name, SUM(oi.quantity)
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

SELECT p.product_name, SUM(oi.quantity * p.price)
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

SELECT p.product_name, SUM(oi.quantity * p.price)
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity * p.price) > 5000000;