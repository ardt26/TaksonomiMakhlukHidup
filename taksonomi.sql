-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2020 at 11:53 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knn`
--

-- --------------------------------------------------------

--
-- Table structure for table `bergerak`
--

CREATE TABLE `bergerak` (
  `gerak_id` int(11) NOT NULL,
  `gerak_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bergerak`
--

INSERT INTO `bergerak` (`gerak_id`, `gerak_detail`) VALUES
(1, 'Flagella'),
(2, 'Tidak'),
(3, 'silia'),
(4, 'taksis');

-- --------------------------------------------------------

--
-- Table structure for table `cara_penuh_nutrisi`
--

CREATE TABLE `cara_penuh_nutrisi` (
  `id_nutrisi` int(11) NOT NULL,
  `detail_nutrisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cara_penuh_nutrisi`
--

INSERT INTO `cara_penuh_nutrisi` (`id_nutrisi`, `detail_nutrisi`) VALUES
(1, 'autotrof'),
(2, 'heterotrof'),
(3, 'mixotrof');

-- --------------------------------------------------------

--
-- Table structure for table `dinding_sel`
--

CREATE TABLE `dinding_sel` (
  `id_dinding_sel` int(11) NOT NULL,
  `detail_dinding_sel` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `hasil_id` int(11) NOT NULL,
  `hasil_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`hasil_id`, `hasil_detail`) VALUES
(1, 'Manusia'),
(2, 'Hewan'),
(3, 'Tumbuhan'),
(4, 'Jamur'),
(5, 'Bakteri'),
(6, 'Protista');

-- --------------------------------------------------------

--
-- Table structure for table `hidup`
--

