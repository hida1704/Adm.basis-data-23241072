-- Nama : nurwahida apriaty
-- NIM : 23241072
-- Kelas : B 

-- membuat database
CREATE DATABASE mandalika_mart;

-- menggunakan database 'mandalika_mart'
USE mandalika_mart;

-- membuat tabel dalam database 'mandalika_mart'
CREATE TABLE member (
   member_id varchar(10),
   username varchar(20),
   nama varchar(100),
   tanggal_lahir datetime,
   angka_favorite int);
   
   -- membuat tabel dalam database 'undikma_mart'
   CREATE TABLE produk (
	  id_produk varchar(10),
      nama_produk varchar(25),
      kategori varchar(15),
      harga int,
      Qty int);
      
	-- membuat tabel transaksi dalam database 'mandalika_mart'
    CREATE TABLE transaksi_penjualan (
       tgl_jual datetime,
       id_produk varchar(10),
       member_id varchar(10),
       nama_produk varchar(25),
       harga int,
       Qty int);
       
-- mengupdate primary key tabel member, produk
ALTER TABLE member
ADD PRIMARY KEY (member_id);

ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

-- mengupdate foreign key tabel transaksi_penjualan
ALTER TABLE transaksi_penjualan 
ADD CONSTRAINT FK_memberTransaksi
FOREIGN KEY (member_id) REFERENCES member(member_id);

ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_produkTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- mengisi data pada tabel
INSERT INTO member(member_id, username, nama, tanggal_lahir, angka_favorite)
VALUES ('ID-01', 'webmaster', 'Admin', '2004-04-16', 6);

-- mengakses isi data pada tabel member
SELECT * FROM member;
      
      
      
      
   