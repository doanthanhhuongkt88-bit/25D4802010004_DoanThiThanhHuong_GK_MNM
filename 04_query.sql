-- Cau 3.1: Sach xuat ban tu nam 2018 tro di
SELECT ma_sach, ten_sach, tac_gia, nam_xb
FROM sach
WHERE nam_xb >= 2018
ORDER BY nam_xb DESC, ten_sach ASC;

-- Cau 3.2: Tong so dau sach, tong so ban va nam xuat ban moi nhat
SELECT COUNT(*) AS so_dau_sach,
       COALESCE(SUM(so_ban), 0) AS tong_so_ban,
       MAX(nam_xb) AS nam_xb_moi_nhat
FROM sach;

-- Cau 3.3: Sach thuoc the loai Tin hoc hoac Kinh te
SELECT s.ma_sach, s.ten_sach, tl.ten_tl, s.so_ban
FROM sach AS s
JOIN the_loai AS tl ON tl.ma_tl = s.ma_tl
WHERE s.ma_tl IN ('TH', 'KT')
ORDER BY tl.ten_tl ASC, s.ten_sach ASC;

-- Cau 3.4: Dem luot muon theo the loai, chi hien thi tu 4 luot tro len
SELECT tl.ten_tl, COUNT(*) AS so_luot_muon
FROM muon_sach AS ms
JOIN sach AS s ON s.ma_sach = ms.ma_sach
JOIN the_loai AS tl ON tl.ma_tl = s.ma_tl
GROUP BY tl.ten_tl
HAVING COUNT(*) >= 4
ORDER BY so_luot_muon DESC, tl.ten_tl ASC;

-- Cau 3.5: Doc gia chua tung muon sach thuoc the loai Van hoc (dung truy van con)
SELECT dg.ma_dg, dg.ho_ten, dg.khoa
FROM doc_gia AS dg
WHERE dg.ma_dg NOT IN (
    SELECT ms.ma_dg
    FROM muon_sach AS ms
    JOIN sach AS s ON s.ma_sach = ms.ma_sach
    WHERE s.ma_tl = 'VH'
)
ORDER BY dg.ma_dg ASC;
