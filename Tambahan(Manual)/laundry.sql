-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2024 pada 08.55
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_cucian`
--

CREATE TABLE `jenis_cucian` (
  `kd_jenis` int(11) NOT NULL,
  `jenis_cucian` varchar(30) NOT NULL,
  `harga` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jenis_cucian`
--

INSERT INTO `jenis_cucian` (`kd_jenis`, `jenis_cucian`, `harga`) VALUES
(1, 'Cuci + Setrika', 6000),
(2, 'Cuci Biasa', 4000),
(3, 'Cuci Express', 8000),
(4, 'Sprei', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(35) NOT NULL,
  `nama_pelanggan` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `telp`) VALUES
(1, 'Fatih', 'Tambaksari', '08567868787'),
(2, 'Farhan', 'Cilongok', '08765463741');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaan`
--

CREATE TABLE `penerimaan` (
  `no_order` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(40) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `t_bayar` int(20) NOT NULL,
  `bayar` int(20) NOT NULL,
  `sisa` int(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `kd_jenis` int(11) NOT NULL,
  `jenis_cucian` varchar(40) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `pengerjaan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penerimaan`
--

INSERT INTO `penerimaan` (`no_order`, `id_pelanggan`, `nama_pelanggan`, `tgl_masuk`, `tgl_keluar`, `t_bayar`, `bayar`, `sisa`, `status`, `kd_jenis`, `jenis_cucian`, `harga`, `berat`, `keterangan`, `pengerjaan`) VALUES
(1, 2, 'Fatih', '2024-01-05', '2024-01-07', 12000, 2000, -10000, 'Lunas', 1, 'Cuci + Setrika', 6000, 2, '', 'Diberikan'),
(2, 2, 'Farhan', '2024-01-05', '2024-01-08', 16000, 6000, -10000, 'Lunas', 3, 'Cuci Express', 8000, 2, '', 'Diberikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `hakakses` enum('admin','user','','') NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `hakakses`, `nama_pengguna`) VALUES
(5, 'admin', 'admin', 'admin', 'Ini Admin'),
(8, 'user', 'user', 'user', 'Ini User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_order` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `tgl_transaksi`, `no_order`, `dibayar`, `kembalian`) VALUES
(1, '2024-01-05', 1, 10000, 0),
(2, '2024-01-05', 2, 10000, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_cucian`
--
ALTER TABLE `jenis_cucian`
  ADD PRIMARY KEY (`kd_jenis`),
  ADD KEY `kd_jenis` (`kd_jenis`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`no_order`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kd_jenis` (`kd_jenis`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `no_order` (`no_order`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_cucian`
--
ALTER TABLE `jenis_cucian`
  MODIFY `kd_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(35) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penerimaan`
--
ALTER TABLE `penerimaan`
  MODIFY `no_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD CONSTRAINT `penerimaan_ibfk_2` FOREIGN KEY (`kd_jenis`) REFERENCES `jenis_cucian` (`kd_jenis`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`no_order`) REFERENCES `penerimaan` (`no_order`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
