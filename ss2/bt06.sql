create database bt06;
use bt06;

CREATE TABLE Department (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Teacher (
    teacher_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL CHECK (credit > 0),
    teacher_id VARCHAR(10),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
c
CREATE TABLE Class (
    class_id VARCHAR(10) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    school_year INT NOT NULL,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    class_id VARCHAR(10),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

CREATE TABLE Semester (
    semester_id VARCHAR(10) PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE Enrollment (
    student_id VARCHAR(10),
    subject_id VARCHAR(10),
    semester_id VARCHAR(10),
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, subject_id, semester_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);

CREATE TABLE Score (
    student_id VARCHAR(10),
    subject_id VARCHAR(10),
    semester_id VARCHAR(10),
    process_score DECIMAL(4,2) CHECK (process_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, subject_id, semester_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);