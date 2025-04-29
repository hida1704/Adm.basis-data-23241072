CREATE DATABASE toko_kosmetik;
USE toko_kosmetik;

-- Tabel OWNER
CREATE TABLE OWNER (
    ID_owner VARCHAR(10),
    Nama VARCHAR(100),
    NIK VARCHAR(20),
    Alamat VARCHAR(225),
    NoTlpn VARCHAR(15)
);

-- Tabel KARYAWAN
CREATE TABLE KARYAWAN (
    ID_karyawan VARCHAR(10),
    Nama VARCHAR(100),
    NoTlpn VARCHAR(15),
    TanggalLahir DATETIME,
    JenisKelamin ENUM('Laki-laki', 'Perempuan'),
    Alamat VARCHAR(225),
    JamKerja VARCHAR(50),
    NIK VARCHAR(20)
);

-- Tabel CUSTOMER
CREATE TABLE CUSTOMER (
    ID_customer VARCHAR(10),
    Nama VARCHAR(100),
    Email VARCHAR(100),
    NoTlpn VARCHAR(15),
    Alamat VARCHAR(225)
);

-- Tabel SUPPLIER
CREATE TABLE SUPPLIER (
    ID_supplier VARCHAR(10),
    Nama VARCHAR(100),
    Alamat VARCHAR(225),
    NoTlpn VARCHAR(15)
);

-- Tabel PRODUK
CREATE TABLE PRODUK (
    ID_produk VARCHAR(10),
    Nama_produk VARCHAR(100),
    Harga INT,
    Kategori VARCHAR(50)
);

-- Tabel STOK
CREATE TABLE STOK (
    ProductID VARCHAR(10),
    SupplierID VARCHAR(10),
    Harga INT,
    Jumlah INT
);

-- Tabel TRANSAKSI
CREATE TABLE TRANSAKSI (
    ID_transaksi VARCHAR(10),
    TglTransaksi DATETIME,
    Metode_Pembayaran VARCHAR(50),
    Total DECIMAL(10,2),
    CustomerID VARCHAR(10),
    KaryawanID VARCHAR(10)
);

-- Tabel DETAIL TRANSAKSI
CREATE TABLE DETAIL_TRANSAKSI (
    ID_detail VARCHAR(10),
    ID_customer VARCHAR(10),
    Jumlah INT,
    Pesanan VARCHAR(100),
    Keterangan VARCHAR(100)
);

-- Tabel KURIR
CREATE TABLE KURIR (
    ID_kurir VARCHAR(100),
    Nama_kurir VARCHAR(100),
    NIK VARCHAR(20),
    NoTlpn VARCHAR(15),
    JenisKelamin ENUM('Laki-laki', 'Perempuan'),
    Sim VARCHAR(20)
);

-- Create TABLE PENGANTARAN
CREATE TABLE PENGANTARAN (
    ID_pengantaran VARCHAR(10),
    ID_kurir VARCHAR(100),
    ID_customer VARCHAR(10)
);

-- KARYAWAN dimiliki oleh OWNER
ALTER TABLE KARYAWAN
ADD CONSTRAINT fk_karyawan_owner
FOREIGN KEY (ID_owner) REFERENCES OWNER(ID_owner);

-- PRODUK disuplai oleh SUPPLIER
ALTER TABLE PRODUK
ADD CONSTRAINT fk_produk_supplier
FOREIGN KEY (ID_supplier) REFERENCES SUPPLIER(ID_supplier);

-- STOK relasi antara PRODUK dan SUPPLIER
ALTER TABLE STOK
ADD CONSTRAINT fk_stok_produk
FOREIGN KEY (ProductID) REFERENCES PRODUK(ID_produk),
ADD CONSTRAINT fk_stok_supplier
FOREIGN KEY (SupplierID) REFERENCES SUPPLIER(ID_supplier);

-- TRANSAKSI dilakukan oleh CUSTOMER dan dicatat oleh KARYAWAN
ALTER TABLE TRANSAKSI
ADD CONSTRAINT fk_transaksi_customer
FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(ID_customer),
ADD CONSTRAINT fk_transaksi_karyawan
FOREIGN KEY (KaryawanID) REFERENCES KARYAWAN(ID_karyawan);

