drop database if exists mini_project;
create database mini_project;

use mini_project;

-- 1. tao cac bang --
create table reader(
	reader_id int primary key auto_increment,
    reader_name varchar(100) not null,
    phone varchar(15) unique,
    register_date date default(current_date())
);

create table book(
	book_id int primary key,
    book_title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publish_year INT check(publish_year >= 1900)
);

create table borrow(
	reader_id int,
    book_id int,
    borrow_date date default(current_date()),
    return_date date,
    
    PRIMARY KEY (reader_id, book_id),
    FOREIGN KEY (reader_id) REFERENCES reader(reader_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 2. DDL --
alter table reader add email varchar(100) unique;
alter table book modify author varchar(150);

-- 3. DML --

INSERT INTO reader ( reader_name, phone, register_date, email)
VALUES
( 'Nguyễn Văn An', '0901234567', '2024-09-01','an.nguyen@gmail.com' ),
( 'Trần Thị Bình', '0912345678', '2024-09-05', 'binh.tran@gmail.com'),
( 'Lê Minh Châu', '0923456789','2024-09-10', 'chau.le@gmail.com');

INSERT INTO book ( book_id, book_title, author, publish_year)
VALUES
( '101', 'Lập trình C căn bản', '2024-09-01','2018' ),
( '102', 'Cơ sở dữ liệu', 'Trần Thị B', '2020'),
( '103', 'Lập trình Java','Lê Minh C', '2019'),
( '104', 'Hệ quản trị MySQL', 'Phạm Văn D', '2021');

INSERT INTO borrow ( )
VALUES
( '1', '101	', '2024-09-15',null ),
( '1', '102', '2024-09-15', '2024-09-25'),
( '2', '103','2024-09-18',null);

UPDATE Borrow
SET return_date = '2024-10-01'
WHERE reader_id = 1;

UPDATE Book
SET publish_year = 2023
WHERE publish_year >= 2021;

DELETE FROM Borrow
WHERE borrow_date < '2024-09-18';

SELECT * FROM Reader;
SELECT * FROM Book;
SELECT * FROM Borrow;



