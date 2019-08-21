-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2019 at 12:42 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicyear`
--

CREATE TABLE `academicyear` (
  `Academic_ID` bigint(20) NOT NULL,
  `AcademicYearName` text NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Acad_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academicyear`
--

INSERT INTO `academicyear` (`Academic_ID`, `AcademicYearName`, `StartDate`, `EndDate`, `Acad_Timestamp`) VALUES
(1, '2018/2019', '2018-10-22', '2019-07-26', '2019-06-20 06:50:21'),
(2, '2019/2020', '2019-09-16', '2020-07-17', '2019-06-20 06:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `attendancelist`
--

CREATE TABLE `attendancelist` (
  `Att_ID` bigint(20) NOT NULL,
  `StudentId` bigint(20) NOT NULL,
  `WorkloadId` bigint(20) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Att_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendancelist`
--

INSERT INTO `attendancelist` (`Att_ID`, `StudentId`, `WorkloadId`, `Status`, `Att_Timestamp`) VALUES
(7, 5, 11, 1, '2019-08-14 10:19:16'),
(8, 5, 12, 1, '2019-08-14 13:03:50'),
(9, 5, 12, 1, '2019-08-14 13:07:05'),
(10, 5, 12, 1, '2019-08-14 15:44:27'),
(11, 5, 12, 1, '2019-08-14 16:13:52'),
(12, 5, 11, 1, '2019-08-14 16:30:51'),
(28, 6, 12, 0, '2019-08-15 02:20:42'),
(29, 6, 12, 1, '2019-08-15 02:23:13'),
(30, 6, 12, 1, '2019-08-15 02:24:07'),
(31, 6, 12, 0, '2019-08-15 02:33:24'),
(35, 6, 12, 0, '2019-08-15 02:36:18'),
(39, 6, 12, 0, '2019-08-15 02:37:20'),
(41, 6, 12, 0, '2019-08-15 02:37:54'),
(42, 6, 12, 0, '2019-08-15 02:39:07'),
(44, 6, 11, 0, '2019-08-15 10:12:33'),
(45, 6, 11, 1, '2019-08-15 10:14:06'),
(46, 5, 11, 1, '2019-08-15 10:15:01'),
(47, 6, 11, 1, '2019-08-15 13:42:30'),
(48, 6, 11, 1, '2019-08-15 13:42:55'),
(49, 6, 11, 1, '2019-08-15 13:43:09'),
(50, 5, 12, 1, '2019-08-15 23:10:16'),
(51, 6, 12, 1, '2019-08-16 08:45:39'),
(52, 6, 12, 1, '2019-08-16 08:45:59'),
(53, 6, 12, 1, '2019-08-16 08:46:14'),
(62, 5, 11, 1, '2019-08-17 20:21:11'),
(63, 6, 11, 0, '2019-08-17 20:23:23'),
(64, 6, 12, 1, '2019-08-17 20:25:39'),
(65, 6, 11, 1, '2019-08-17 20:27:35'),
(66, 5, 11, 0, '2019-08-17 20:29:01'),
(67, 5, 12, 0, '2019-08-17 20:42:52'),
(68, 6, 12, 1, '2019-08-17 20:42:52'),
(69, 5, 12, 0, '2019-08-17 20:50:25'),
(70, 6, 12, 1, '2019-08-17 20:50:25'),
(72, 5, 12, 0, '2019-08-17 20:51:22'),
(73, 6, 12, 1, '2019-08-17 20:51:23'),
(75, 5, 12, 0, '2019-08-17 20:52:01'),
(76, 6, 12, 1, '2019-08-17 20:52:02'),
(78, 5, 12, 0, '2019-08-17 20:52:53'),
(79, 6, 12, 1, '2019-08-17 20:52:53'),
(80, 5, 11, 0, '2019-08-20 05:52:21'),
(81, 6, 12, 0, '2019-08-20 05:54:41'),
(82, 6, 12, 1, '2019-08-20 05:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Crs_ID` bigint(20) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `CourseCode` varchar(10) NOT NULL,
  `OptionId` bigint(20) NOT NULL,
  `LectureId` bigint(20) NOT NULL,
  `AcademicYearId` bigint(20) NOT NULL,
  `Level` varchar(40) NOT NULL,
  `Semester` int(3) NOT NULL,
  `Credits` int(3) NOT NULL,
  `Crs_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Crs_ID`, `CourseName`, `CourseCode`, `OptionId`, `LectureId`, `AcademicYearId`, `Level`, `Semester`, `Credits`, `Crs_Timestamp`) VALUES
(1, 'Database system', 'ICT120', 2, 2, 2, 'I', 2, 10, '2019-06-20 08:50:31'),
(2, 'Electrotec', 'ELC202', 7, 2, 2, 'II', 2, 15, '2019-06-25 09:02:26'),
(3, 'Object Oriented Programming', 'ICT110', 1, 2, 2, 'I', 1, 10, '2019-06-25 09:04:36'),
(4, 'Artificial Intelligence', 'ICT101', 1, 2, 2, 'III', 2, 12, '2019-06-25 09:06:53'),
(5, 'Kinyarwanda', 'Kiny', 5, 4, 1, '1', 2, 10, '2019-08-13 15:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `DayId` int(11) NOT NULL,
  `DayName` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`DayId`, `DayName`) VALUES
(1, 'Mon'),
(2, 'Tue');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dpt_ID` bigint(20) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Dpt_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dpt_ID`, `DepartmentName`, `Code`, `Dpt_Timestamp`) VALUES
(1, 'Information Communication Technology', 'ICT', '2019-06-18 18:15:29'),
(2, 'Accounting', 'ACT', '2019-06-24 11:15:45'),
(3, 'Electonic Electrical Engineering', 'EEE', '2019-06-25 08:43:30'),
(4, 'Mechanical Engineering', 'ME', '2019-06-25 08:43:30'),
(5, 'Civil Engineering', 'CE', '2019-06-28 08:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `HourId` int(11) NOT NULL,
  `HourName` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`HourId`, `HourName`) VALUES
