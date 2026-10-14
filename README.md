# Giua ky Ung dung ma nguon mo - De 02

## 1. Thong tin sinh vien
- Ho ten: Doan Thi Thanh Huong
- Ma sinh vien: 25D4802010004
- Lop: TTLT1D25
- De so: 02

## 2. Mo ta co so du lieu
Database PostgreSQL `gk_thuvien` quan ly thu vien, gom 4 bang: `the_loai`, `doc_gia`, `sach`, `muon_sach`. Cac khoa chinh, khoa ngoai va rang buoc duoc khai bao trong `sql/01_create.sql`.

## 3. Thu tu chay cac file
Dung PostgreSQL va psql. Mo terminal tai thu muc goc cua repository:

1. Tao database va cac bang: `psql -U postgres -f sql/01_create.sql`.
2. Nap du lieu mau: `psql -U postgres -d gk_thuvien -f sql/02_data.sql`.
3. Chinh sua du lieu theo Cau 2: `psql -U postgres -d gk_thuvien -f sql/03_alter_update.sql`.
4. Chay truy van Cau 3: `psql -U postgres -d gk_thuvien -f sql/04_query.sql`.

Luu y: file 01_create.sql dung lenh `\connect`, nen chay bang `psql` (khong chay nguyen file bang Query Tool cua pgAdmin). Neu database da ton tai, khong chay lai cac lenh tao database/bang tren cung database.

## 4. Trich xuat du lieu

### Cau 4.1 - CSV ket qua Cau 3.4
Chay lenh sau tu thu muc goc repository (psql can ket noi duoc den PostgreSQL):

```bash
psql -U postgres -d gk_thuvien -c "\copy (SELECT tl.ten_tl, COUNT(*) AS so_luot_muon FROM muon_sach ms JOIN sach s ON s.ma_sach = ms.ma_sach JOIN the_loai tl ON tl.ma_tl = s.ma_tl GROUP BY tl.ten_tl HAVING COUNT(*) >= 4 ORDER BY so_luot_muon DESC, tl.ten_tl ASC) TO 'export/ketqua_cau3_4.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8')"
```

### Cau 4.2 - Sao luu database bang pg_dump

```bash
pg_dump -U postgres -d gk_thuvien --format=plain --no-owner --no-privileges -f export/gk_thuvien_backup.sql
```

Trong repository co san tep CSV va tep SQL backup phuc hoi duoc theo du lieu mau sau khi ap dung cac lenh Cau 2. De tao lai dung tep `pg_dump` theo yeu cau bai thi, chay lenh tren trong moi truong PostgreSQL cua ban.

## Cau truc thu muc
```text
25D4802010004_DoanThiThanhHuong_GK_MNM/
├── README.md
├── sql/
│   ├── 01_create.sql
│   ├── 02_data.sql
│   ├── 03_alter_update.sql
│   └── 04_query.sql
└── export/
    ├── ketqua_cau3_4.csv
    └── gk_thuvien_backup.sql
```
