create database bt01;
use bt01;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'Laptop Dell Inspiron 15', 15000000, 10, 'active'),
(2, 'iPhone 13', 18000000, 5, 'active'),
(3, 'Chuột không dây Logitech', 350000, 50, 'active'),
(4, 'Bàn phím cơ Keychron K6', 2200000, 20, 'active'),
(5, 'Màn hình Samsung 24 inch', 4200000, 12, 'active'),
(6, 'Tai nghe Bluetooth Sony', 2800000, 8, 'inactive'),
(7, 'Ổ cứng SSD 512GB', 1900000, 25, 'active'),
(8, 'USB 64GB Sandisk', 250000, 100, 'inactive'),
(9, 'Webcam Logitech C920', 2100000, 7, 'active'),
(10, 'Loa Bluetooth JBL Go 3', 1200000, 30, 'active');

SELECT * 
FROM products;

SELECT * 
FROM products
WHERE status = 'active';

SELECT * 
FROM products
WHERE price > 1000000;

SELECT * 
FROM products
WHERE status = 'active'
ORDER BY price ASC;