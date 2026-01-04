create database bt02; 
use bt02;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyễn Văn An', 'an.nguyen@gmail.com', 'TP.HCM', 'active'),
(2, 'Trần Thị Bình', 'binh.tran@gmail.com', 'Hà Nội', 'active'),
(3, 'Lê Hoàng Nam', 'nam.le@gmail.com', 'Đà Nẵng', 'inactive'),
(4, 'Phạm Thu Trang', 'trang.pham@gmail.com', 'TP.HCM', 'active'),
(5, 'Võ Minh Tuấn', 'tuan.vo@gmail.com', 'Hà Nội', 'inactive'),
(6, 'Đặng Thị Hồng', 'hong.dang@gmail.com', 'Cần Thơ', 'active'),
(7, 'Bùi Quốc Khánh', 'khanh.bui@gmail.com', 'TP.HCM', 'active'),
(8, 'Ngô Thị Mai', 'mai.ngo@gmail.com', 'Hà Nội', 'active'),
(9, 'Phan Văn Long', 'long.phan@gmail.com', 'Đà Nẵng', 'inactive'),
(10, 'Đỗ Ngọc Lan', 'lan.do@gmail.com', 'TP.HCM', 'active');

SELECT * 
FROM customers;

SELECT * 
FROM customers
WHERE city = 'TP.HCM';

SELECT * 
FROM customers
WHERE status = 'active'
  AND city = 'Hà Nội';

SELECT * 
FROM customers
ORDER BY full_name ASC;