-- Nama : Yunda Oktaviani
-- NIM : 22241023
-- MODUL : 3

-- maenggunakan database
use MartUndikma;

-- ORDER BY

-- Mengambil nama produk dan qty urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- Mengambil nama produk da qty urutkan berdasarkan qty diikuti dengan nama_produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab qty
ORDER BY qty, nama_produk;


-- LATIHAN 1
-- Menampilkan semua kolom dari table penjualan qty dengan mengurutkan tanggal transaksi
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;

-- Menampilkan semua kolom tabel pelanggan qty dengan mengurutkan nama pelanggan
SELECT nama_pelanggan qty FROM ms_pelanggan_dqlab ORDER BY qty, nama_pelanggan;

-- Menamplkan semua kolom tabel pelanggan qty dengan mengurutkan alamat
SELECT alamat qty FROM ms_pelanggan_dqlab ORDER BY qty, alamat;



-- ASC dan DESC
-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil, nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty DESC, nama_produk ASC;


-- LATIHAN 2
-- Menampilkan semua kolom dari table penjualan qty dengan mengurutkan tanggal transaksi besar ke kecil
SELECT * FROM tr_penjualan_dqlab ORDER BY qty DESC, tgl_transaksi ASC;

-- Menampilkan semua kolom tabel pelanggan qty dengan mengurutkan nama pelanggan dari besar ke kecil
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;

-- Menamplkan semua kolom tabel pelanggan qty dengan mengurutkan alamat dari kecil ke besar
SELECT * FROM ms_pelanggan_dqlab ORDER BY  alamat DESC;



-- Menggunakan hasil perhitungan pada ORDER BY
-- Mengambil nama produk, qty, harga dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT nama_produk, qty*harga AS total_bayar
FROM tr_penjualan_dqlab 
ORDER BY total_bayar DESC;

-- LATIHAN 3
-- Urutkan total harga, rumusan jumlah barang dikali harga dikurangi diskon
SELECT nama_produk, qty, harga diskon_persen,
(diskon_persen/100)*harga AS diskon, 
qty *(harga-(diskon_persen / 100)*harga) AS total_bayar
FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;


-- WHERE dan ORDER BY
-- Mengambil nama produk, qty dari produk berawalan F urut berdasarkan qty besar ke kecil
SELECT nama_produk, qty
FROM tr_penjualan_dqlab 
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;


-- LATIHAN 4
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen ORDER BY harga DESC;

SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >=100000 ORDER BY harga DESC;

SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >=100000 OR  nama_produk LIKE 'T' ORDER BY diskon_persen DESC;



-- FUNGSI AGREGASI
-- Hitung jumlah nilai qty dari seluruh row di tabel penjualan
SELECT sum(qty) AS total_qty FROM tr_penjualan_dqlab;

-- Hitung jumlah seluruh row pada tabel penjualan
SELECT count(*) AS jumlah_row FROM tr_penjualan_dqlab;

-- Hitung penjumlahan nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT sum(qty), count(*) FROM tr_penjualan_dqlab;

-- Hitung rata-rata nilai maksimum dan minimum dari qty pada tabel penjualan
SELECT avg(qty), max(qty), min(qty) FROM tr_penjualan_dqlab;

-- Hitung jumlah nlai unik dari nama produk di tabel penjualan
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

SELECT count(nama_produk) FROM tr_penjualan_dqlab;

-- Hitung jumlah nilau unik dan seluruh row pada tabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- Menampilkan field nama produk dan fungsi agregasi maksimum qty dari tabel penjualan
SELECT nama_produk, max(qty) FROM tr_penjualan_dqlab;


-- GROUP BY
-- Ambil hasil pengelompokan nilai kolo nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab
GROUP BY nama_produk;

SELECT nama_produk FROM tr_penjualan_dqlab;

-- Ambil hasil pengelompokan dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab
GROUP BY nama_produk, qty;

-- Ambil hasil penjumlahan qty dar pengelompokan nama produk terhadap semua row di tabel penjualan
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY sum(qty)DESC;



-- HAVING
-- Ambil jumlah qty > 2 dari hasil pengelompokan nama produk di tabel penjualan
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab 
GROUP BY nama_produk
HAVING sum(qty) > 2;

-- LATIHAN
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) > 4;
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) = 9;
SELECT nama_produk, qty *(harga-(diskon_persen / 100)*harga) AS total_bayar
FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;





