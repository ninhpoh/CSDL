-- Tạo cơ sở dữ liệu mới
USE dome;

-- Tạo bảng MonHoc trước vì các bảng khác phụ thuộc vào nó
CREATE TABLE MonHoc (
    MaMH CHAR(6) PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT CHECK (SoTinChi > 0)
);

-- Tạo bảng SinhVien
CREATE TABLE SinhVien (
    MaSV CHAR(8) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh ENUM('Nam', 'Nu'),
    DiaChi VARCHAR(200)
);

-- Tạo bảng DangKy (có khóa ngoại đến SinhVien và MonHoc)
CREATE TABLE DangKy (
    MaSV CHAR(8),
    MaMH CHAR(6),
    NgayDangKy DATE NOT NULL,
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);