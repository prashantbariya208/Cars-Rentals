-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 12:59 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounts`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `adminDisplayTransaction` (IN `variable` INT(11))  BEGIN
IF variable = 0 THEN
	SELECT * from transaction;
ELSE
	SELECT * from transaction WHERE DATEDIFF(CURRENT_TIMESTAMP , 			timestampTransaction) <= variable;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOffers` (IN `tag` VARCHAR(100))  DELETE FROM offers WHERE offername = tag$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `displayallUserTransactions` (IN `variable` INT(11))  BEGIN
SELECT * from transaction where userid = variable;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `displayAvailableCars` (IN `ch` VARCHAR(1))  BEGIN
SELECT * from cars where availability = ch;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `displayTransactionsAccToDay` (IN `useridd` INT(11))  BEGIN
SELECT * from transaction where userid = useridd and DATEDIFF(CURRENT_TIMESTAMP , timestampTransaction) <= 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `displayTransactionsAccToMonth` (IN `useridd` INT(11))  BEGIN
SELECT * from transaction where userid = useridd and DATEDIFF(CURRENT_TIMESTAMP , timestampTransaction) <= 30;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `displayTransactionsAccToWeek` (IN `useridd` INT(11))  BEGIN
SELECT * from transaction where userid = useridd and DATEDIFF(CURRENT_TIMESTAMP , timestampTransaction) <= 7;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectCar` (IN `num` INT(11))  BEGIN
SELECT * from cars where carid = num;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `checkuser` (`user_name` VARCHAR(100), `email_id` VARCHAR(100)) RETURNS INT(11) BEGIN
DECLARE ans INT;
SELECT Count(*) INTO ans from users where username = user_name or email = email_id;
RETURN ans;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getCaridFromT` (`id` INT(11), `ch` VARCHAR(1)) RETURNS INT(11) BEGIN
DECLARE ANSWER INT;
SELECT carid INTO ANSWER from alltrips where userid = id and completed = ch;
RETURN ANSWER;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getDistFromT` (`id` INT(11), `ch` VARCHAR(1)) RETURNS INT(11) BEGIN
DECLARE ANSWER INT;
SELECT tripdist INTO ANSWER from alltrips where userid = id and completed = ch;
RETURN ANSWER;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getTripidFromT` (`useridd` INT(11), `ch` VARCHAR(1) CHARSET utf8mb4) RETURNS BIGINT(20) BEGIN
DECLARE ANSWER INT;
SELECT tripid INTO ANSWER from alltrips where userid = useridd and completed = ch;
RETURN ANSWER;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getUserid` (`name` VARCHAR(100)) RETURNS INT(11) BEGIN
DECLARE ANSWER INT;
SELECT id INTO ANSWER FROM users WHERE username = name;
RETURN ANSWER;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `alltrips`
--

CREATE TABLE `alltrips` (
  `tripid` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `carid` bigint(20) NOT NULL,
  `completed` varchar(1) NOT NULL,
  `timestampbook` timestamp NOT NULL DEFAULT current_timestamp(),
  `timestampreturn` timestamp NULL DEFAULT NULL,
  `tripdist` bigint(11) DEFAULT 0,
  `triprating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alltrips`
--

INSERT INTO `alltrips` (`tripid`, `userid`, `carid`, `completed`, `timestampbook`, `timestampreturn`, `tripdist`, `triprating`) VALUES
(66, 34, 8, 'R', '2021-04-24 05:59:04', NULL, 200, 4.5),
(67, 34, 8, 'R', '2021-04-24 06:06:12', NULL, 50, 4.6),
(68, 33, 9, 'R', '2021-04-24 06:06:28', NULL, 100, 4.8),
(69, 34, 10, 'R', '2021-04-24 15:18:18', '2021-04-24 15:18:33', 100, 4.7),
(70, 34, 8, 'R', '2021-04-24 17:01:36', '2021-04-24 17:06:08', 100, 4.5),
(71, 34, 9, 'R', '2021-04-24 17:18:35', '2021-04-24 17:18:47', 100, 3.4),
(72, 34, 9, 'R', '2021-04-24 17:29:08', '2021-04-24 17:29:18', 100, 5),
(73, 34, 9, 'R', '2021-04-24 17:30:18', '2021-04-24 17:30:25', 100, 5),
(74, 34, 8, 'R', '2021-04-24 20:04:01', '2021-04-24 20:04:11', 190, 3.5),
(75, 34, 11, 'R', '2021-04-25 09:42:51', '2021-04-25 09:43:43', 20, 4.5),
(76, 34, 11, 'R', '2021-04-25 09:49:04', '2021-04-25 09:49:15', 30, 4.9),
(77, 34, 11, 'R', '2021-04-25 09:49:43', '2021-04-25 09:49:55', 20, 3.6),
(79, 33, 8, 'R', '2021-04-25 10:04:52', '2021-04-25 10:05:03', 100, 4.2),
(80, 33, 9, 'R', '2021-04-25 10:05:09', '2021-04-25 10:05:40', 100, 4.6),
(81, 33, 9, 'R', '2021-04-25 10:07:12', '2021-04-25 10:10:29', 100, 4.8),
(82, 34, 8, 'R', '2021-04-25 10:07:40', '2021-04-25 10:10:04', 100, 4.7),
(83, 35, 12, 'R', '2021-04-25 10:07:57', '2021-04-25 10:09:36', 250, 4.6);

--
-- Triggers `alltrips`
--
DELIMITER $$
CREATE TRIGGER `updaterating` AFTER UPDATE ON `alltrips` FOR EACH ROW BEGIN
DECLARE average FLOAT;
SELECT AVG(triprating) INTO average FROM alltrips WHERE carid = new.carid;
UPDATE cars SET carrating = average WHERE carid = new.carid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `carid` bigint(20) NOT NULL,
  `carname` varchar(100) NOT NULL,
  `availability` varchar(1) NOT NULL,
  `carpic` varchar(100) NOT NULL,
  `carnum` varchar(100) NOT NULL,
  `cardist` bigint(20) NOT NULL DEFAULT 0,
  `carrating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`carid`, `carname`, `availability`, `carpic`, `carnum`, `cardist`, `carrating`) VALUES
