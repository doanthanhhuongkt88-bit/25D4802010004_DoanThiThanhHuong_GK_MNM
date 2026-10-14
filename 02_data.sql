SET client_encoding = 'UTF8';
-- DU LIEU MAU DE 2 (khong dau de tranh loi ma hoa). Chay SAU KHI da tao bang.
INSERT INTO the_loai (ma_tl, ten_tl) VALUES
('TH', 'Tin hoc'),
('VH', 'Van hoc'),
('KT', 'Kinh te'),
('LS', 'Lich su'),
('NN', 'Ngoai ngu');

INSERT INTO doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky) VALUES
('DG01', 'Nguyen Minh Anh', 'CNTT',       '2025-09-05'),
('DG02', 'Tran Quang Huy',  'CNTT',       '2025-09-05'),
('DG03', 'Le Thu Trang',    'Kinh te',    '2025-09-10'),
('DG04', 'Pham Duc Long',   'Hoa',        '2025-10-01'),
('DG05', 'Hoang Ngoc Mai',  'Kinh te',    '2026-02-15'),
('DG06', 'Vu Hai Dang',     'CNTT',       '2026-02-20'),
('DG07', 'Dang Thi Huong',  'Moi truong', '2026-03-01'),
('DG08', 'Bui Van Khoa',    'Hoa',        '2026-03-02');

INSERT INTO sach (ma_sach, ten_sach, tac_gia, nam_xb, so_ban, ma_tl) VALUES
('S001', 'Lap trinh Python co ban',  'Nguyen Van Hung', 2021, 5, 'TH'),
('S002', 'Co so du lieu',            'Tran Minh Quang', 2019, 4, 'TH'),
('S003', 'Mang may tinh',            'Le Thanh Son',    2017, 3, 'TH'),
('S004', 'Truyen Kieu',              'Nguyen Du',       2015, 6, 'VH'),
('S005', 'So do',                    'Vu Trong Phung',  2018, 4, 'VH'),
('S006', 'Nguyen ly kinh te vi mo',  'Pham Quoc Bao',   2020, 5, 'KT'),
('S007', 'Quan tri hoc',             'Dinh Thi Hoa',    2016, 3, 'KT'),
('S008', 'Viet Nam su luoc',         'Tran Trong Kim',  2014, 2, 'LS'),
('S009', 'Tieng Anh giao tiep',      'Hoang Anh Tuan',  2022, 6, 'NN'),
('S010', 'Nhung cau chuyen lich su', 'Ngo Thi Thu',     2023, 1, 'LS');

INSERT INTO muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) VALUES
('DG01', 'S001', '2026-09-01', '2026-09-15'),
('DG01', 'S002', '2026-09-01', '2026-09-15'),
('DG01', 'S004', '2026-09-20', '2026-10-02'),
('DG02', 'S001', '2026-09-03', '2026-09-17'),
('DG02', 'S003', '2026-09-10', '2026-09-24'),
('DG03', 'S006', '2026-09-05', '2026-09-19'),
('DG03', 'S007', '2026-09-05', NULL),
('DG03', 'S004', '2026-09-28', NULL),
('DG04', 'S008', '2026-09-12', '2026-09-26'),
('DG05', 'S009', '2026-09-15', '2026-09-29'),
('DG05', 'S006', '2026-10-01', NULL),
('DG06', 'S002', '2026-09-18', '2026-10-01'),
('DG06', 'S005', '2026-10-02', NULL),
('DG07', 'S009', '2026-10-03', NULL);
