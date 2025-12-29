INSERT INTO SinhVien (full_name, date_of_birth, gender, email, phone) VALUES
('Tran Thi Mai', '2003-08-21', 'Nu', 'mai.tran@example.com', '0987654321'),
('Le Van Binh', '2004-01-15', 'Nam', 'binh.le@example.com', '0911223344'),
('Pham Thi Hoa', '2005-03-10', 'Nu', 'hoa.pham@example.com', '0933445566'),
('Nguyen Van Long', '2004-07-05', 'Nam', 'long.nguyen@example.com', '0977889900'),
('Do Thi Lan', '2003-11-30', 'Nu', 'lan.do@example.com', '0909090909'),
('Hoang Van Nam', '2004-09-12', 'Nam', 'nam.hoang@example.com', '0922334455'),
('Vu Thi Huong', '2005-02-25', 'Nu', 'huong.vu@example.com', '0944556677'),
('Dang Van Son', '2004-06-18', 'Nam', 'son.dang@example.com', '0955667788'),
('Nguyen Thi Thao', '2003-12-02', 'Nu', 'thao.nguyen@example.com', '0966778899');

INSERT INTO MonHoc (course_id, course_name, credits) VALUES
(101, 'Co so du lieu', 3),
(102, 'Lap trinh Java', 4),
(103, 'Cau truc du lieu & Giai thuat', 3),
(104, 'He dieu hanh', 3),
(105, 'Mang may tinh', 3),
(106, 'Tri tue nhan tao', 4);

INSERT INTO DangKy (student_id, course_id, semester, registration_date) VALUES
(1, 101, '2024HK1', '2024-01-10'),
(1, 102, '2024HK1', '2024-01-11'),
(2, 103, '2024HK1', '2024-01-12'),
(3, 104, '2024HK2', '2024-07-05'),
(4, 105, '2024HK2', '2024-07-06'),
(5, 106, '2024HK2', '2024-07-07'),
(6, 101, '2025HK1', '2025-01-15'),
(7, 102, '2025HK1', '2025-01-16'),
(8, 103, '2025HK1', '2025-01-17'),
(9, 104, '2025HK2', '2025-07-01'),
(10, 105, '2025HK2', '2025-07-02');

select student_id, full_name
from sinhvien;

select course_name, credits
from monhoc;

select student_id,course_id
from DangKy;

