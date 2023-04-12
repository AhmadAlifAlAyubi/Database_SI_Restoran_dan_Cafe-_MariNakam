-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2023 pada 05.48
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restorancafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria_cafe`
--

CREATE TABLE `kriteria_cafe` (
  `ID_Kriteria_Cafe` varchar(5) NOT NULL,
  `Nama_Kriteria_Cafe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria_restoran`
--

CREATE TABLE `kriteria_restoran` (
  `ID_Kriteria_Restoran` varchar(5) NOT NULL,
  `Nama_Kriteria_Restoran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_cafe`
--

CREATE TABLE `tb_cafe` (
  `ID_Cafe` varchar(5) NOT NULL,
  `ID_Pegawai` varchar(5) NOT NULL,
  `Nama_Cafe` varchar(20) NOT NULL,
  `Alamat_Cafe` varchar(50) NOT NULL,
  `Rating_Cafe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_makanan`
--

CREATE TABLE `tb_makanan` (
  `ID_Makanan` varchar(5) NOT NULL,
  `ID_Restoran` varchar(5) NOT NULL,
  `ID_Cafe` varchar(5) NOT NULL,
  `Nama_Makanan` varchar(20) NOT NULL,
  `Harga_Makanan` int(10) NOT NULL,
  `Deskripsi_Makanan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_minuman`
--

CREATE TABLE `tb_minuman` (
  `ID_Minuman` varchar(5) NOT NULL,
  `ID_Restoran` varchar(5) NOT NULL,
  `ID_Cafe` varchar(5) NOT NULL,
  `Nama_Minuman` varchar(20) NOT NULL,
  `Harga_Minuman` int(10) NOT NULL,
  `Deskripsi_Minuman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `ID_Pegawai` varchar(5) NOT NULL,
  `ID_User` varchar(5) NOT NULL,
  `Nama_Pegawai` varchar(20) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat_Pegawai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `ID_Pelanggan` varchar(5) NOT NULL,
  `ID_User` varchar(5) NOT NULL,
  `Nama_Pelanggan` varchar(20) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat_Pelanggan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaian_cafe`
--

CREATE TABLE `tb_penilaian_cafe` (
  `ID_Penilaian_Cafe` varchar(5) NOT NULL,
  `ID_Pelanggan` varchar(5) NOT NULL,
  `ID_Cafe` varchar(5) NOT NULL,
  `ID_Kriteria_Cafe` varchar(5) NOT NULL,
  `Nilai_Penilaian_Cafe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaian_restoran`
--

CREATE TABLE `tb_penilaian_restoran` (
  `ID_Penilaian_Restoran` varchar(5) NOT NULL,
  `ID_Pelanggan` varchar(5) NOT NULL,
  `ID_Restoran` varchar(5) NOT NULL,
  `ID_Kriteria_Restoran` varchar(5) NOT NULL,
  `Nilai_Penilaian_Restoran` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan_cafe`
--