-- DETAIL_TRANSAKSI milik CUSTOMER
ALTER TABLE DETAIL_TRANSAKSI
ADD CONSTRAINT fk_detailtransaksi_customer
FOREIGN KEY (ID_customer) REFERENCES CUSTOMER(ID_customer);

-- KURIR_DETAIL: kurir mengantar detail transaksi
ALTER TABLE KURIR_DETAIL
ADD CONSTRAINT fk_kurirdetail_kurir
FOREIGN KEY (ID_kurir) REFERENCES KURIR(ID_kurir),
ADD CONSTRAINT fk_kurirdetail_detail
FOREIGN KEY (ID_detail) REFERENCES DETAIL_TRANSAKSI(ID_detail);

-- PENGANTARAN: kurir mengantar customer
ALTER TABLE PENGANTARAN
ADD CONSTRAINT fk_pengantaran_kurir
FOREIGN KEY (ID_kurir) REFERENCES KURIR(ID_kurir),
ADD CONSTRAINT fk_pengantaran_customer
FOREIGN KEY (ID_customer) REFERENCES CUSTOMER(ID_customer);

-- Data Owner
INSERT INTO OWNER VALUES
('OWN001', 'Ayu Lestari', '3276012300010001', 'Jl. Merdeka No. 10', '081234567890'),
('OWN002', 'Rina Wahyuni', '3276012300010002', 'Jl. Kenanga No. 5', '082112345678'),
('OWN003', 'Fitri Ningsih', '3276012300010003', 'Jl. Cempaka No. 7', '083112233445'),
('OWN004', 'Sari Pratiwi', '3276012300010004', 'Jl. Melati No. 8', '085512345670'),
('OWN005', 'Nina Putri', '3276012300010005', 'Jl. Anggrek No. 9', '081298765432');

-- Data Karyawan
INSERT INTO KARYAWAN (ID_karyawan, Nama, NoTlpn, TanggalLahir, JenisKelamin, Alamat, JamKerja, NIK) VALUES
('KRY001', 'Dewi Anggraini', '081300011122', '1998-05-10', 'Perempuan', 'Jl. Surya No. 2', '08.00-17.00', '3276019800010001'),
('KRY002', 'Budi Santoso', '082211223344', '1995-03-22', 'Laki-laki', 'Jl. Kartika No. 3', '09.00-18.00', '3276019500010002'),
('KRY003', 'Asep Ridwan', '083344556677', '1992-12-11', 'Laki-laki', 'Jl. Garuda No. 4', '08.00-17.00', '3276019200010003'),
('KRY004', 'Indah Permatasari', '085511223344', '1997-07-07', 'Perempuan', 'Jl. Taman No. 6', '10.00-19.00', '3276019700010004'),
('KRY005', 'Siti Nurhaliza', '087788899900', '2000-01-20', 'Perempuan', 'Jl. Raya No. 11', '08.00-17.00', '3276020000010005');

-- Data supplier
INSERT INTO SUPPLIER (ID_supplier, Nama, Alamat, NoTlpn) VALUES
  ('SUP001', 'PT Cantik Abadi', 'Jl. Industri No. 1', '081112223333'),
  ('SUP002', 'CV Glow Up', 'Jl. Pabrik No. 2', '082223334444'),
  ('SUP003', 'Natural Beauty Co.', 'Jl. Mawar No. 3', '083334445555'),
  ('SUP004', 'Fresh Skin Supplier', 'Jl. Anggrek No. 4', '084445556666'),
  ('SUP005', 'Mega Kosmetik', 'Jl. Dahlia No. 5', '085556667777');

-- Data Produk
INSERT INTO PRODUK (ID_produk, Nama_produk, Harga, Kategori) VALUES
('PRD006', 'Cleansing Milk', 45000, 'Skincare'),
('PRD007', 'Masker Wajah Clay', 55000, 'Skincare'),
('PRD008', 'Eyeliner Waterproof', 40000, 'Makeup'),
('PRD009', 'Blush On Natural', 50000, 'Makeup'),
('PRD010', 'Moisturizer Aloe Vera', 60000, 'Skincare');