CREATE TABLE `hidup` (
  `hidup_id` int(11) NOT NULL,
  `hidup_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hidup`
--

INSERT INTO `hidup` (`hidup_id`, `hidup_detail`) VALUES
(1, 'Darat'),
(2, 'Air'),
(3, 'Both'),
(4, 'extreme environment');

-- --------------------------------------------------------

--
-- Table structure for table `inti_sel`
--

CREATE TABLE `inti_sel` (
  `id_inti_sel` int(11) NOT NULL,
  `detail_inti_sel` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inti_sel`
--

INSERT INTO `inti_sel` (`id_inti_sel`, `detail_inti_sel`) VALUES
(1, 'ada (eukariot)'),
(2, 'tidak ada (prokariot)');

-- --------------------------------------------------------

--
-- Table structure for table `mikroskopis`
--

CREATE TABLE `mikroskopis` (
  `id_mikroskopis` int(11) NOT NULL,
  `detail_mikroskopis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mikroskopis`
--

INSERT INTO `mikroskopis` (`id_mikroskopis`, `detail_mikroskopis`) VALUES
(1, 'iya'),
(2, 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pendataan`
--

CREATE TABLE `pendataan` (
  `data_id` int(11) NOT NULL,
  `nama spesies` varchar(100) NOT NULL,
  `gerak_id` int(11) NOT NULL,
  `napas_id` int(11) NOT NULL,
  `kembang_id` int(11) NOT NULL,
  `hidup_id` int(11) NOT NULL,
  `hasil_id` int(11) NOT NULL,
  `nutri_id` int(11) NOT NULL,
  `dinding_sel_id` int(11) NOT NULL,
  `inti_sel_id` int(11) NOT NULL,
  `mikroskopis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reproduksi`
--

CREATE TABLE `reproduksi` (
  `kembang_id` int(11) NOT NULL,
  `kembang_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reproduksi`
--

INSERT INTO `reproduksi` (`kembang_id`, `kembang_detail`) VALUES
(1, 'Ovipar'),
(2, 'Vivipar'),
(3, 'Ovovivipar'),
(4, 'Tunas'),
(5, 'Berbiji'),
(6, 'pembelahan biner'),
(7, 'spora');

-- --------------------------------------------------------

--
-- Table structure for table `respirasi`
--

CREATE TABLE `respirasi` (
  `napas_id` int(11) NOT NULL,
  `napas_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respirasi`
--

INSERT INTO `respirasi` (`napas_id`, `napas_detail`) VALUES
(1, 'Insang'),
(2, 'Paru-Paru'),
(3, 'Stomata'),
(4, 'difusi sel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bergerak`
--
ALTER TABLE `bergerak`
  ADD PRIMARY KEY (`gerak_id`);

--
-- Indexes for table `cara_penuh_nutrisi`
--
ALTER TABLE `cara_penuh_nutrisi`
  ADD PRIMARY KEY (`id_nutrisi`);

--
-- Indexes for table `dinding_sel`
--
ALTER TABLE `dinding_sel`
  ADD PRIMARY KEY (`id_dinding_sel`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`hasil_id`);

--
-- Indexes for table `hidup`
--
ALTER TABLE `hidup`
  ADD PRIMARY KEY (`hidup_id`);

--
-- Indexes for table `inti_sel`
--
ALTER TABLE `inti_sel`
  ADD PRIMARY KEY (`id_inti_sel`);

--
-- Indexes for table `mikroskopis`
--
ALTER TABLE `mikroskopis`
  ADD PRIMARY KEY (`id_mikroskopis`);

--
-- Indexes for table `pendataan`
--
ALTER TABLE `pendataan`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `fkBergerak` (`gerak_id`),
  ADD KEY `fkHasil` (`hasil_id`),
  ADD KEY `fkBernapas` (`napas_id`),
  ADD KEY `fkBerkembangBiak` (`kembang_id`),
  ADD KEY `fkHidup` (`hidup_id`),
  ADD KEY `fk_nutrisi` (`nutri_id`),
  ADD KEY `fk_dinding_sel` (`dinding_sel_id`),
  ADD KEY `fk_inti_sel` (`inti_sel_id`),
  ADD KEY `fk_mikroskop` (`mikroskopis_id`);

--
-- Indexes for table `reproduksi`
--
ALTER TABLE `reproduksi`
  ADD PRIMARY KEY (`kembang_id`);

--
-- Indexes for table `respirasi`
--
ALTER TABLE `respirasi`
  ADD PRIMARY KEY (`napas_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bergerak`
--
ALTER TABLE `bergerak`
  MODIFY `gerak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cara_penuh_nutrisi`
--
ALTER TABLE `cara_penuh_nutrisi`
  MODIFY `id_nutrisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dinding_sel`
--
ALTER TABLE `dinding_sel`
  MODIFY `id_dinding_sel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `hasil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hidup`
--
ALTER TABLE `hidup`
  MODIFY `hidup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inti_sel`
--
ALTER TABLE `inti_sel`
  MODIFY `id_inti_sel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mikroskopis`
--
ALTER TABLE `mikroskopis`
  MODIFY `id_mikroskopis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pendataan`
--
ALTER TABLE `pendataan`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reproduksi`
--
ALTER TABLE `reproduksi`
  MODIFY `kembang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `respirasi`
--
ALTER TABLE `respirasi`
  MODIFY `napas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pendataan`
--
ALTER TABLE `pendataan`
  ADD CONSTRAINT `fkBergerak` FOREIGN KEY (`gerak_id`) REFERENCES `bergerak` (`gerak_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkBerkembangBiak` FOREIGN KEY (`kembang_id`) REFERENCES `reproduksi` (`kembang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkBernapas` FOREIGN KEY (`napas_id`) REFERENCES `respirasi` (`napas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkHasil` FOREIGN KEY (`hasil_id`) REFERENCES `hasil` (`hasil_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkHidup` FOREIGN KEY (`hidup_id`) REFERENCES `hidup` (`hidup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dinding_sel` FOREIGN KEY (`dinding_sel_id`) REFERENCES `dinding_sel` (`id_dinding_sel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inti_sel` FOREIGN KEY (`inti_sel_id`) REFERENCES `inti_sel` (`id_inti_sel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mikroskop` FOREIGN KEY (`mikroskopis_id`) REFERENCES `mikroskopis` (`id_mikroskopis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nutrisi` FOREIGN KEY (`nutri_id`) REFERENCES `cara_penuh_nutrisi` (`id_nutrisi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