(1, '8H'),
(2, '9H');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `Lect_ID` bigint(20) NOT NULL,
  `FrstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `UserName` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Lect_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`Lect_ID`, `FrstName`, `LastName`, `Phone`, `Email`, `UserName`, `Password`, `Status`, `Lect_Timestamp`) VALUES
(1, 'Habumugisha', 'Fulgence', 788998789, 'hful@iprckigali.ac.rw', 'Fulgence', '425105d4ca4abae68d3fef83989d19563ec50079', 0, '2019-06-20 08:46:30'),
(2, 'NDIKUMANA', 'Alexis', 789786755, 'ndikual@gmail.com', 'Alexis', 'b8f37731ef79d342523ce629b4ec6c829e990151', 1, '2019-06-24 10:18:39'),
(3, 'UMUTONI', 'Angel', 788990099, 'ange@gmail.com', 'Angel', '077a217ce3a53c1c1d7403d1c08bdf7c26c0ad95', 0, '2019-06-28 08:36:01'),
(4, 'Twiringiyimana', 'Aimable', 2147483647, 'aimabletwiri@gmail.com', 'Aimable', '7e5bb4fb88d838d4ef80b834ad427e5df1c7c72b', 0, '2019-07-13 10:48:13'),
(5, 'Mukamana', 'Agnes', 789775642, 'agnesmuka@gmail.com', 'Agnes', '3221f7f3f5b9d4c289d5baaf7824755faab85394', 0, '2019-07-14 07:50:45'),
(6, 'Muhire', 'Patrick', 2147483647, 'patrickmuhire@gmail.com', 'Patrick', '856105a7c7eadcc1962a5624ced14a7fa915359b', 0, '2019-07-17 21:22:08'),
(7, 'aima', 'aima', 788908989, 'aima@gmail.com', 'aima', 'pass', 0, '2019-08-12 18:03:31'),
(8, 'Uwera', 'Rosine', 788096756, 'rosine@gmail.com', 'Rosine', 'rosine', 0, '2019-08-19 18:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `minutes`
--

CREATE TABLE `minutes` (
  `MinId` int(11) NOT NULL,
  `MinName` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minutes`
--

INSERT INTO `minutes` (`MinId`, `MinName`) VALUES
(1, '30'),
(2, '45'),
(3, '00'),
(4, '15');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `MonthId` int(11) NOT NULL,
  `MonthsName` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`MonthId`, `MonthsName`) VALUES
(1, 'Jan'),
(2, 'Feb');

-- --------------------------------------------------------

--
-- Table structure for table `optioms`
--