CREATE TABLE `tb_pesanan_cafe` (
  `ID_Pesanan_Cafe` varchar(5) NOT NULL,
  `ID_Pelanggan` varchar(5) NOT NULL,
  `ID_Cafe` varchar(5) NOT NULL,
  `ID_Makanan` varchar(5) NOT NULL,
  `ID_Minuman` varchar(5) NOT NULL,
  `Jumlah_Makanan` int(2) NOT NULL,
  `Jumlah_Minuman` int(2) NOT NULL,
  `Tanggal_Pesan` date NOT NULL,
  `Total_Harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan_restoran`
--

CREATE TABLE `tb_pesanan_restoran` (
  `ID_Pesanan_Restoran` varchar(5) NOT NULL,
  `ID_Pelanggan` varchar(5) NOT NULL,
  `ID_Restoran` varchar(5) NOT NULL,
  `ID_Makanan` varchar(5) NOT NULL,
  `ID_Minuman` varchar(5) NOT NULL,
  `Jumlah_Makanan` int(2) NOT NULL,
  `Jumlah_Minuman` int(2) NOT NULL,
  `Tanggal_Pesanan` date NOT NULL,
  `Total_Harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_restoran`
--

CREATE TABLE `tb_restoran` (
  `ID_Restoran` varchar(5) NOT NULL,
  `ID_Pegawai` varchar(5) NOT NULL,
  `Nama_Restoran` varchar(20) NOT NULL,
  `Alamat_Restoran` varchar(50) NOT NULL,
  `Rating_Restoran` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `ID_User` varchar(5) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Pilihan` enum('Pelanggan,Pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kriteria_cafe`
--
ALTER TABLE `kriteria_cafe`
  ADD PRIMARY KEY (`ID_Kriteria_Cafe`);

--
-- Indeks untuk tabel `kriteria_restoran`
--
ALTER TABLE `kriteria_restoran`
  ADD PRIMARY KEY (`ID_Kriteria_Restoran`);

--
-- Indeks untuk tabel `tb_cafe`
--
ALTER TABLE `tb_cafe`
  ADD PRIMARY KEY (`ID_Cafe`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indeks untuk tabel `tb_makanan`
--
ALTER TABLE `tb_makanan`
  ADD PRIMARY KEY (`ID_Makanan`),
  ADD KEY `ID_Restoran` (`ID_Restoran`),
  ADD KEY `ID_Cafe` (`ID_Cafe`);

--
-- Indeks untuk tabel `tb_minuman`
--
ALTER TABLE `tb_minuman`
  ADD PRIMARY KEY (`ID_Minuman`),
  ADD KEY `ID_Restoran` (`ID_Restoran`),
  ADD KEY `ID_Cafe` (`ID_Cafe`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`ID_Pelanggan`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indeks untuk tabel `tb_penilaian_cafe`
--
ALTER TABLE `tb_penilaian_cafe`
  ADD PRIMARY KEY (`ID_Penilaian_Cafe`),
  ADD KEY `ID_Cafe` (`ID_Cafe`),
  ADD KEY `ID_Kriteria_Cafe` (`ID_Kriteria_Cafe`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indeks untuk tabel `tb_penilaian_restoran`
--
ALTER TABLE `tb_penilaian_restoran`
  ADD PRIMARY KEY (`ID_Penilaian_Restoran`),
  ADD KEY `ID_Restoran` (`ID_Restoran`),
  ADD KEY `ID_Kriteria_Restoran` (`ID_Kriteria_Restoran`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indeks untuk tabel `tb_pesanan_cafe`
--
ALTER TABLE `tb_pesanan_cafe`
  ADD PRIMARY KEY (`ID_Pesanan_Cafe`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Cafe` (`ID_Cafe`),
  ADD KEY `ID_Makanan` (`ID_Makanan`),
  ADD KEY `ID_Minuman` (`ID_Minuman`);

--
-- Indeks untuk tabel `tb_pesanan_restoran`
--
ALTER TABLE `tb_pesanan_restoran`
  ADD PRIMARY KEY (`ID_Pesanan_Restoran`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Restoran` (`ID_Makanan`),
  ADD KEY `ID_Cafe` (`ID_Minuman`),
  ADD KEY `ID_Makanan` (`ID_Makanan`),
  ADD KEY `ID_Minuman` (`ID_Minuman`),
  ADD KEY `ID_Restoran_2` (`ID_Restoran`);

--
-- Indeks untuk tabel `tb_restoran`
--
ALTER TABLE `tb_restoran`
  ADD PRIMARY KEY (`ID_Restoran`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`ID_User`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_cafe`
--
ALTER TABLE `tb_cafe`
  ADD CONSTRAINT `tb_cafe_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_Pegawai`);

--
-- Ketidakleluasaan untuk tabel `tb_makanan`
--
ALTER TABLE `tb_makanan`
  ADD CONSTRAINT `tb_makanan_ibfk_1` FOREIGN KEY (`ID_Cafe`) REFERENCES `tb_cafe` (`ID_Cafe`),
  ADD CONSTRAINT `tb_makanan_ibfk_2` FOREIGN KEY (`ID_Restoran`) REFERENCES `tb_restoran` (`ID_Restoran`);

--
-- Ketidakleluasaan untuk tabel `tb_minuman`
--
ALTER TABLE `tb_minuman`
  ADD CONSTRAINT `tb_minuman_ibfk_1` FOREIGN KEY (`ID_Cafe`) REFERENCES `tb_cafe` (`ID_Cafe`),
  ADD CONSTRAINT `tb_minuman_ibfk_2` FOREIGN KEY (`ID_Restoran`) REFERENCES `tb_restoran` (`ID_Restoran`);

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `tb_user` (`ID_User`);

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `tb_user` (`ID_User`);

--
-- Ketidakleluasaan untuk tabel `tb_penilaian_cafe`
--
ALTER TABLE `tb_penilaian_cafe`
  ADD CONSTRAINT `tb_penilaian_cafe_ibfk_1` FOREIGN KEY (`ID_Kriteria_Cafe`) REFERENCES `kriteria_cafe` (`ID_Kriteria_Cafe`),
  ADD CONSTRAINT `tb_penilaian_cafe_ibfk_2` FOREIGN KEY (`ID_Cafe`) REFERENCES `tb_cafe` (`ID_Cafe`),
  ADD CONSTRAINT `tb_penilaian_cafe_ibfk_3` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `tb_pelanggan` (`ID_Pelanggan`);

--
-- Ketidakleluasaan untuk tabel `tb_penilaian_restoran`
--
ALTER TABLE `tb_penilaian_restoran`
  ADD CONSTRAINT `tb_penilaian_restoran_ibfk_1` FOREIGN KEY (`ID_Kriteria_Restoran`) REFERENCES `kriteria_restoran` (`ID_Kriteria_Restoran`),
  ADD CONSTRAINT `tb_penilaian_restoran_ibfk_2` FOREIGN KEY (`ID_Restoran`) REFERENCES `tb_restoran` (`ID_Restoran`),
  ADD CONSTRAINT `tb_penilaian_restoran_ibfk_3` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `tb_pelanggan` (`ID_Pelanggan`);

--
-- Ketidakleluasaan untuk tabel `tb_pesanan_cafe`
--
ALTER TABLE `tb_pesanan_cafe`
  ADD CONSTRAINT `tb_pesanan_cafe_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `tb_pelanggan` (`ID_Pelanggan`),
  ADD CONSTRAINT `tb_pesanan_cafe_ibfk_2` FOREIGN KEY (`ID_Cafe`) REFERENCES `tb_cafe` (`ID_Cafe`),
  ADD CONSTRAINT `tb_pesanan_cafe_ibfk_3` FOREIGN KEY (`ID_Makanan`) REFERENCES `tb_makanan` (`ID_Makanan`),
  ADD CONSTRAINT `tb_pesanan_cafe_ibfk_4` FOREIGN KEY (`ID_Minuman`) REFERENCES `tb_minuman` (`ID_Minuman`);

--
-- Ketidakleluasaan untuk tabel `tb_pesanan_restoran`
--
ALTER TABLE `tb_pesanan_restoran`
  ADD CONSTRAINT `tb_pesanan_restoran_ibfk_1` FOREIGN KEY (`ID_Makanan`) REFERENCES `tb_makanan` (`ID_Makanan`),
  ADD CONSTRAINT `tb_pesanan_restoran_ibfk_2` FOREIGN KEY (`ID_Minuman`) REFERENCES `tb_minuman` (`ID_Minuman`),
  ADD CONSTRAINT `tb_pesanan_restoran_ibfk_3` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `tb_pelanggan` (`ID_Pelanggan`),
  ADD CONSTRAINT `tb_pesanan_restoran_ibfk_4` FOREIGN KEY (`ID_Restoran`) REFERENCES `tb_restoran` (`ID_Restoran`);

--
-- Ketidakleluasaan untuk tabel `tb_restoran`
--
ALTER TABLE `tb_restoran`
  ADD CONSTRAINT `tb_restoran_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_Pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
