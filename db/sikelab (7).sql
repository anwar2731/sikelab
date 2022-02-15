-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 07:38 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikelab`
--

-- --------------------------------------------------------

--
-- Table structure for table `ail`
--

CREATE TABLE `ail` (
  `id_ail` int(11) NOT NULL,
  `nama_ail` varchar(50) NOT NULL,
  `id_akun` int(11) NOT NULL,
  `no_hp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ail`
--

INSERT INTO `ail` (`id_ail`, `nama_ail`, `id_akun`, `no_hp`) VALUES
(6, 'anwar', 13, '123456789012'),
(7, 'ardi', 14, '085674564646'),
(8, 'dimas', 18, '23423454342'),
(9, 'delau', 19, '0829876155441'),
(10, 'risma', 20, '086754314455'),
(11, 'ail', 21, '12467557865');

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `role` enum('ail','kalab','kajur','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `nama`, `email`, `password`, `no_hp`, `role`) VALUES
(13, 'anwar', 'anwar@pcr.ac.id', '123', '1273387', 'ail'),
(14, 'ardi', 'ardi', '123', '982789', 'ail'),
(16, 'INDRA', 'indra@pcr.ac.id', '123', '7657', 'kajur'),
(17, 'budi', 'budi@pcr.ac.id', '123', '08564177889', 'kalab'),
(18, 'dimas', 'dimas@pcr.ac.id', '123', '0856745643242', 'ail'),
(19, 'delau', 'delau@pcr.ac.id', '123', '12467557865', 'ail'),
(20, 'risma', 'risma@pcr.ac.id', '123', '1228883712', 'ail'),
(21, 'ail', 'ail@pcr.ac.id', '123', '4678754545', 'ail'),
(22, 'kalab', 'kalab@pcr.ac.id', '123', '087965433455', 'kalab'),
(23, 'kajur', 'kajur@pcr.ac.id', '123', '089765433455', 'kajur');

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

CREATE TABLE `anggaran` (
  `id_anggaran` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `nama_anggaran` varchar(30) NOT NULL,
  `jumlah_anggaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggaran`
--

INSERT INTO `anggaran` (`id_anggaran`, `id_periode`, `nama_anggaran`, `jumlah_anggaran`) VALUES
(4, 1, 'bulan januari', 100000),
(5, 2, 'bulan februari', 6899999);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id_lab` int(11) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `ruangan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`id_lab`, `id_ail`, `ruangan`) VALUES
(5, 6, '281'),
(6, 7, '317');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `id_pengajuan` int(11) NOT NULL,
  `id_anggaran` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `bukti_pembelian` varchar(50) NOT NULL,
  `tanggal_pembelian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_ail`, `id_pengajuan`, `id_anggaran`, `status`, `bukti_pembelian`, `tanggal_pembelian`) VALUES
(13, 7, 18, 5, 'Ditolak', 'nota6.jfif', '2022-02-11'),
(14, 6, 21, 5, 'dibeli', 'nota4.png', '2022-02-16'),
(15, 6, 20, 4, 'Diproses', 'anggaran.png', '2022-02-01'),
(16, 6, 19, 4, 'dibeli', 'mm.png', '2022-02-16'),
(17, 6, 18, 5, 'dibeli', '33.png', '2022-02-02'),
(18, 6, 23, 5, 'Dibeli', 'nota9.jfif', '2022-02-17'),
(19, 6, 24, 5, 'Dibeli', 'ff.png', '2022-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_ail` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Diproses',
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `total_harga` int(100) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `id_lab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`id_pengajuan`, `id_ail`, `status`, `nama_barang`, `harga`, `jumlah`, `total_harga`, `tanggal_pengajuan`, `id_lab`) VALUES
(18, 7, 'Diterima', 'TV Ku', 1000000, 1, 1000000, '2022-02-08', 6),
(19, 7, 'Ditolak', 'Router2jhjhj', 1000000, 33, 100033000, '2022-02-08', 6),
(20, 8, 'Diterima', 'meja', 200000, 2, 400000, '2022-02-08', 6),
(21, 6, 'Diterima', 'CPU', 1200000, 1, 1200000, '2022-02-08', 6),
(23, 6, 'Ditolak', 'Monitor', 1000000, 1, 1000000, '2022-02-08', 6),
(24, 6, 'Diproses', 'meja', 180000, 1, 180000, '2022-02-10', 6);

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE `periode` (
  `id_periode` int(11) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`id_periode`, `tahun`) VALUES
(1, 2022),
(2, 2023);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ail`
--
ALTER TABLE `ail`
  ADD PRIMARY KEY (`id_ail`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `no_hp` (`no_hp`);

--
-- Indexes for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD PRIMARY KEY (`id_anggaran`),
  ADD KEY `fk_periode_anggaran` (`id_periode`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id_lab`),
  ADD KEY `idx_ail__` (`id_ail`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `idx_ail_` (`id_ail`),
  ADD KEY `idx_pengajuan` (`id_pengajuan`),
  ADD KEY `idx_anggaran` (`id_anggaran`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `id_lab` (`id_lab`),
  ADD KEY `id_ail` (`id_ail`);

--
-- Indexes for table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`id_periode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ail`
--
ALTER TABLE `ail`
  MODIFY `id_ail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `anggaran`
--
ALTER TABLE `anggaran`
  MODIFY `id_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id_lab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `periode`
--
ALTER TABLE `periode`
  MODIFY `id_periode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ail`
--
ALTER TABLE `ail`
  ADD CONSTRAINT `id_akun` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`);

--
-- Constraints for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD CONSTRAINT `fk_periode_anggaran` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON UPDATE NO ACTION;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pengajuan`) REFERENCES `pengajuan` (`id_pengajuan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`id_anggaran`) REFERENCES `anggaran` (`id_anggaran`);

--
-- Constraints for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD CONSTRAINT `id_ail` FOREIGN KEY (`id_ail`) REFERENCES `ail` (`id_ail`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_lab` FOREIGN KEY (`id_lab`) REFERENCES `lab` (`id_lab`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
