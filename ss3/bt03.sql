create database bt03;
use bt03;

CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    credit INT CHECK (credit > 0)
);

INSERT INTO Subject (subject_id, subject_name, credit)
VALUES
(101, 'Toán cao cấp', 3),
(102, 'Lập trình C', 4),
(103, 'Kinh tế học đại cương', 2);

UPDATE Subject
SET credit = 5
WHERE subject_id = 102;

UPDATE Subject
SET subject_name = 'Lập trình C nâng cao'
WHERE subject_id = 102;


SELECT * FROM Subject;