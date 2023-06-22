-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 05:23 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlinebusregistration`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `AdminID` int(11) NOT NULL,
  `LearnerID` int(11) DEFAULT NULL,
  `Initials` varchar(10) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Password7` varchar(50) DEFAULT NULL,
  `CellPhoneNumber` varchar(20) DEFAULT NULL,
  `ParentEmail` varchar(50) DEFAULT NULL,
  `GradeEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `LearnerID` (`LearnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `BusRouteID` int(11) NOT NULL,
  `LearnerID` int(11) DEFAULT NULL,
  `BusNumber` varchar(20) DEFAULT NULL,
  `PickupNumberMorning` varchar(20) DEFAULT NULL,
  `DropoffNumberAfternoon` varchar(20) DEFAULT NULL,
  `PickupNameMorning` varchar(50) DEFAULT NULL,
  `DropoffNameAfternoon` varchar(50) DEFAULT NULL,
  `PickupTimeMorning` time DEFAULT NULL,
  `DropoffTimeAfternoon` time DEFAULT NULL,
  `BusLimit` int(11) DEFAULT NULL,
  `ApplicationStatus` varchar(20) DEFAULT NULL,
  `WaitingListNumber` int(11) DEFAULT NULL,
  `WaitingListDate` date DEFAULT NULL,
  PRIMARY KEY (`BusRouteID`),
  KEY `LearnerID` (`LearnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE IF NOT EXISTS `learner` (
  `LearnerID` int(11) NOT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `LearnerName` varchar(50) DEFAULT NULL,
  `LearnerSurname` varchar(50) DEFAULT NULL,
  `LearnerCellPhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LearnerID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `ParentID` int(11) NOT NULL,
  `ParentName` varchar(50) DEFAULT NULL,
  `ParentSurname` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`LearnerID`) REFERENCES `learner` (`LearnerID`);

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`LearnerID`) REFERENCES `learner` (`LearnerID`);

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
