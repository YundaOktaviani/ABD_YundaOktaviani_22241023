-- Nama : Yunda Oktaviani
-- NIM : 22241023
-- MODUL 5

-- maenggunakan database
use MartUndikma;

-- JOIN
-- Tampilkan nama pelanggan dan qty belanjanya
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Join tanpa filtering ON = CROSS JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON true;

-- INNER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp INNER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp LEFT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp  RIGHT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan
WHERE tp.qty IS NULL;

-- JOIN 3 Table
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- ORDER BY pada JOIN
-- Urutkan berdasarkan qty
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;

-- GROUPING dan fungsi AGREGASI pada JOIN
-- Menampilkan summary total produk yang terjual
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
ORDER BY sum(tp.qty) DESC;

SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING sum(tp.qty) IS NOT NULL
ORDER BY sum(tp.qty) DESC;



-- LATIHAN MADIRI
-- 1
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- 2
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , sum(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp 
INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk , mpd.nama_produk
ORDER BY sum(qty) DESC;

-- 4
SELECT mp1.kode_produk AS kode_produk_1, 
mp1.nama_produk AS nama_produk_1, 
mp2.kode_produk AS kode_produk_2, 
mp2.nama_produk AS nama_produk_2,
mp1.kategori_produk
FROM ms_produk_dqlab AS mp1
JOIN ms_produk_dqlab AS mp2
ON mp1.kategori_produk = mp2.kategori_produk
AND mp1.kode_produk != mp2.kode_produk;



