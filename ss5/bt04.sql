create database bt04;
use bt04;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    sold_quantity INT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO products (product_id, product_name, price, stock, sold_quantity, status) VALUES
(1, 'iPhone 13', 18000000, 20, 150, 'active'),
(2, 'Samsung Galaxy S22', 16000000, 15, 120, 'active'),
(3, 'Xiaomi Redmi Note 12', 4500000, 30, 300, 'active'),
(4, 'OPPO Reno 8', 8900000, 25, 180, 'active'),
(5, 'Vivo Y20', 3500000, 40, 90, 'active'),
(6, 'Tai nghe Bluetooth Sony', 2800000, 50, 210, 'active'),
(7, 'Chuột Logitech M331', 350000, 100, 400, 'active'),
(8, 'Bàn phím cơ Keychron', 2200000, 35, 160, 'active'),
(9, 'USB Sandisk 64GB', 250000, 200, 500, 'active'),
(10, 'SSD Kingston 512GB', 1900000, 45, 260, 'active');

SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 10;

SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 5 OFFSET 5;

SELECT *
FROM products
WHERE price < 2000000
ORDER BY sold_quantity DESC;
