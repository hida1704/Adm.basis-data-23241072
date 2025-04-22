-- nama     : hida
-- NIM      : 23241072
-- kelas    : B
-- modul    : 2 (SELECT)

-- Membuat database
CREATE DATABASE pti_mart;

-- Menggunakan database
USE pti_mart

-- cek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT
-- menggynakan SELECT untuk 1 tabel
-- mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- Mengambil lebih dari satu kolom dari sebuah tabel
SELECT nama_produk,harga FROM ms_produk;

--  Latihan
-- mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk,nama_produk FROM ms_produk

-- Mengambil seluruh kolom dari tabel penjualan
SELECT  FROM tr_penjualan,

-- PREFIX dan ALIAS
-- PREFIX,bagian objek database yang hirarkinya lebih tinggi

-- Menggunakan PREFIX nama tabel untuk kolom nama_prodak dari tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- ALIAS, nama sementara untuk objek database
-- Mengganti sementara kolom nama_produk dengan ALIAS
SELECT nama_produk AS np FROM ma_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti sementara tabel dengan ALIAS
SELECT nama_prodak FROM ms_prodak AS msp;

-- kombinasikan PREFIX dan ALIAS
SELECT msp.nama_produk FROM ms_produk AS msp;
-- case 1
SELECT nama_pelanggan , alamat FROM ms_pelanggan;
-- case 2
SELECT nama_produk,harga FROM ms_produk;