(8, 'Mustang', 'A', 'cars/Mustang.jpg', 'MH 02 1234', 1000, 4.33333),
(9, 'Ferrari-LaFerrari', 'A', 'cars/Ferrari-LaFerrari.jpg', 'MH 02 2345', 700, 4.6),
(10, 'BMW', 'A', 'cars/BMW.jpg', 'MH 07 3456', 400, 4.7),
(11, 'Bently', 'A', 'cars/Bently.jpg', 'MH 03 8989', 120, 4.33333),
(12, 'sk', 'A', 'cars/Corvette.jfif', 'MH 0245', 250, 4.6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `carstripsview`
-- (See below for the actual view)
--
CREATE TABLE `carstripsview` (
`tripid` bigint(20)
,`userid` int(11)
,`carname` varchar(100)
,`carnum` varchar(100)
,`carrating` float
,`start` timestamp
,`end` timestamp
,`tripdist` bigint(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offerid` int(11) NOT NULL,
  `offername` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offerid`, `offername`, `userid`, `discount`) VALUES
(59, 'Flat 500 off', 27, 500),
(61, 'Flat 500 off', 34, 500),
(63, 'Flat 500 off', 41, 500);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tid` int(11) NOT NULL,
  `tripid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `costoftrip` int(11) NOT NULL,
  `timestampTransaction` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tid`, `tripid`, `userid`, `costoftrip`, `timestampTransaction`) VALUES
(50, 66, 34, 800, '2021-04-14 06:00:52'),
(51, 68, 33, 300, '2021-04-24 06:07:13'),
(52, 67, 34, 250, '2021-04-22 06:09:50'),
(53, 69, 34, 400, '2021-04-24 15:18:33'),
(54, 70, 34, 300, '2021-04-24 17:06:08'),
(55, 71, 34, 400, '2021-04-24 17:18:47'),
(56, 72, 34, 400, '2021-04-24 17:29:18'),
(57, 73, 34, 400, '2021-04-24 17:30:25'),
(58, 74, 34, 760, '2021-04-24 20:04:11'),
(59, 75, 34, 100, '2021-04-25 09:43:43'),
(60, 76, 34, 150, '2021-04-25 09:49:15'),
(61, 77, 34, 100, '2021-04-25 09:49:55'),
(62, 79, 33, 400, '2021-04-25 10:05:03'),
(63, 80, 33, 0, '2021-04-25 10:05:40'),
(64, 83, 35, 500, '2021-04-25 10:09:36'),
(65, 82, 34, 400, '2021-04-25 10:10:04'),
(66, 81, 33, 400, '2021-04-25 10:10:29');

--
-- Triggers `transaction`
--
DELIMITER $$
CREATE TRIGGER `updatereturntrip` AFTER INSERT ON `transaction` FOR EACH ROW UPDATE alltrips SET completed = 'R' , timestampreturn = new.timestampTransaction WHERE tripid = new.tripid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tripstransactionview`
-- (See below for the actual view)
--
CREATE TABLE `tripstransactionview` (
`transactionID` int(11)
,`tripid` bigint(20)
,`userid` int(11)
,`start` timestamp
,`end` timestamp
,`tripdist` bigint(11)
,`costOfTrip` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `wallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `wallet`) VALUES
(27, 'admin', 'admin@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'images/admin-settings-male.png', 1000),
(33, 'prashant', 'prashant@gmail.com', '1c5edc4bbb547c49570f4dce082f8333', 'images/naruto.png', 40),
(34, 'sumeet', 'sumeet@gmail.com', '1c5edc4bbb547c49570f4dce082f8333', 'images/lelouch.jfif', 2040),
(35, 'saurabh', 'saurabh@gmail.com', '1c5edc4bbb547c49570f4dce082f8333', 'images/gojoxd.png', 500),
(41, 'Shubham', 'sulli@gamil.com', '1c5edc4bbb547c49570f4dce082f8333', 'images/WhatsApp Image 2021-01-06 at 9.35.50 PM.jpeg', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `usersoffersview`
-- (See below for the actual view)
--
CREATE TABLE `usersoffersview` (
`userid` int(11)
,`username` varchar(100)
,`email` varchar(100)
,`wallet` int(11)
,`offerid` int(11)
,`offername` varchar(100)
,`discount` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `usertransactionview`
-- (See below for the actual view)
--
CREATE TABLE `usertransactionview` (
`tripid` int(11)
,`customer` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `carstripsview`
--
DROP TABLE IF EXISTS `carstripsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carstripsview`  AS SELECT `b`.`tripid` AS `tripid`, `b`.`userid` AS `userid`, `a`.`carname` AS `carname`, `a`.`carnum` AS `carnum`, `a`.`carrating` AS `carrating`, `b`.`timestampbook` AS `start`, `b`.`timestampreturn` AS `end`, `b`.`tripdist` AS `tripdist` FROM (`cars` `a` join `alltrips` `b`) WHERE `a`.`carid` = `b`.`carid` ;

-- --------------------------------------------------------

--
-- Structure for view `tripstransactionview`
--
DROP TABLE IF EXISTS `tripstransactionview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tripstransactionview`  AS SELECT `a`.`tid` AS `transactionID`, `b`.`tripid` AS `tripid`, `b`.`userid` AS `userid`, `b`.`timestampbook` AS `start`, `b`.`timestampreturn` AS `end`, `b`.`tripdist` AS `tripdist`, `a`.`costoftrip` AS `costOfTrip` FROM (`transaction` `a` join `alltrips` `b`) WHERE `a`.`tripid` = `b`.`tripid` ;

-- --------------------------------------------------------

--
-- Structure for view `usersoffersview`
--
DROP TABLE IF EXISTS `usersoffersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersoffersview`  AS SELECT `b`.`id` AS `userid`, `b`.`username` AS `username`, `b`.`email` AS `email`, `b`.`wallet` AS `wallet`, `a`.`offerid` AS `offerid`, `a`.`offername` AS `offername`, `a`.`discount` AS `discount` FROM (`offers` `a` join `users` `b`) WHERE `a`.`userid` = `b`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `usertransactionview`
--
DROP TABLE IF EXISTS `usertransactionview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usertransactionview`  AS SELECT `a`.`tripid` AS `tripid`, `b`.`username` AS `customer` FROM (`transaction` `a` join `users` `b`) WHERE `a`.`userid` = `b`.`id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alltrips`
--
ALTER TABLE `alltrips`
  ADD PRIMARY KEY (`tripid`),
  ADD KEY `carid` (`carid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`carid`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offerid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alltrips`
--
ALTER TABLE `alltrips`
  MODIFY `tripid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `carid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `offerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alltrips`
--
ALTER TABLE `alltrips`
  ADD CONSTRAINT `alltrips_ibfk_1` FOREIGN KEY (`carid`) REFERENCES `cars` (`carid`),
  ADD CONSTRAINT `alltrips_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
