/* =========================================================
   FILE: course_registration.sql
   MÔ TẢ:
   Bài thực hành tổng hợp SQL
   Chủ đề: Kiểu dữ liệu – Ràng buộc – DDL
   ========================================================= */


/* =========================================================
   PHẦN 1 – TẠO CƠ SỞ DỮ LIỆU
   ========================================================= */
create database demo03;
USE demo03;

/* -------------------------
   BẢNG: SinhVien
   ------------------------- */
CREATE TABLE SinhVien (
    student_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender CHAR(3) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),

    CONSTRAINT pk_sinhvien PRIMARY KEY (student_id),
    CONSTRAINT uq_sinhvien_email UNIQUE (email),
    CONSTRAINT ck_sinhvien_gender CHECK (gender IN ('Nam','Nu'))
);


/* -------------------------
   BẢNG: MonHoc
   ------------------------- */
CREATE TABLE MonHoc (
    course_id INT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,

    CONSTRAINT pk_monhoc PRIMARY KEY (course_id),
    CONSTRAINT ck_monhoc_credits CHECK (credits > 0)
);


/* -------------------------
   BẢNG: DangKy
   ------------------------- */
CREATE TABLE DangKy (
    registration_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20),
    registration_date DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT pk_dangky PRIMARY KEY (registration_id),
    CONSTRAINT fk_dangky_sinhvien FOREIGN KEY (student_id)
        REFERENCES SinhVien(student_id),
    CONSTRAINT fk_dangky_monhoc FOREIGN KEY (course_id)
        REFERENCES MonHoc(course_id)
);


