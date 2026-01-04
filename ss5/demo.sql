-- create database demo_05;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    status VARCHAR(20) -- ACTIVE, INACTIVE
);

INSERT INTO products (product_name, category, price, stock, status) VALUES
('Laptop', 'Electronics', 1500, 10, 'ACTIVE'),
('Mouse', 'Accessories', 20, 100, 'ACTIVE'),
('Keyboard', 'Accessories', 50, 50, 'ACTIVE'),
('Monitor', 'Electronics', 300, 20, 'ACTIVE'),
('Printer', 'Electronics', 200, 0, 'INACTIVE'),
('USB Cable', 'Accessories', 10, 200, 'ACTIVE'),
('Webcam', 'Electronics', 80, 15, 'ACTIVE'),
('Headphone', 'Accessories', 120, 0, 'INACTIVE'),
('Tablet', 'Electronics', 600, 8, 'ACTIVE'),
('Speaker', 'Accessories', 150, 12, 'ACTIVE');

select * from products; -- 1 

-- case when: phan loai --
select product_name 'ten sp',
    case status when 'ACTIVE' then 'con ban'
				when 'INACTIVE' then 'ngung ban'
                else 'ko xac dinh'
	end 'trang thai hang'
from products p;

SELECT product_name, category, price, stock
FROM products
WHERE status = 'ACTIVE';

SELECT product_name, price
FROM products
WHERE price > 100;

SELECT product_name, price
FROM products
WHERE price BETWEEN 50 AND 300;

SELECT product_name, category, price, stock, status
FROM products
WHERE category = 'Electronics';

SELECT product_id, product_name
FROM products
WHERE stock = 0;

SELECT product_name, category, price, stock, status
FROM products
ORDER BY price ASC;

SELECT product_name, category, price, stock, status
FROM products
ORDER BY stock DESC;

SELECT product_name, category, price, stock
FROM products
WHERE status = 'ACTIVE'
LIMIT 5;


