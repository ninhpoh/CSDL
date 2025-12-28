create database bt02;
use bt02;

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL CHECK (credit > 0)
);