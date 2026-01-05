create database bt03;
use bt03;

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

ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2);

UPDATE orders SET total_amount = 9000000 WHERE order_id = 101;
UPDATE orders SET total_amount = 3000000 WHERE order_id = 102;
UPDATE orders SET total_amount = 2500000 WHERE order_id = 103;
UPDATE orders SET total_amount = 1500000 WHERE order_id = 104;
UPDATE orders SET total_amount = 5000000 WHERE order_id = 105;

SELECT order_date, SUM(total_amount)
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT order_date, COUNT(order_id)
FROM orders
WHERE status = 'completed'
GROUP BY order_date;

SELECT order_date, SUM(total_amount)
FROM orders
WHERE status = 'completed'
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;