-- Nama : Yunda Oktaviani
-- NIM : 22241023
-- UAS

-- maenggunakan database
use MartUndikma;


-- NOMOR 1
SELECT nama_produk, SUM(qty*(harga- diskon_persen / 100*harga)) AS revenue
FROM tr_penjualan_dqlab GROUP BY nama_produk 
ORDER BY revenue ASC LIMIT 5;



-- NOMOR 2
SELECT kode_pelanggan,
CASE 
WHEN SUM(qty*(harga- diskon_persen / 100*harga)) >= 900000 THEN 'Target Achieved'
WHEN SUM(qty*(harga- diskon_persen / 100*harga)) < 900000 THEN 'Less performed'
ELSE 'Follow Up'
END AS revenue
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan
HAVING revenue = 'Follow Up'
LIMIT 3;


-- NOMOR 3
SELECT mp.nama_pelanggan, mp.alamat 
FROM ms_pelanggan_dqlab AS mp LEFT JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan

GROUP BY mp.nama_pelanggan, mp.alamat
HAVING sum(mp.nama_pelanggan) IS NOT NULL;






