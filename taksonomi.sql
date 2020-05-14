-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2020 at 07:23 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taksonomi`
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
(1, 'Ya'),
(2, 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `berkebang_biak`
--

CREATE TABLE `berkebang_biak` (
  `kembang_id` int(11) NOT NULL,
  `kembang_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berkebang_biak`
--

INSERT INTO `berkebang_biak` (`kembang_id`, `kembang_detail`) VALUES
(1, 'Ovipar'),
(2, 'Vivipar'),
(3, 'Ovovivipar'),
(4, 'Tunas'),
(5, 'Berbiji');

-- --------------------------------------------------------

--
-- Table structure for table `bernapas`
--

CREATE TABLE `bernapas` (
  `napas_id` int(11) NOT NULL,
  `napas_detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bernapas`
--

INSERT INTO `bernapas` (`napas_id`, `napas_detail`) VALUES
(1, 'Insang'),
(2, 'Paru-Paru'),
(3, 'Stomata');

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
(3, 'Both');

-- --------------------------------------------------------

--
-- Table structure for table `pendataan`
--

CREATE TABLE `pendataan` (
  `data_id` int(11) NOT NULL,
  `gerak_id` int(11) NOT NULL,
  `napas_id` int(11) NOT NULL,
  `kembang_id` int(11) NOT NULL,
  `hidup_id` int(11) NOT NULL,
  `hasil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendataan`
--

INSERT INTO `pendataan` (`data_id`, `gerak_id`, `napas_id`, `kembang_id`, `hidup_id`, `hasil_id`) VALUES
(1, 1, 2, 2, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bergerak`
--
ALTER TABLE `bergerak`
  ADD PRIMARY KEY (`gerak_id`);

--
-- Indexes for table `berkebang_biak`
--
ALTER TABLE `berkebang_biak`
  ADD PRIMARY KEY (`kembang_id`);

--
-- Indexes for table `bernapas`
--
ALTER TABLE `bernapas`
  ADD PRIMARY KEY (`napas_id`);

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
-- Indexes for table `pendataan`
--
ALTER TABLE `pendataan`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `fkBergerak` (`gerak_id`),
  ADD KEY `fkHasil` (`hasil_id`),
  ADD KEY `fkBernapas` (`napas_id`),
  ADD KEY `fkBerkembangBiak` (`kembang_id`),
  ADD KEY `fkHidup` (`hidup_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bergerak`
--
ALTER TABLE `bergerak`
  MODIFY `gerak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `berkebang_biak`
--
ALTER TABLE `berkebang_biak`
  MODIFY `kembang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `bernapas`
--
ALTER TABLE `bernapas`
  MODIFY `napas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `hasil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hidup`
--
ALTER TABLE `hidup`
  MODIFY `hidup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pendataan`
--
ALTER TABLE `pendataan`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pendataan`
--
ALTER TABLE `pendataan`
  ADD CONSTRAINT `fkBergerak` FOREIGN KEY (`gerak_id`) REFERENCES `bergerak` (`gerak_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkBerkembangBiak` FOREIGN KEY (`kembang_id`) REFERENCES `berkebang_biak` (`kembang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkBernapas` FOREIGN KEY (`napas_id`) REFERENCES `bernapas` (`napas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkHasil` FOREIGN KEY (`hasil_id`) REFERENCES `hasil` (`hasil_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkHidup` FOREIGN KEY (`hidup_id`) REFERENCES `hidup` (`hidup_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
