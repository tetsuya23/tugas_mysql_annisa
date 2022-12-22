-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Des 2022 pada 09.19
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `Jns_resep` enum('R','S','-') NOT NULL,
  `nm_pasien` varchar(100) NOT NULL,
  `alm_pasien` varchar(100) NOT NULL,
  `Jns_klmn` enum('P','L') NOT NULL,
  `no_hp` char(12) NOT NULL,
  `tgl_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail`
--

INSERT INTO `detail` (`id`, `Jns_resep`, `nm_pasien`, `alm_pasien`, `Jns_klmn`, `no_hp`, `tgl_transaksi`) VALUES
(1, 'R', 'Viona', 'Riau', 'P', '081363187566', '2022-12-01'),
(2, 'S', 'Riko Rinaldi', 'Sentajo Raya', 'L', '085798765432', '2022-12-15'),
(3, 'S', 'Fajar Gumilang', 'Lubuk Jambi', 'L', '083856879099', '2022-12-19'),
(4, 'R', 'Siska', 'Rengat', 'P', '083876567896', '2022-12-02'),
(5, 'S', 'Jonat', 'Padang', 'L', '085274678900', '2022-12-12'),
(6, 'S', 'Shinta', 'Batam', 'P', '081234567890', '2022-12-13'),
(7, 'R', 'Rozi', 'Pekanbaru', 'L', '089876767654', '2022-12-20'),
(8, 'S', 'Alexa', 'Solok', 'P', '083876567896', '2022-12-01'),
(9, 'S', 'Singer', 'Padang', 'P', '081234567891', '2022-12-13'),
(10, 'R', 'Betran', 'Solok', 'L', '082277450111', '2022-12-05'),
(11, '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nm_dokter` enum('Reren','Sonya','Zhindira','-') NOT NULL,
  `alamat` enum('Solok','Padang','-') NOT NULL,
  `id_detail` int(11) NOT NULL,
  `Jenis` enum('resep','non resep') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nm_dokter`, `alamat`, `id_detail`, `Jenis`) VALUES
(1, 'Reren', 'Solok', 3, 'resep'),
(2, 'Zhindira', 'Padang', 2, 'resep'),
(3, 'Sonya', 'Solok', 1, 'resep'),
(4, 'Zhindira', 'Padang', 4, 'resep'),
(5, 'Sonya', 'Solok', 5, 'resep'),
(6, 'Reren', 'Solok', 10, 'resep'),
(7, 'Sonya', 'Solok', 7, 'resep'),
(8, 'Reren', 'Solok', 6, 'resep'),
(9, 'Zhindira', 'Padang', 8, 'resep'),
(10, 'Reren', 'Solok', 9, 'resep'),
(12, '', '', 11, 'non resep');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `Id` int(11) NOT NULL,
  `nm_obat` varchar(100) NOT NULL,
  `tgl_kadaluwarsa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`Id`, `nm_obat`, `tgl_kadaluwarsa`) VALUES
(1, 'Enelcete', '2023-01-20'),
(2, 'Nature', '2023-02-10'),
(3, 'Paracetamol', '2023-03-30'),
(4, 'ABC', '2023-04-20'),
(5, 'Amocilin', '2023-01-20'),
(6, 'Arginine', '2022-12-31'),
(7, 'Aminofilin', '2022-12-17'),
(8, 'Albumin', '2023-07-06'),
(9, 'Amikacin', '2023-04-21'),
(10, 'Acarbose', '2023-04-10'),
(11, '-', '2022-12-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL,
  `nm_pembeli` varchar(100) NOT NULL,
  `almt` varchar(100) NOT NULL,
  `no_hp` char(12) DEFAULT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id`, `nm_pembeli`, `almt`, `no_hp`, `id_obat`) VALUES
(1, 'Pipit Kurnia', 'Solo', '081256348966', 8),
(2, 'Deni Eka', 'Bandung', '082277450110', 7),
(3, 'Intan', 'Bandung', '081234567893', 4),
(4, 'Jeng', 'Padang', '082277450113', 2),
(5, 'Gilang', 'Solok', '081234567895', 1),
(6, 'Diego', 'Bukittinggi', '085274678955', 9),
(7, 'Mona', 'Padang Panjang', '081234567897', 3),
(8, 'Xavier', 'Pasaman', '085274678909', 10),
(9, 'Dodo', 'Batusangkar', '081234567898', 5),
(10, 'Vina', 'Payakumbuh', '085274678959', 6),
(11, '-', '-', '-', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) NOT NULL,
  `nm_petugas` enum('Refif','Rezan','Reisya','Tasya','Anita') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `id_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nm_petugas`, `alamat`, `id_transaksi`) VALUES
(1, 'Refif', 'Solok', 2),
(2, 'Rezan', 'Solok', 3),
(3, 'Reisya', 'Solok', 4),
(4, 'Tasya', 'Bukittinggi', 5),
(5, 'Anita', 'Dharmasraya', 6),
(6, 'Refif', 'Solok', 7),
(7, 'Rezan', 'Solok', 8),
(8, 'Reisya', 'Solok', 9),
(9, 'Tasya', 'Bukittinggi', 10),
(10, 'Anita', 'Dharmasraya', 11),
(11, 'Anita', 'Dharmasraya', 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `status` enum('tunai','transfer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pembeli`, `id_dokter`, `status`) VALUES
(2, 1, 12, 'tunai'),
(3, 3, 12, 'transfer'),
(4, 2, 12, 'tunai'),
(5, 4, 12, 'transfer'),
(6, 5, 12, 'transfer'),
(7, 7, 12, 'transfer'),
(8, 6, 12, 'tunai'),
(9, 9, 12, 'tunai'),
(10, 8, 12, 'tunai'),
(11, 10, 12, 'transfer'),
(12, 11, 1, 'tunai'),
(13, 11, 2, 'transfer'),
(14, 11, 3, 'tunai'),
(15, 11, 4, 'tunai'),
(16, 11, 5, 'transfer'),
(17, 11, 6, 'transfer'),
(18, 11, 7, 'tunai'),
(19, 11, 8, 'transfer'),
(20, 11, 9, 'transfer'),
(21, 11, 10, 'tunai');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail` (`id_detail`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_obat` (`id_obat`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembeli` (`id_pembeli`),
  ADD KEY `fk_dokter` (`id_dokter`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_detail` FOREIGN KEY (`id_detail`) REFERENCES `detail` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD CONSTRAINT `fk_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`Id`);

--
-- Ketidakleluasaan untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `fk_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`),
  ADD CONSTRAINT `fk_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
