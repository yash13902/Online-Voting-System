-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 01, 2022 at 12:31 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$g4m/PfziRBxoM9fvwqiS9OgxAV29w0y8..XHruyEplYPxYnhZJ6bC', 'Admin', '', 'avatar.png', '2018-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `constituency_id` int NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `constituency` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_2` (`constituency_id`,`constituency`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `constituency_id`, `firstname`, `lastname`, `photo`, `constituency`) VALUES
(1, 56, 'Vijai ', 'Sritharan', '', 'Ghaziabad'),
(2, 56, 'Aditi', 'Musunur', '', 'Ghaziabad'),
(3, 4, 'Advitiya ', 'Sujeet', '', 'Saharanpur'),
(4, 4, 'Naveen ', 'Tikaram', '', 'Saharanpur'),
(5, 65, 'Kalyanavata ', 'Veerender', '', 'Bulandshahr'),
(6, 65, 'Alagesan ', 'Poduri', '', 'Bulandshahr'),
(7, 4, 'Amrish ', 'Ilyas', '', 'Saharanpur'),
(8, 65, 'Jitendra ', 'Choudhary', '', 'Bulandshahr'),
(9, 84, 'Jayadev ', 'Mitali', '', 'Mathura'),
(10, 84, 'Aprativirya ', 'Seshan', '', 'Mathura'),
(11, 84, 'Asvathama ', 'Ponnada', '', 'Mathura'),
(12, 84, 'Hardeep ', 'Suksma', '', 'Mathura'),
(13, 56, 'Gopa ', 'Trilochana', '', 'Ghaziabad'),
(14, 56, 'Avantas ', 'Ghosal', '', 'Ghaziabad'),
(15, 65, 'Avidosa ', 'Vaisakhi', '', 'Bulandshahr'),
(16, 65, 'Barsati ', 'Sandipa', '', 'Bulandshahr'),
(17, 4, 'Dhritiman ', 'Salim', '', 'Saharanpur'),
(18, 56, 'Dharmadhrt ', 'Ramila', '', 'Ghaziabad'),
(19, 4, 'Debasis ', 'Sundhararajan', '', 'Saharanpur'),
(20, 84, 'Devasru ', 'Subramanyan', '', 'Mathura');

-- --------------------------------------------------------

--
-- Table structure for table `constituencies`
--

DROP TABLE IF EXISTS `constituencies`;
CREATE TABLE IF NOT EXISTS `constituencies` (
  `id` int NOT NULL,
  `description` varchar(50) NOT NULL,
  `max_vote` int NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`,`description`),
  KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `constituencies`
--

