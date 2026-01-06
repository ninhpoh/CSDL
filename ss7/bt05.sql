CREATE DATABASE bt05;
USE bt05;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers (id, name, email) VALUES
(1, 'Nguyen Van A', 'a@gmail.com'),
(2, 'Tran Thi B', 'b@gmail.com'),
(3, 'Le Van C', 'c@gmail.com'),
(4, 'Pham Thi D', 'd@gmail.com'),
(5, 'Hoang Van E', 'e@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-01-01', 500),
(102, 1, '2024-01-05', 700),
(103, 2, '2024-01-03', 300),
(104, 3, '2024-01-07', 900),
(105, 3, '2024-01-10', 1200),
(106, 3, '2024-01-12', 400),
(107, 4, '2024-01-15', 200);

select * from customers c
where id = ( -- 1
	select customer_id 
    from orders o 
	group by customer_id
    having sum(total_amount) = ( -- 2
		select max(total_sum)
        from ( -- 3
			select sum(total_amount) as total_sum
            from orders 
            group by customer_id
        ) as temp
    )
);