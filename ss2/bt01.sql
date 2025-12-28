
USE dome;

CREATE TABLE MonHoc (
    MaMH CHAR(6) PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT CHECK (SoTinChi > 0)
);

CREATE TABLE SinhVien (
    MaSV CHAR(8) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh ENUM('Nam', 'Nu'),
    DiaChi VARCHAR(200)
);

CREATE TABLE DangKy (
    MaSV CHAR(8),
    MaMH CHAR(6),
    NgayDangKy DATE NOT NULL,
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);