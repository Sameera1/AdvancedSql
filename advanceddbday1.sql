-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 10:18 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advanceddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `address`, `city`, `province`) VALUES
(1, 'jack', '20', 'galle', 'SP'),
(2, 'pete', '30', 'jaffna', 'NP'),
(3, 'mary', '50', 'matale', 'CP'),
(4, 'nick', '28', 'galle', 'SP'),
(5, 'lily', '35', 'jaffna', 'NP'),
(6, 'jock', '35', 'matale', 'CP');

-- --------------------------------------------------------

--
-- Stand-in structure for view `combined`
-- (See below for the actual view)
--
CREATE TABLE `combined` (
`id` int(11)
,`name` varchar(10)
,`phone` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `day1`
--

CREATE TABLE `day1` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `day1`
--

INSERT INTO `day1` (`id`, `name`, `DOB`) VALUES
(1, 'Mary', '1000'),
(2, 'Tom', '2000'),
(4, 'sid', '5000'),
(5, 'Pat', '3800');

-- --------------------------------------------------------

--
-- Table structure for table `day1table2`
--

CREATE TABLE `day1table2` (
  `id` int(11) NOT NULL,
  `school` varchar(10) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `day1table2`
--

INSERT INTO `day1table2` (`id`, `school`, `phone`) VALUES
(1, 'sncalvm', ''),
(2, '', '20'),
(3, '', '8'),
(4, '', '50'),
(5, '', '38');

-- --------------------------------------------------------

--
-- Stand-in structure for view `envelope`
-- (See below for the actual view)
--
CREATE TABLE `envelope` (
`company` varchar(20)
,`mailAddress` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `envelope1`
-- (See below for the actual view)
--
CREATE TABLE `envelope1` (
`company` varchar(20)
,`mailAddress` varchar(47)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ex1`
-- (See below for the actual view)
--
CREATE TABLE `ex1` (
`province` varchar(5)
,`sum` bigint(21)
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `modify`
-- (See below for the actual view)
--
CREATE TABLE `modify` (
`id` int(11)
,`name` varchar(10)
,`DOB` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`id` int(11)
,`name` varchar(10)
,`DOB` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
CREATE TABLE `view2` (
`id` int(11)
,`name` varchar(10)
,`DOB` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3`
-- (See below for the actual view)
--
CREATE TABLE `view3` (
`name` varchar(10)
,`DOB` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4`
-- (See below for the actual view)
--
CREATE TABLE `view4` (
`name` varchar(10)
,`age` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `combined`
--
DROP TABLE IF EXISTS `combined`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `combined`  AS  select `day1`.`id` AS `id`,`day1`.`name` AS `name`,`day1table2`.`phone` AS `phone` from (`day1` join `day1table2`) where (`day1`.`id` = `day1table2`.`id`) ;

-- --------------------------------------------------------

--
-- Structure for view `envelope`
--
DROP TABLE IF EXISTS `envelope`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `envelope`  AS  select `business`.`name` AS `company`,concat(`business`.`address`,'',`business`.`city`,'',`business`.`province`) AS `mailAddress` from `business` ;

-- --------------------------------------------------------

--
-- Structure for view `envelope1`
--
DROP TABLE IF EXISTS `envelope1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `envelope1`  AS  select `business`.`name` AS `company`,concat(`business`.`address`,' ',`business`.`city`,' ',`business`.`province`) AS `mailAddress` from `business` ;

-- --------------------------------------------------------

--
-- Structure for view `ex1`
--
DROP TABLE IF EXISTS `ex1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ex1`  AS  select distinct `business`.`province` AS `province`,count(`business`.`city`) AS `sum`,sum(`business`.`address`) AS `total` from `business` group by `business`.`province` ;

-- --------------------------------------------------------

--
-- Structure for view `modify`
--
DROP TABLE IF EXISTS `modify`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `modify`  AS  select `day1`.`id` AS `id`,`day1`.`name` AS `name`,`day1`.`DOB` AS `DOB` from `day1` ;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `day1`.`id` AS `id`,`day1`.`name` AS `name`,`day1`.`DOB` AS `DOB` from `day1` where (`day1`.`DOB` > 25) ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS  select `view1`.`id` AS `id`,`view1`.`name` AS `name`,`view1`.`DOB` AS `DOB` from `view1` where (`view1`.`id` = 4) ;

-- --------------------------------------------------------

--
-- Structure for view `view3`
--
DROP TABLE IF EXISTS `view3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3`  AS  select `view1`.`name` AS `name`,`view1`.`DOB` AS `DOB` from `view1` ;

-- --------------------------------------------------------

--
-- Structure for view `view4`
--
DROP TABLE IF EXISTS `view4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4`  AS  select `view1`.`name` AS `name`,`view1`.`DOB` AS `age` from `view1` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `day1`
--
ALTER TABLE `day1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `day1table2`
--
ALTER TABLE `day1table2`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
