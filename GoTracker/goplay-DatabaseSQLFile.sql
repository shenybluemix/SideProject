-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 25, 2016 at 12:02 PM
-- Server version: 5.1.73
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `go_play`
--

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `description` text NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `created_at` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `category`, `user_id`, `start_date`, `description`, `number_of_days`, `created_at`) VALUES
(2, 'JOB', 1, '2016-07-08', 'the fact I have a great ', 0, '2016-07-08'),
(9, 'LEARN', 1, '2016-07-08', 'k', 0, '2016-07-08'),
(10, 'FINANCE', 1, '2016-07-08', 'greatest hits', 0, '2016-07-08'),
(11, 'DIET', 1, '2016-07-08', 'kill', 0, '2016-07-08'),
(12, 'LEARN', 2, '2016-07-08', 'spanish', 0, '2016-07-08'),
(13, 'LEARN', 2, '2016-07-08', 'XYZ', 0, '2016-07-08'),
(14, 'LEARN', 1, '2016-07-10', 'Learn Swimming', 0, '2016-07-10'),
(15, 'JOB', 1, '2015-09-09', 'Ghddhhdb', 33, '2016-07-12 06:46:50'),
(16, 'fd', 1, '2016-12-24', 'dfsfdgd', 1, '2016-07-12 07:12:24'),
(17, 'JOB', 1, '2015-09-09', 'Hdhdhdb', 7, '2016-07-13 08:46:45'),
(62, 'LEARN', 1, '2016-07-22', 'Spanish', 1, '2016-07-22 09:30:34'),
(19, 'JOB', 1, '2016-09-09', 'wjdqewfnlvnrf', 6, '2016-07-13 10:13:23'),
(20, 'JOB', 1, '2016-09-09', 'wjdqewfnlvnrf', 6, '2016-07-13 10:16:27'),
(21, 'JOB', 1, '2016-09-09', 'wjdqewfnlvnrf', 6, '2016-07-13 10:16:35'),
(22, 'LEARN', 22, '2016-07-15', 'red', 2, '2016-07-15 15:19:01'),
(23, 'LEARN', 22, '2016-07-15', '4', 4, '2016-07-15 15:21:04'),
(24, 'LEARN', 22, '2016-07-15', 't', 1, '2016-07-15 15:36:21'),
(25, 'LEARN', 22, '2016-07-15', '4', 4, '2016-07-15 15:41:30'),
(26, 'LEARN', 22, '2016-07-15', 'f', 2, '2016-07-15 15:45:50'),
(27, 'LEARN', 22, '2016-07-15', 'e32ew', 1, '2016-07-15 15:49:35'),
(28, 'LEARN', 22, '2016-07-15', 'r', 2, '2016-07-15 15:50:45'),
(29, 'LEARN', 22, '2016-07-15', 'r', 2, '2016-07-15 15:52:29'),
(30, 'LEARN', 22, '2016-07-15', 'l', 3, '2016-07-15 15:58:18'),
(31, 'LEARN', 1, '2016-07-16', '1', 1, '2016-07-16 12:32:21'),
(32, 'FINANCE', 1, '2016-07-16', 'AFR', 1, '2016-07-16 12:33:06'),
(33, 'EXERCISE', 1, '2016-07-18', 'Run 2 km Daily', 2, '2016-07-16 12:33:45'),
(34, 'DIET', 1, '2016-07-18', 'Eat Apple tomorrow', 1, '2016-07-16 12:35:38'),
(35, 'FINANCE', 1, '2016-07-16', 'Saving', 1, '2016-07-16 12:37:02'),
(36, 'LEARN', 1, '2016-07-16', 'football', 1, '2016-07-16 12:42:50'),
(37, 'LEARN', 1, '2016-07-18', 'r', 2, '2016-07-18 07:48:59'),
(38, 'LEARN', 1, '2016-07-18', 'L', 2, '2016-07-18 07:58:07'),
(39, 'LEARN', 1, '2016-07-18', 'l', 3, '2016-07-18 07:59:46'),
(40, 'LEARN', 1, '2016-07-18', 'P', 2, '2016-07-18 08:01:18'),
(41, 'EXERCISE', 1, '2016-07-18', 'Lloyd', 2, '2016-07-18 08:04:26'),
(42, 'LEARN', 1, '2016-07-18', 't', 1, '2016-07-18 09:31:05'),
(43, 'EXERCISE', 1, '2016-07-18', 'g', 4, '2016-07-18 09:43:34'),
(44, 'LEARN', 1, '2016-07-18', 'r', 2, '2016-07-18 09:59:45'),
(45, 'EXERCISE', 1, '2016-07-18', 'f', 4, '2016-07-18 09:59:50'),
(46, 'JOB', 1, '2016-07-18', 'g', 4, '2016-07-18 09:59:56'),
(47, 'MEDITATION', 1, '2016-07-18', 'h', 1, '2016-07-18 10:00:31'),
(48, 'MEDITATION', 1, '2016-07-18', 'h', 7, '2016-07-18 10:00:36'),
(49, 'LEARN', 1, '2016-07-18', 'Football', 1, '2016-07-18 10:49:18'),
(50, 'LEARN', 1, '2016-07-18', 'Football', 1, '2016-07-18 10:50:41'),
(51, 'EXERCISE', 1, '2016-07-18', 'Daily 50 push ups', 1, '2016-07-18 13:04:23'),
(52, 'EXERCISE', 1, '2016-07-18', 'Daily 50 Sit-ups', 1, '2016-07-18 13:04:24'),
(53, 'LEARN', 1, '2016-07-18', 'Study SWIFT development', 1, '2016-07-18 22:28:56'),
(54, 'EXERCISE', 1, '2016-07-18', 'Push-Up', 1, '2016-07-18 22:29:07'),
(55, 'JOB', 1, '2016-07-18', 'apply for Google', 1, '2016-07-18 23:04:01'),
(56, 'EXERCISE', 1, '2016-07-20', 'Kolkata', 2, '2016-07-20 10:08:50'),
(57, 'EXERCISE', 1, '2016-07-20', 'g', 2, '2016-07-20 10:10:26'),
(58, 'JOB', 1, '2016-07-20', 'Job', 2, '2016-07-20 10:43:07'),
(59, 'LEARN', 1, '2016-07-20', 'Learn Spanish', 1, '2016-07-20 13:50:48'),
(60, 'EXERCISE', 1, '2016-07-20', 'abc', 1, '2016-07-20 13:56:53'),
(61, 'MEDITATION', 1, '2016-07-20', 'Daily Yoga', 1, '2016-07-20 14:06:53'),
(63, 'LEARN', 1, '2016-07-22', 'Spanish', 1, '2016-07-22 09:39:22'),
(64, 'EXERCISE', 1, '2016-07-22', 'Daily Push-ups', 2, '2016-07-22 09:39:37'),
(65, 'FINANCE', 1, '2016-07-22', 'Savings', 1, '2016-07-22 09:39:45'),
(66, 'DIET', 1, '2016-07-22', 'Eat Carrot', 1, '2016-07-22 09:39:56'),
(67, 'MEDITATION', 1, '2016-07-22', 'Daily Yoga', 1, '2016-07-22 09:40:08'),
(68, 'OTHER', 1, '2016-07-23', 'Pashto', 2, '2016-07-23 16:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `goal_status`
--

CREATE TABLE `goal_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goal_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goal_status`
--

INSERT INTO `goal_status` (`id`, `user_id`, `goal_id`, `status`, `date`) VALUES
(10, 1, 9, 'done', '2016-07-07'),
(11, 1, 9, 'done', '2016-07-06'),
(12, 1, 9, 'done', '2016-07-05'),
(13, 1, 9, 'done', '2016-07-04'),
(14, 1, 9, 'done', '2016-07-03'),
(15, 1, 11, 'done', '2016-07-06'),
(16, 1, 11, 'done', '2016-07-05'),
(17, 1, 11, 'done', '2016-07-04'),
(18, 1, 11, 'done', '2016-07-07'),
(19, 2, 13, 'not_done', '2016-07-08'),
(20, 2, 13, 'done', '2016-07-09'),
(21, 2, 13, 'done', '2016-07-16'),
(22, 2, 13, 'not_done', '2016-07-14'),
(23, 2, 13, 'done', '2016-07-13'),
(24, 2, 13, 'not_done', '2016-07-15'),
(25, 2, 13, 'done', '2016-07-22'),
(26, 2, 13, 'done', '2016-07-20'),
(27, 1, 14, 'done', '2016-07-05'),
(28, 1, 14, 'done', '2016-07-06'),
(29, 1, 14, 'done', '2016-07-07'),
(30, 1, 14, 'done', '2016-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `facebook_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(60) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_id`, `name`, `email`, `date_of_birth`, `gender`, `created_at`) VALUES
(1, '1181013005251974', 'Deep Batra', '', '0000-00-00', 'male', '2016-07-08'),
(2, '1080244198687866', 'Vinod Bhambare', 'vinodbhambare2007@gmail.com', '0000-00-00', 'male', '2016-07-08'),
(3, '7757678788', 'Bchfb', 'N @gmail.com', '2015-09-09', 'Female', '2016-07-13'),
(4, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(5, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(6, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(7, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(8, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(9, 'eee', 'ruhi', 'ruhi', '2016-12-24', 'female', '2016-07-14'),
(10, '24', 'ruhi', '34@er43.com', '2016-12-24', 'female', '2016-07-14'),
(11, '24', 'ruhi', '34@er43.com', '2016-12-24', 'female', '2016-07-15'),
(12, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(13, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(14, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(15, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(16, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(17, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(18, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(19, '4r54365654', 'ruhi man', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-15'),
(20, '1181013005251974', 'jhjh', 'abc@gmail.com', '2016-12-24', 'male', '2016-07-15'),
(21, '1181013005251974', 'jhjh', '', '2016-12-24', 'male', '2016-07-15'),
(22, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(23, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(24, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(25, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(26, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(27, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-15'),
(28, '1080244198687866', 'Vinod Bhambare', 'vinodbhambare2007@gmail.com', '2016-12-24', 'male', '2016-07-16'),
(29, '4r54365654', 'ruhi', 'ruhi@zonopact.com', '2016-12-24', 'female', '2016-07-18'),
(30, '10154342811066241', 'Chris Shen', 'chris.ye.shen@gmail.com', '2016-12-24', 'male', '2016-07-18'),
(31, '10154342811066241', 'Chris Shen', 'chris.ye.shen@gmail.com', '2016-12-24', 'male', '2016-07-18'),
(32, '10154342811066241', 'Chris Shen', 'chris.ye.shen@gmail.com', '2016-12-24', 'male', '2016-07-18'),
(33, '1181013005251974', 'Deep Batra', '', '2016-12-24', 'male', '2016-07-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_status`
--
ALTER TABLE `goal_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `goal_status`
--
ALTER TABLE `goal_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