CREATE TABLE `optioms` (
  `Opt_ID` bigint(20) NOT NULL,
  `OptionName` varchar(100) NOT NULL,
  `Option_Code` varchar(10) NOT NULL,
  `DepartmentID` bigint(20) NOT NULL,
  `Option_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `optioms`
--

INSERT INTO `optioms` (`Opt_ID`, `OptionName`, `Option_Code`, `DepartmentID`, `Option_Timestamp`) VALUES
(1, 'Inormation Technology', 'IT', 1, '2019-06-20 06:53:01'),
(2, 'Technology A', 'BIT B', 1, '2019-06-20 06:54:45'),
(3, 'Information Technology', 'IT', 1, '2019-06-20 06:54:45'),
(4, 'Air Conditioning', 'AC', 4, '2019-06-28 08:40:29'),
(5, 'Marketing', 'MA', 2, '2019-06-28 08:40:30'),
(6, 'Digital Media Production', 'DMP', 1, '2019-06-28 08:53:33'),
(7, 'Electricity', 'ELC', 3, '2019-06-28 09:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Std_ID` bigint(20) NOT NULL,
  `Std_Card` varchar(50) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RegistrationNumber` varchar(15) NOT NULL,
  `OptionId` bigint(20) NOT NULL,
  `AcademicYearId` bigint(20) NOT NULL,
  `Std_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Std_ID`, `Std_Card`, `FirstName`, `LastName`, `Password`, `RegistrationNumber`, `OptionId`, `AcademicYearId`, `Std_Timestamp`) VALUES
(5, '0708896313', 'Mwiza', 'elsy', 'adcd5a96df3c31ac47aa81a547cfda260900efdc', 'UOK/2019/0001', 5, 2, '2019-08-14 09:59:54'),
(6, '3843022023', 'UMUTONI', 'lea', '2ca69856cd7e964d95faa0078df56409d5cacf5e', 'UOK/2018/0195', 5, 2, '2019-08-14 13:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `workload`
--

CREATE TABLE `workload` (
  `Workload_ID` bigint(20) NOT NULL,
  `CourseId` bigint(20) NOT NULL,
  `LectureID` bigint(20) NOT NULL,
  `OptionID` bigint(20) NOT NULL,
  `AcademicYearID` bigint(20) NOT NULL,
  `Days` varchar(20) NOT NULL,
  `Start` date NOT NULL,
  `End` date NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workload`
--

INSERT INTO `workload` (`Workload_ID`, `CourseId`, `LectureID`, `OptionID`, `AcademicYearID`, `Days`, `Start`, `End`, `Timestamp`) VALUES
(11, 4, 4, 5, 2, '2', '2019-08-15', '2019-08-21', '2019-08-14 10:10:00'),
(12, 3, 3, 5, 2, '2', '2019-08-22', '2019-08-29', '2019-08-14 13:03:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academicyear`
--
ALTER TABLE `academicyear`
  ADD PRIMARY KEY (`Academic_ID`);

--
-- Indexes for table `attendancelist`
--
ALTER TABLE `attendancelist`
  ADD PRIMARY KEY (`Att_ID`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `WorkloadId` (`WorkloadId`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Crs_ID`),
  ADD KEY `OptionId` (`OptionId`),
  ADD KEY `LectureId` (`LectureId`),
  ADD KEY `AcademicYearId` (`AcademicYearId`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`DayId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dpt_ID`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`HourId`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`Lect_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `minutes`
--
ALTER TABLE `minutes`
  ADD PRIMARY KEY (`MinId`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`MonthId`);

--
-- Indexes for table `optioms`
--
ALTER TABLE `optioms`
  ADD PRIMARY KEY (`Opt_ID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Std_ID`),
  ADD UNIQUE KEY `RegistrationNumber` (`RegistrationNumber`),
  ADD KEY `OptionId` (`OptionId`),
  ADD KEY `AcademicYearId` (`AcademicYearId`);

--
-- Indexes for table `workload`
--
ALTER TABLE `workload`
  ADD PRIMARY KEY (`Workload_ID`),
  ADD KEY `OptionID` (`OptionID`),
  ADD KEY `AcademicYearID` (`AcademicYearID`),
  ADD KEY `LectureID` (`LectureID`),
  ADD KEY `CourseId` (`CourseId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academicyear`
--
ALTER TABLE `academicyear`
  MODIFY `Academic_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendancelist`
--
ALTER TABLE `attendancelist`
  MODIFY `Att_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `Crs_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `DayId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Dpt_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `HourId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `Lect_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `minutes`
--
ALTER TABLE `minutes`
  MODIFY `MinId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `MonthId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `optioms`
--
ALTER TABLE `optioms`
  MODIFY `Opt_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Std_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workload`
--
ALTER TABLE `workload`
  MODIFY `Workload_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendancelist`
--
ALTER TABLE `attendancelist`
  ADD CONSTRAINT `AttendanceLIst_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Std_ID`),
  ADD CONSTRAINT `AttendanceLIst_ibfk_2` FOREIGN KEY (`WorkloadId`) REFERENCES `workload` (`Workload_ID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `Courses_ibfk_1` FOREIGN KEY (`AcademicYearId`) REFERENCES `academicyear` (`Academic_ID`),
  ADD CONSTRAINT `Courses_ibfk_2` FOREIGN KEY (`OptionId`) REFERENCES `optioms` (`Opt_ID`),
  ADD CONSTRAINT `Courses_ibfk_3` FOREIGN KEY (`LectureId`) REFERENCES `lectures` (`Lect_ID`);

--
-- Constraints for table `optioms`
--
ALTER TABLE `optioms`
  ADD CONSTRAINT `Optioms_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`Dpt_ID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`OptionId`) REFERENCES `optioms` (`Opt_ID`),
  ADD CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`AcademicYearId`) REFERENCES `academicyear` (`Academic_ID`);

--
-- Constraints for table `workload`
--
ALTER TABLE `workload`
  ADD CONSTRAINT `Workload_ibfk_1` FOREIGN KEY (`LectureID`) REFERENCES `lectures` (`Lect_ID`),
  ADD CONSTRAINT `Workload_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`Crs_ID`),
  ADD CONSTRAINT `Workload_ibfk_3` FOREIGN KEY (`OptionID`) REFERENCES `optioms` (`Opt_ID`),
  ADD CONSTRAINT `Workload_ibfk_4` FOREIGN KEY (`AcademicYearID`) REFERENCES `academicyear` (`Academic_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
