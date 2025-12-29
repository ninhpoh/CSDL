create database bt02;
use bt02;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
(1, 'Nguyễn Văn  Thang', '2002-05-15', 'nguyenvana@example.com'),
(2, 'Trần Thị Bich', '2001-11-22', 'tranthib@example.com'),
(3, 'Lê Văn Duy', '2003-03-10', 'levanc@example.com');

UPDATE Student
SET email = 'levanc_updated@example.com'
WHERE student_id = 3;

UPDATE Student
SET date_of_birth = '2001-12-01'
WHERE student_id = 2;

SELECT * FROM Student;