-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2024 pada 19.13
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(8, '2023-12-19', '00:24:08', 'Masuk', 13),
(9, '2023-12-19', '00:25:22', 'Pulang', 13),
(10, '2023-12-19', '00:51:41', 'Masuk', 14),
(11, '2023-12-19', '00:51:53', 'Pulang', 14),
(12, '2023-12-19', '00:52:02', 'Masuk', 14),
(13, '2023-12-19', '00:55:37', 'Masuk', 14),
(14, '2023-12-19', '00:55:42', 'Masuk', 14),
(15, '2023-12-29', '12:02:18', 'Masuk', 3),
(16, '2024-01-08', '08:00:02', 'Masuk', 3),
(17, '2024-01-08', '11:46:48', 'Pulang', 3),
(18, '2024-01-09', '21:47:58', 'Masuk', 2),
(19, '2024-01-09', '21:55:15', 'Masuk', 11),
(20, '2024-01-09', '21:58:43', 'Masuk', 11),
(21, '2024-01-09', '22:41:31', 'Pulang', 11),
(22, '2024-01-09', '22:41:38', 'Masuk', 11),
(23, '2024-01-09', '22:41:42', 'Masuk', 11),
(24, '2024-01-09', '22:43:00', 'Masuk', 12),
(25, '2024-01-09', '22:43:02', 'Pulang', 12),
(26, '2024-01-09', '23:37:54', 'Masuk', 13),
(27, '2024-01-09', '23:45:53', 'Masuk', 12),
(28, '2024-01-09', '23:47:02', 'Masuk', 14),
(29, '2024-01-09', '23:57:14', 'Pulang', 14),
(30, '2024-01-09', '23:58:14', 'Masuk', 14),
(31, '2024-01-10', '00:10:33', 'Masuk', 14),
(32, '2024-01-10', '00:11:55', 'Pulang', 14),
(33, '2024-01-10', '00:13:28', 'Masuk', 12),
(34, '2024-01-10', '00:14:22', 'Pulang', 12),
(35, '2024-01-10', '01:11:23', 'Masuk', 15),
(36, '2024-01-10', '01:11:29', 'Masuk', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` smallint(3) UNSIGNED NOT NULL,
  `nama_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'KETUA BADAN BAITUL MAL'),
(2, 'KASUBAG KEUANGAN & PROGRAM'),
(3, 'KASUBAG PENGEMBANGAN INFORMASI TEKNOLOGI'),
(5, 'KASUBAG UMUM & KEPEGAWAIAN'),
(6, 'TENAGA  AHLI PROFESIONAL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '02:00:00', '08:30:00', 'Masuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) UNSIGNED DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(1, '', 'Nuzul Althaf', '082315091742', 'nuzulalthaff@gmail.com', '1702919066.jpg', NULL, 'Althaf', '$2y$10$9lKXM8zdeDwIrMG9cbwhcueqZcB5J/4hu.skbvK7gx2vIa3R.MxAe', 'Manager'),
(2, '21017028888', 'MUNIRWANN', '0812342445611', 'munirwanN@gmail.com', 'no-foto.png', 1, 'munirwanN', '$2y$10$YCv87gj/yCtrPUcROn16Kue56NNMebWDVwycQ4beSCYFdrl00DT1S', 'Karyawan'),
(3, '192007112007011002', 'Irfandi S.sos', '+62 823-0443-23', 'irfandibm@yahoo.co.id', '1703826119.jpg', 1, 'Irfandi S.sos', '$2y$10$c5XX7mqTA3FvrF/k3AC52uJWXKyArQyKFnqlimx2FrR1KiK.tMNd.', 'Karyawan'),
(4, '1920071120070115482', 'Tgk. Arifuddin', '081254789453', 'arifuddin@gmail.com', 'no-foto.png', 6, 'Tgk. Arifuddin', '$2y$10$NrCbcPKC9fVhxAh0Nwpv0uQOM60akjkjkestZj6KCRVGwM7iUPy1W', 'Karyawan'),
(5, '192007112007055847', 'Siti Asiah S.Sos', '085247896425', 'sitiasiah@gmail.com', 'no-foto.png', 2, 'Siti Asiah S.Sos', '$2y$10$eFP2Av4nxRtKaC3rJ3rucOb9zqISQTXBKLIxCSpcdGIASFOelwSEi', 'Karyawan'),
(6, '19760929 2012121001	', 'Badiuzzaman S.Sos', '081254963275', 'badi@gmail.com', 'no-foto.png', 3, 'Badiuzzaman', '$2y$10$6CvqAoiOM246ZzdPRfi6A..S0oVqJhbCOvg1USa8iTgSSi4orRYVq', 'Karyawan'),
(7, '197609292012121202', 'Tgk. Syuib', '085236471524', 'syuib@gmail.com', 'no-foto.png', 1, 'Tgk. Syuib', '$2y$10$2U1tm4VXCJVAKIUdCOa7KeDCVWKTN1xiUFsVa8qcSQbeRb1EESIGK', 'Karyawan'),
(8, '19200711200708743625', 'Tgk. Saifullah', '+6281368974526', 'saifullah123@gmail.com', 'no-foto.png', 1, 'Tgk. Saifullah', '$2y$10$zk/PTZlz7d31iUyrvo/rKeOFnjfh.AlOJElB.oMxY3/QOzepuNP4e', 'Karyawan'),
(9, '1110852367261875', 'Tgk. Muhammad Isa', '+628 5324879614', 'misa324@gmail.com', 'no-foto.png', 1, 'Tgk.  Muhammad Isa', '$2y$10$JRyhv13ai1XGkdUnOhv31egV.vUkI226ShXF4BmLGeU9H4b/neR3a', 'Karyawan'),
(10, '1920071120070136477', 'Tgk. M Saleh Yatim', '+6285369874100', 'bmk321@gmail.com', 'no-foto.png', 1, 'Tgk. M Saleh Yatim', '$2y$10$XD1V9jZAw9nJzTbXZdkfPOccbows/IxTuy.aVk4pK046qHaoc5WSe', 'Karyawan'),
(15, '11110311', 'rizki', '0812342445611', 'curhattempat8@gmail.com', 'no-foto.png', 5, 'rizki', '$2y$10$ZpyKGBNbdhnlmoiUDvnd0eqzSCqEb7sgQ8V2nZow1/Xr5DBlC996a', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `tgl` (`tgl`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
