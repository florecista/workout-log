-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2020 at 12:15 AM
-- Server version: 5.6.49-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workout`
--

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE `component` (
  `id` int(11) NOT NULL,
  `movement_id` int(11) NOT NULL,
  `ref_component_type_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_component_type`
--

CREATE TABLE `ref_component_type` (
  `id` int(11) NOT NULL,
  `parent_id` int(11),
  `name` varchar(255) NOT NULL,
  `description` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workout`
--

CREATE TABLE `workout` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workout_id` (`workout_id`);

--
-- Indexes for table `movement`
--
ALTER TABLE `movement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_component_type`
--
ALTER TABLE `ref_component_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout`
--
ALTER TABLE `workout`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`id`);
COMMIT;

INSERT INTO ref_component_type (id, name) VALUES (1, 'Set Up');
INSERT INTO ref_component_type (id, name) VALUES (2, 'Standing');
INSERT INTO ref_component_type (id, name) VALUES (3, 'Top Position');
INSERT INTO ref_component_type (id, name) VALUES (4, 'Bottom Position');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (5, 1, 'Punch');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (6, 1, 'Push');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (7, 1, 'Pull');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (8, 1, 'Press');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (9, 1, 'Pass');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (10, 1, 'Post');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (11, 1, 'Pump Fake');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (12, 1, 'Wrist Peel');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (13, 1, 'Wrist Control');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (14, 1, 'Snap Down Single Post');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (15, 1, 'Snap Down Double Post');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (16, 1, 'Change Level under Single Post');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (17, 1, 'Change Level under Double Post');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (18, 1, 'Collar Tie');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (19, 1, 'Inside Tie');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (20, 1, 'Elbow Pass');
INSERT INTO ref_component_type (id, parent_id, name) VALUES (21, 1, 'Slide By');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
