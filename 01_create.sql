-- Cau 1: Tao co so du lieu va 4 bang cho thu vien
-- Chay file nay bang psql. Neu da co database gk_thuvien, bo qua CREATE DATABASE/\connect va chay cac lenh CREATE TABLE trong database do.
CREATE DATABASE gk_thuvien;
\connect gk_thuvien

CREATE TABLE the_loai (
    ma_tl VARCHAR(5) PRIMARY KEY,
    ten_tl VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE doc_gia (
    ma_dg VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(80) NOT NULL,
    khoa VARCHAR(40),
    ngay_dang_ky DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE sach (
    ma_sach VARCHAR(10) PRIMARY KEY,
    ten_sach VARCHAR(120) NOT NULL,
    tac_gia VARCHAR(80),
    nam_xb INTEGER CHECK (nam_xb >= 1900),
    so_ban INTEGER NOT NULL DEFAULT 1 CHECK (so_ban >= 0),
    ma_tl VARCHAR(5) NOT NULL REFERENCES the_loai(ma_tl)
);

CREATE TABLE muon_sach (
    ma_dg VARCHAR(10) NOT NULL REFERENCES doc_gia(ma_dg),
    ma_sach VARCHAR(10) NOT NULL REFERENCES sach(ma_sach),
    ngay_muon DATE NOT NULL,
    ngay_tra DATE,
    PRIMARY KEY (ma_dg, ma_sach, ngay_muon),
    CHECK (ngay_tra IS NULL OR ngay_tra >= ngay_muon)
);
