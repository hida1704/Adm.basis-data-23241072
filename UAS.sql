

-- NAMA : Nurwahidah apriaty
-- NIM  :23241072
-- KELAS:PTI\b
-- MATA KULIAH :adminitsrasi basis data

-- soal 1
-- menampilkan nama produk,tgl teransaksi bulan 30 juni 2023 atas semua produk di teransaks

SELECT nama_produk, tgl_ teransaksi,
MONTH ( tgl_transaksi ) AS bulan,
YEAR tgl,(transaksi ) AS tahun,
DATEDIFF ( '2023-06-30; tgl_transaksi ') AS selisih_hari 
FROM tr_penjualan; 

-- soal 2
-- menampilkan nama pelanggan dan nilai transaksinya dengan nilai teransaksi terkecil
-- SELECT
-- np. nama,pelanggan
-- NIM (tp,qty * tp.harga) AS teransaksi_terkecil
-- FROM tr penjualan tp
-- JOIN ms_pelanggan mp
-- ON tp_kode pelanggan = mp kode_pelanggan; 

-- soal 3
-- menampilkan bulan,nama produk,kategori,dan haega dari produk yang tidak pernah terjual pada bulan mei
SELECT MONTH (






use pti_mart;