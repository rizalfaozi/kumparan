-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2019 at 11:10 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kumparan`
--

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author` text NOT NULL,
  `body` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `author`, `body`, `created`) VALUES
(1, 'Adit', 'result 1', '2019-04-18 07:58:37'),
(2, 'panji', 'result 2', '2019-04-18 07:58:44'),
(3, 'gola', 'result 3', '2019-04-18 07:58:49'),
(4, 'habil', 'result 4', '2019-04-18 07:58:53'),
(5, 'una', 'result 5', '2019-04-18 07:59:06'),
(6, 'aren', 'result 6', '2019-04-18 07:59:40'),
(7, 'tin tin', 'result 7', '2019-04-18 07:59:44'),
(8, 'reza', 'result 8', '2019-04-18 07:59:47'),
(9, 'alkan', 'result 9', '2019-04-18 07:59:51'),
(10, 'rendi', 'result 10', '2019-04-18 07:59:56'),
(11, 'ema', 'result 11', '2019-04-18 08:00:00'),
(12, 'ega', 'result 12', '2019-04-18 08:00:03'),
(13, 'ela', 'result 13', '2019-04-18 08:00:07'),
(16, 'nuni', 'request ifat', '2019-04-18 08:43:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
