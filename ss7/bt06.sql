CREATE DATABASE bt06;
USE bt06;

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-01-01', 500),
(2, 1, '2024-01-05', 700),
(3, 2, '2024-01-03', 300),
(4, 3, '2024-01-07', 900),
(5, 3, '2024-01-10', 1200),
(6, 4, '2024-01-12', 400),
(7, 5, '2024-01-15', 200);

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(total_amount) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) AS temp
);
