-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2019 at 11:34 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sampleDb`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `exams` varchar(255) NOT NULL,
  `rating` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `description`, `exams`, `rating`) VALUES
(1, 'abc1', 'gate', 1),
(2, 'abc2', 'cat', 2),
(3, 'abc3', 'jee', 3),
(4, 'abc4', 'sat', 3),
(5, 'abc5', 'gate', 2),
(6, 'abc6', 'jee', 1),
(7, 'abc7', 'sat', 1),
(8, 'abc8', 'cat', 2),
(9, 'abc9', 'jee', 3),
(10, 'abc910', 'cat', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `exam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `exam`) VALUES
(1, 'Test1', 'test1@abc.com', 'gate'),
(2, 'Test2', 'test2@abc.com', 'cat'),
(3, 'Test3', 'test3@abc.com', 'gate'),
(4, 'Test4', 'test4@abc.com', 'sat'),
(5, 'Test5', 'test5@abc.com', 'jee'),
(6, 'Test6', 'test6@abc.com', 'cat'),
(8, 'Test7', 'test7@abc.com', 'cat'),
(17, 'Test17', 'test17@abc.com', 'cat');

-- --------------------------------------------------------

--
-- Table structure for table `user_question`
--

CREATE TABLE `user_question` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_question`
--

INSERT INTO `user_question` (`id`, `user_id`, `question_id`) VALUES
(1, 1, 10),
(2, 2, 9),
(3, 3, 8),
(4, 4, 7),
(5, 5, 1),
(6, 6, 2),
(7, 6, 3),
(8, 5, 4),
(9, 4, 5),
(10, 3, 6),
(11, 2, 6),
(12, 1, 7),
(13, 1, 8),
(14, 2, 5),
(15, 3, 5),
(16, 4, 4),
(17, 5, 3),
(18, 6, 7),
(19, 6, 1),
(20, 5, 5),
(21, 4, 2),
(22, 3, 9),
(23, 2, 7),
(24, 1, 6),
(25, 1, 9),
(26, 2, 3),
(27, 3, 2),
(28, 4, 1),
(29, 5, 8),
(30, 6, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_question`
--
ALTER TABLE `user_question`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user_question`
--
ALTER TABLE `user_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
