-- Ban sao luu SQL co the phuc hoi cua database gk_thuvien sau khi hoan thanh Cau 1-2.
-- Tao tu cau truc va du lieu mau trong de, da ap dung cac lenh trong 03_alter_update.sql.
-- Neu can ban pg_dump do chinh PostgreSQL sinh ra, chay lenh pg_dump duoc ghi trong README.md.
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

CREATE TABLE public.the_loai (
    ma_tl character varying(5) NOT NULL,
    ten_tl character varying(50) NOT NULL,
    CONSTRAINT the_loai_pkey PRIMARY KEY (ma_tl),
    CONSTRAINT the_loai_ten_tl_key UNIQUE (ten_tl)
);
CREATE TABLE public.doc_gia (
    ma_dg character varying(10) NOT NULL,
    ho_ten character varying(80) NOT NULL,
    khoa character varying(40),
    ngay_dang_ky date DEFAULT CURRENT_DATE NOT NULL,
    sdt character varying(15),
    CONSTRAINT doc_gia_pkey PRIMARY KEY (ma_dg)
);
CREATE TABLE public.sach (
    ma_sach character varying(10) NOT NULL,
    ten_sach character varying(120) NOT NULL,
    tac_gia character varying(80),
    nam_xb integer,
    so_ban integer DEFAULT 1 NOT NULL,
    ma_tl character varying(5) NOT NULL,
    CONSTRAINT sach_pkey PRIMARY KEY (ma_sach),
    CONSTRAINT sach_nam_xb_check CHECK (nam_xb >= 1900),
    CONSTRAINT sach_so_ban_check CHECK (so_ban >= 0),
    CONSTRAINT sach_ma_tl_fkey FOREIGN KEY (ma_tl) REFERENCES public.the_loai(ma_tl)
);
CREATE TABLE public.muon_sach (
    ma_dg character varying(10) NOT NULL,
    ma_sach character varying(10) NOT NULL,
    ngay_muon date NOT NULL,
    ngay_tra date,
    CONSTRAINT muon_sach_pkey PRIMARY KEY (ma_dg, ma_sach, ngay_muon),
    CONSTRAINT muon_sach_ma_dg_fkey FOREIGN KEY (ma_dg) REFERENCES public.doc_gia(ma_dg),
    CONSTRAINT muon_sach_ma_sach_fkey FOREIGN KEY (ma_sach) REFERENCES public.sach(ma_sach),
    CONSTRAINT muon_sach_check CHECK (ngay_tra IS NULL OR ngay_tra >= ngay_muon)
);

INSERT INTO public.the_loai (ma_tl, ten_tl) VALUES
('TH','Tin hoc'),('VH','Van hoc'),('KT','Kinh te'),('LS','Lich su'),('NN','Ngoai ngu');
INSERT INTO public.doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky, sdt) VALUES
('DG01','Nguyen Minh Anh','CNTT','2025-09-05','0988000001'),
('DG02','Tran Quang Huy','CNTT','2025-09-05',NULL),
('DG03','Le Thu Trang','Kinh te','2025-09-10',NULL),
('DG04','Pham Duc Long','Hoa','2025-10-01',NULL),
('DG05','Hoang Ngoc Mai','Kinh te','2026-02-15',NULL),
('DG06','Vu Hai Dang','CNTT','2026-02-20',NULL),
('DG07','Dang Thi Huong','Moi truong','2026-03-01',NULL),
('DG08','Bui Van Khoa','Hoa','2026-03-02',NULL),
('DG09','Ngo Van Phuc','Kinh te','2026-10-05',NULL);
INSERT INTO public.sach (ma_sach, ten_sach, tac_gia, nam_xb, so_ban, ma_tl) VALUES
('S001','Lap trinh Python co ban','Nguyen Van Hung',2021,7,'TH'),
('S002','Co so du lieu','Tran Minh Quang',2019,6,'TH'),
('S003','Mang may tinh','Le Thanh Son',2017,5,'TH'),
('S004','Truyen Kieu','Nguyen Du',2015,6,'VH'),
('S005','So do','Vu Trong Phung',2018,4,'VH'),
('S006','Nguyen ly kinh te vi mo','Pham Quoc Bao',2020,5,'KT'),
('S007','Quan tri hoc','Dinh Thi Hoa',2016,3,'KT'),
('S008','Viet Nam su luoc','Tran Trong Kim',2014,2,'LS'),
('S009','Tieng Anh giao tiep','Hoang Anh Tuan',2022,6,'NN');
INSERT INTO public.muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) VALUES
('DG01','S001','2026-09-01','2026-09-15'),
('DG01','S002','2026-09-01','2026-09-15'),
('DG01','S004','2026-09-20','2026-10-02'),
('DG02','S001','2026-09-03','2026-09-17'),
('DG02','S003','2026-09-10','2026-09-24'),
('DG03','S006','2026-09-05','2026-09-19'),
('DG03','S007','2026-09-05',NULL),
('DG03','S004','2026-09-28',NULL),
('DG04','S008','2026-09-12','2026-09-26'),
('DG05','S009','2026-09-15','2026-09-29'),
('DG05','S006','2026-10-01',NULL),
('DG06','S002','2026-09-18','2026-10-01'),
('DG06','S005','2026-10-02',NULL),
('DG07','S009','2026-10-03',NULL),
('DG09','S006','2026-10-05',NULL),
('DG09','S009','2026-10-07',NULL);
