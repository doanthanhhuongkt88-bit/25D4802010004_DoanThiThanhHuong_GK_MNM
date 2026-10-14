-- Cau 2a: Them so dien thoai va cap nhat DG01
ALTER TABLE doc_gia ADD COLUMN sdt VARCHAR(15);
UPDATE doc_gia SET sdt = '0988000001' WHERE ma_dg = 'DG01';

-- Cau 2b: Tang so ban them 2 cho moi dau sach thuoc the loai Tin hoc
UPDATE sach SET so_ban = so_ban + 2 WHERE ma_tl = 'TH';

-- Cau 2c: Them doc gia DG09 va 2 luot muon chua tra
INSERT INTO doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky, sdt)
VALUES ('DG09', 'Ngo Van Phuc', 'Kinh te', DATE '2026-10-05', NULL);

INSERT INTO muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) VALUES
('DG09', 'S006', DATE '2026-10-05', NULL),
('DG09', 'S009', DATE '2026-10-07', NULL);

-- Cau 2d: Xoa sach S010 (khong co luot muon trong du lieu mau)
DELETE FROM sach WHERE ma_sach = 'S010';
