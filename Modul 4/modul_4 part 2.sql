-- Nama		: nurwahida
-- NIM		: 23241072
-- Kelas	: PTI 4/B 

-- menggunakan database
USE pti_mart;

SELECT * FROM tr_penjualan;

-- ORDER BUY 
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- mengambil nama produk dan qty dari tabel penjualan urutan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- LATIHAN MANDIRI 1
-- Tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan berdasarkan qty dan tgl_transaksi
SELECT *  FROM tr_penjualan ORDER BY qty, tgl_transaksi;

-- praktek 1
-- Tampilkan semua kolom dari tabel ms_penjualan dengan mengurutkan berdasarkan nama_pelanggan 
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- praktek 2
-- Tampilkan semua kolom dari ms_pelanggan dengan mengurutkan berdasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- praktek 3
-- ORDER BY ASC dan BESC
-- ambil nama_produk, qty dari tabel penjualan urutkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Ambil nama produk, qty dari tabel penjualan urutkan qty dan nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- LATIHAN MANDIRI 2
-- tampilkan semua kolom dari tabel tr_penjuatr dengan mengurutkan berdasarkan tgl_transaksi secara descending dan qty secara descending
SELECT * FROM tr_penjualan ORDER BY tgl_transaksi DESC, qty DESC;

-- Tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara descending
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

-- Tampilkan semua kolom dari tabel ms_pelanggan dengan menngurutkan berdasarkan alamat secara descending
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- PRAKTEK 5 
-- Menggunakan perhitungan
-- ORDER BY dari hasil perhitungan 
-- ambil nama produk, qty, harga, harga*qty dari tabel penjualan urutkan harga*qty besar-kecil
SELECT nama_produk, harga, qty, harga*qty AS total
FROM tr_penjualan
ORDER BY qty DESC, total DESC;

-- LATIHAN 3
-- Coba pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang di kurang diskon
SELECT * FROM tr_penjualan; 

-- LATIHAN
SELECT nama_produk, harga, qty, diskon_persen, qty*harga AS total_harga, 
((qty*harga) - ((diskon_persen/100)*harga)) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY diskon_persen DESC, total_bayar DESC;

-- praktek 6 
-- ORDER BY menggunakan WHERE 
-- Ambil nama_produk dan qty dari tabel penjualan yang berawalan huruf F urut berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;
 
-- praktek 7
-- fungsi agregasi
-- digunakan untuk mengolah beberapa baris/row untuk menghasilkan nilai baru
-- Hitung atau jumlahkan seluruh nilai ba ris qty pada tabel penjualan 
SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- praktek 8
-- Hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- Praktek 9 
-- menggunakan dua fungsi agregasi dalam satu query sql
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- Praktek 10 
-- menghitung nilai rata-rata penjualan, penjualan tertinggi per transaksi, dan penjualan terendah pertransaksi
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan;

-- Praktek 11
-- Mengkombinasikan fungsi agregasi dengan kolom tertentu (nama_produk, kolom tgl_transaksi)
SELECT nama_produk, MAX(qty) FROM tr_penjualan;
SELECT tgl_transaksi, nama_produk, MAX(qty) FROM tr_penjualan;

-- Praktek 12
-- COUN(DISTINCT)
-- digunakan untuk menghitung nilai unik saja
-- menghitung nilai untuk yang ada pada nama produk di tabel penjualan
-- tanpa distinct
SELECT COUNT(nama_produk) FROM tr_penjualan;
-- dengan COUNT(DISTICNT) 
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;
SELECT COUNT(nama_produk), COUNT(distinct nama_produk) FROM tr_penjualan;

-- Praktek 14
-- GROUP BY adalah pengelompokan isi data dari 1 atau beberapa kolom namun biasannya di gabungkan dengan fungsi agregasi 
-- group by di letakkan setelah from
-- group by 1 kolom
-- mengelompokan nilai nama produk pada tabel penjualan
SELECT nama_produk FROM tr_penjualan GROUP BY nama_produk;
-- tidak menggukana group by
SELECT nama_produk FROM tr_penjualan;

-- praktek 15
-- mengelompokan nilai nama produk dan qty pada tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan GROUP BY nama_produk, qty;

-- praktek 16
-- ambil qty berdasarkan hasil pengelompokan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan group by nama_produk;

-- praktek 17
-- ambil qty berdasarkan hasil pengelompokan nama produk urutkan dari besar ke kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan group by nama_produk ORDER BY SUM(qty) DESC;

-- HAVING (untuk penyaringan) adalah keyboard SQL untuk melakukan filtering pada hasil fungsi agregasi dengan GROUP BY, dimana WHERE tidak bisa digunakan
-- digunakan untuk filtering untuk GROUP BY fungsia agregasi
-- praktek 18
-- ambil jumlah qty dari nama produk yang jumlah qty > lebih dari 2 berdasarkan hasil pengelompkan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan 
GROUP BY nama_produk HAVING SUM(qty) > 2 ORDER BY SUM(qty) DESC;




