-- Nama : Yunda Oktaviani
-- NIM : 22241023
-- MODUL : 1

-- SELECT : Mengambil 1 kolom Table
SELECT nama_produk FROM ms_produk_dqlab;

-- SELECT : Mengambil lebih dari 1 kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- SELECT : Mengambil semua kolom
SELECT * FROM ms_produk_dqlab;

-- PREFIX dan ALLIAS
-- PREFIX

-- Ambil nama produk dengan prefix tabel 1
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- Ambil nama produk dengan prefix database - tabel
SELECT MartUndikma.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- ALIAS

-- Alias pada kolom dengan AS
SELECT nama_produk as np FROM ms_produk_dqlab;

-- Alias pada kolom tanpa AS
SELECT nama_produk np FROM ms_produk_dqlab;

--Alias pada tabel dengan AS
SELECT nama_produk FROM ms_produk_dqlab AS mpd;

-- Alias pada tabel tanpa AS
SELECT nama_produk FROM ms_produk_dqlab mpd;

-- Penggunaan alias dan prefix
SELECT mpd.nama_produk np FROM ms_produk_dqlab mpd;