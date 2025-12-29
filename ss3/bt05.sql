create database bt05;
use bt05;

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

CREATE TABLE Enrollment (
    student_id INT,
    subject_id INT,
    enroll_date DATE,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);
INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES
(1, 101, '2025-12-01'),
(1, 102, '2025-12-02'),
(2, 103, '2025-12-03');

CREATE TABLE Score (
    student_id INT,
    subject_id INT,
    mid_score FLOAT CHECK (mid_score BETWEEN 0 AND 10),
    final_score FLOAT CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);
INSERT INTO Score (student_id, subject_id, mid_score, final_score)
VALUES
(1, 101, 7.5, 8.0),
(2, 103, 6.0, 9.0);

UPDATE Score
SET final_score = 9.5
WHERE student_id = 1 AND subject_id = 101;

SELECT * FROM Score
WHERE final_score >= 8;



