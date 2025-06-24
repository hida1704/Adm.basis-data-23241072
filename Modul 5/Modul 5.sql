-- Nama		: Nurwahidah Apriaty
-- NIM		: 23241072
-- Kelas	: B
-- Modul	: Latihan mandiri Modul 5

-- JOIN
-- Menggabungkan dua buah tabel berdasarkan kolom yang sama nilainya
-- Praktek 1
-- Mengambil nama pelanggan yang pernah bertransaksi dan qtynya
-- Artinya mengambil kolom kode_pelanggan, nama_pelanggan, dan qty
-- dari penggabungkan tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan AS tp
JOIN ms_pelanggan AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktek 2
-- Menggabungkan dua tabel tanpa memperhatikan relational key
-- Mengambil nama pelanggan yang pernah bertransaksi dan qtynya
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan
-- kolom yang menjadi primary key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan AS tp
JOIN ms_pelanggan AS mp
ON TRUE;

-- INNER JOIN
-- join yang mengambil data dari dua sisi tabel yang berhubungan saja
-- praktek 3
-- ambil kode pelanggan, nama pelanggan, nama produk, dan qty
-- dari hasil join tabel transaksi dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan AS tp
INNER JOIN ms_pelanggan AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- latihan mandiri
-- 1. buatlah untuk ketiga table yang terdapat pada pti mart dengan inner join

SELECT tp.kode_pelanggan, mp.nama_pelanggan,
tp.qty,msp.kode_produk
FROM tr_penjualan AS tp, ms_produk AS msp
JOIN ms_pelanggan AS mp
ON TRUE;

-- 2. buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk
-- yang terdapat pada pti_mart dengan LEFT JOIN, kemudian filter untuk qty yang tidak bernilai NULL
-- dengan operator IS NOT NULL

SELECT mp.kode_pelanggan, mp.nama_pelanggan,
tp.kode_produk, pr.nama_produk, tp.qty
FROM ms_pelanggan AS mp
LEFT JOIN tr_penjualan AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk AS pr 
ON tp.kode_produk = pr.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3.buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk
-- yang terdapat pada pti_mart dengan INNER JOIN, kemudian grouping
-- untuk kolom kategori produk dan penjumlahan qty

SELECT pr.kategori_produk, SUM(tp.qty) AS total_qty
FROM ms_pelanggan AS mp
INNER JOIN tr_penjualan AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk AS pr 
ON tp.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;

-- latihan khusus: cobalah lakukan JOIN ms_produk dengan table ms_produk juga dengan
-- kolom relationship kode_produk (benar, anda tidak salah baca) - ini kita lakukan join dengan
-- table sendiri yang memang bisa dilakukan, jangan lupa untuk menggunakan alias

SELECT p1.kode_produk AS kode_produk_utama,
p2.kode_produk AS kode_produk_copy
FROM ms_produk AS p1
INNER JOIN ms_produk AS p2 
ON p1.kode_produk = p2.kode_produk;

