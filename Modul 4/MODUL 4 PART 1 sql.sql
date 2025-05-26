-- Nama : nurwahidah
-- Nim : 23241072
-- Kelas : B
-- Modul : ORDER BY,Fungsi Agregasi,GROUP BY,HAVING

-- Menggunakan Database
USE pti_mart;

-- ORDER BY
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk,qty FROM tr_penjualan ORDER by qty;

-- Ambil nama produk dan qty dari tb penjualan urutkan qty dan nama produk
SELECT nama_produk,qty FROM tr_penjualan ORDER by qty,nama_produk;

-- Menampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan berdasarkan qty dan tgl_transaksi
SELECT * FROM tr_penjualan ORDER BY qty,tgl_transaksi;

-- Menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- Menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ORDER BY ASC dan desc
-- Ambil nama produk,qty dari tb penjualan urutkan qty besar ke kecil
SELECT nama_produk,qty FROM tr_penjualan ORDER BY qty DESC;

-- Ambil nama produk qty dari tb penjualan urutkan qty dan nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- menampilkan semua kolom dari tabel tr_penjualan_dqlab dengan mengurutkan berdasarkan tgl_tranksaksi secara descending dan qty
SELECT * FROM tr_penjualan ORDER BY qty,tgl_transaksi DESC;

-- Menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara descending 
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

-- Menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat secara descending 
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- order by dari hasil perhitungan
-- ambil nama produk, qty,harga,harga*qty dari tb penjualan urutkan harga*qty besar kecil
SELECT nama_produk,harga,qty,harga*qty AS total FROM tr_penjualan ORDER BY qty DESC,total DESC;

SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
ORDER BY total_bayar DESC;

-- 1 menampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan 
-- berdasarkan harga tertinggi
SELECT *
FROM tr_penjualan
 WHERE diskon_persen IS NOT NULL
 ORDER BY harga DESC; 
 
 -- 2 Tampilkan kolom nama produk, kuantitas pembelian, dan harga dari transaksi penjualan 
 -- yang memiliki harga minimal seratus ribu rupiah dan diurutkan berdasarkan harga tertinggi.
 SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- 3 Tampilkan kolom nama produk, kuantitas pembelian, dan harga dari transaksi penjualan yang memiliki harga minimal
-- seratus ribu rupiah atau nama produk berawalan karakter 'T' dan diurutkan berdasarkan diskon tertinggi.
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

-- cek data pelanggan
SELECT * FROM ms_pelanggan;
SELECT * FROM ms_produk;
SELECT * FROM tr_penjualan;