INSERT INTO `constituencies` (`id`, `description`, `max_vote`, `priority`) VALUES
(4, 'Saharanpur', 1, 4),
(56, 'Ghaziabad', 1, 1),
(65, 'Bulandshahr', 1, 2),
(84, 'Mathura', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
CREATE TABLE IF NOT EXISTS `voters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voters_id` varchar(15) NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `constituency` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_1` (`constituency`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `voters_id`, `password`, `firstname`, `lastname`, `photo`, `constituency`) VALUES
(56, 'gFc2ShnoLZfVA1d', '$2y$10$izmd4.OZmmpLN8Nu13zVVus4ap24SKm8W2PgjCVs1hIEfx1AnP9Ci', 'Amit ', 'Sarkar', '', 'Saharanpur'),
(57, 'uehMFGLj6t9RUlw', '$2y$10$fBExP8TrMhEozV17bK.3ku7m5Kgh8v7VmHa92kTvq7bPSuIAjFKii', 'Arati', 'Shukla', '', 'Saharanpur'),
(58, 'IVYmzZvWdguqn9w', '$2y$10$3Wxec/EdjGfIP3GthJTm2ulxmGJCQwcRaSYKaoYHFDpePwM/H3kP2', 'Virendra', 'Singh', '', 'Saharanpur'),
(59, 'aH5CekwWU7ti1Gv', '$2y$10$JGDASo/qdO3uzkdPzyRgROZSfj3K19xq0LKdWHjLC6.ahLDOPwgo.', 'Sandip', 'Chavhan', '', 'Saharanpur'),
(60, 'kYS5DVmJWQ8LgGq', '$2y$10$xRaicEvXHPa8RSlr6wrE5OKdYJuhz0hAdhKIfSgGcc1/anbRE/lom', 'Atharva ', 'Yawalkar', '', 'Ghaziabad'),
(61, 'wu6RZfQbKDYykmh', '$2y$10$aWeKeQnJvHN978canaqcAe8NLDLdfcuLrEP3a8tqObpU7gpvgGLqK', 'Anubhav', 'Chachra', '', 'Ghaziabad'),
(62, 'yoezGXD6CrIBMYl', '$2y$10$vlZWv5hvjGkBXiywoUidaenHKQR5kuZgiNe5IzZzYa55DKYC0Rw8u', 'Amol', 'Srivastava', '', 'Ghaziabad'),
(63, 'lxGCDOMv52qr91e', '$2y$10$sxQOayRlIw8bxCkJuGQ5UetVeDcw6ifTCm..2WWBn30owDj5eUMa6', 'Yogita', 'Chawla', '', 'Ghaziabad'),
(64, 'zVpS9H1LQD64mYT', '$2y$10$bBBwnJhDhTDx9s2RHJCCjeN7NbSWOtmT8hVrNdrizq885W6jVXnlG', 'Rajkumar', 'Dixit', '', 'Mathura'),
(65, 'uh2Lzcd9Ywj46ot', '$2y$10$h.XW4yWCDeMR3PRSmLKTlOMdncFXcO42P7cq1EDHIN8cPTNZsqQlK', 'Aamir', 'Hussain', '', 'Mathura'),
(66, 'dtRVmJQWofhSa7K', '$2y$10$UjufIS8NxpKpYtWCyvqmWuK.gr/4gcp5YTdXIdvQn67oXjNeplDse', 'Sujata', 'Kadam', '', 'Mathura'),
(67, 'ef4FCRdhiQT2ksW', '$2y$10$8hR7qd8/oeRiepO/w.UhyeZkIBHISXKGokalW35vdH8/myIxNCTc.', 'Vinit', 'Katariya', '', 'Mathura'),
(68, 'IrzkymHFE4jfut7', '$2y$10$u1n4u69MXdNhLDiqApeBrulMRGwGIjyAS9Gmi11PblmGCydBbqLDC', 'Kausal ', 'Kumar', '', 'Bulandshahr'),
(69, 'L2UxpdTwGSQ6etY', '$2y$10$NZt4sw190Z7DVNuLrvZnmez8Ii/nMK0lNY0bEv0iVsrW.XyWnhvJC', 'Dipika', 'Kumari', '', 'Bulandshahr'),
(70, 'tJ5ryCQ7jH8nEwc', '$2y$10$MmlXR/nCfPXZ/yg5QYZi6OrSomd2XQ3gcdA9PQtCicteACLhAK8jy', 'Kailash', 'Kumar', '', 'Bulandshahr'),
(71, 'TvkfRUZeDs2LdbX', '$2y$10$FVx9P2/w56uqC7G1cMKmTOSS7aaqxQKGOVdm.zJzZqxNB3NM9Xyd2', 'Shakti', 'Das', '', 'Bulandshahr'),
(72, 'ANWdvoXyV3gCZbY', '$2y$10$tNf9TxUnVLXtGHoFF6nZnu7LDs6zWVf4r1q0U7edlF.yI45LCrWS6', 'Mohan', 'Singh', '', 'Saharanpur'),
(73, 'yDCPMauXljRUr14', '$2y$10$HUOGDSRkqXWEiVDmhdE.n.Px8nH5KzkU5/NcpI68TYIGrVWWcB5cq', 'Parmeet', 'Kaur', '', 'Ghaziabad'),
(74, 'lPIaoJmgebOuDUn', '$2y$10$ZVl8ZgQW.hbVkfXnDKKyCelNP6soadRZa1EMhxP16lFfYioQmhVFa', 'Nikhil', 'Agrawal', '', 'Mathura'),
(75, 'WjNiXatZMy9p31Q', '$2y$10$mjm0yrFSlZ.aREbd75ApjeIOcCWerFC.aTryVnB.NId2s1pmik03O', 'Ashwin', 'Kumar', '', 'Bulandshahr'),
(77, 'F7Rwy98UXpNIcq1', '$2y$10$FGAGcC32tiOVqeBvp0g25OC5sJ4CMFIUxmxqVbBu0PO90HZsMT7NG', 'Pranav', 'Undre', '', 'Mathura');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voters_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  `constituency_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk` (`candidate_id`),
  KEY `fk2` (`voters_id`),
  KEY `fk3` (`constituency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`constituency_id`,`constituency`) REFERENCES `constituencies` (`id`, `description`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voters`
--
ALTER TABLE `voters`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`constituency`) REFERENCES `constituencies` (`description`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`voters_id`) REFERENCES `voters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`constituency_id`) REFERENCES `constituencies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