-- Data stok
INSERT INTO STOK VALUES
('PRD001', 'SUP001', 75000.00, 100),
('PRD002', 'SUP002', 35000.00, 150),
('PRD003', 'SUP003', 40000.00, 120),
('PRD004', 'SUP004', 60000.00, 80),
('PRD005', 'SUP005', 95000.00, 60);

-- Data Customer
INSERT INTO CUSTOMER VALUES
('CST001', 'Lia Maharani', 'lia@gmail.com', '089911122233', 'Jl. Nusa Indah No. 5'),
('CST002', 'Rian Pratama', 'rianp@yahoo.com', '087755566677', 'Jl. Flamboyan No. 6'),
('CST003', 'Maya Dewi', 'mayadewi@gmail.com', '081223344556', 'Jl. Cendana No. 7'),
('CST004', 'Dina Arsy', 'dinaarsy@mail.com', '082211009988', 'Jl. Kemuning No. 8'),
('CST005', 'Ari Wibowo', 'ariwibowo@mail.com', '083344556600', 'Jl. Kenari No. 9');

-- Data transaksi
INSERT INTO TRANSAKSI VALUES
('TRX001', '2025-04-01', 'Tunai', 150000.00, 'CST001', 'KRY001'),
('TRX002', '2025-04-02', 'Transfer', 95000.00, 'CST002', 'KRY002'),
('TRX003', '2025-04-03', 'E-Wallet', 60000.00, 'CST003', 'KRY003'),
('TRX004', '2025-04-04', 'Tunai', 35000.00, 'CST004', 'KRY004'),
('TRX005', '2025-04-05', 'Transfer', 40000.00, 'CST005', 'KRY005');

-- Data Kurir
INSERT INTO KURIR VALUES
('KUR001', 'Agus Haryanto', '3276019000010001', '081234009900', 'Laki-laki', 'SIMC12345'),
('KUR002', 'Siti Maesaroh', '3276019000010002', '081233344455', 'Perempuan', 'SIMC67890'),
('KUR003', 'Anton Saputra', '3276019000010003', '081299988877', 'Laki-laki', 'SIMC54321'),
('KUR004', 'Tia Rahmawati', '3276019000010004', '082200011122', 'Perempuan', 'SIMC11223'),
('KUR005', 'Joko Purwanto', '3276019000010005', '083344556677', 'Laki-laki', 'SIMC33445');

-- Data Pengantar
INSERT INTO PENGANTARAN VALUES
('PGT001', 'KUR001', 'CST001'),
('PGT002', 'KUR002', 'CST002'),
('PGT003', 'KUR003', 'CST003'),
('PGT004', 'KUR004', 'CST004'),
('PGT005', 'KUR005', 'CST005');

-- cek semua data
SELECT * FROM OWNER;
SELECT * FROM KARYAWAN;
SELECT * FROM SUPPLIER;
SELECT * FROM PRODUK;
SELECT * FROM STOK;
SELECT * FROM CUSTOMER;
SELECT * FROM TRANSAKSI;
SELECT * FROM KURIR;
SELECT * FROM PENGANTARAN;


-- Untuk melihat database apa saja yang ada agar dapat memilih atau menggunakan salah satunya
SHOW DATABASES;

-- Untuk memahami struktur tabel sebelum melakukan query
DESCRIBE STOK;

-- Menampilkan daftar nama pelanggan saja.
SELECT Nama FROM customer;

-- Menampilkan daftar nama beserta email pelanggan
SELECT Nama,Email FROM customer;

-- Berguna jika melakukan join antar tabel untuk menghindari ambiguitas kolom.
SELECT customer.Nama FROM customer;

-- Digunakan saat kamu berada di luar database toko_kosmetik, tetapi ingin mengambil data dari sana
SELECT toko_kosmetik.customer.Alamat FROM customer;

--  Untuk memberi nama alternatif pada kolom yang ditampilkan.
SELECT Nama AS Nm FROM customer;

-- Alias Nm tetap digunakan, namun dengan penulisan yang lebih singkat
SELECT Nama Nm FROM customer;

-- Alias tabel ini bermanfaat terutama saat melakukan join antar tabel.
SELECT Nama FROM customer AS ctmr;

-- Mengambil kolom Nama dari alias tabel ctmr (yang merepresentasikan customer)
SELECT ctmr.Nama FROM customer AS ctmr;




