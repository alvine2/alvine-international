-- phpMyAdmin SQL Dump
-- version 5.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `_sms`;
USE `_sms`;

-- ========================
-- ADMINS
-- ========================
CREATE TABLE `admins` (
  `s_no` int(20) NOT NULL,
  `id` varchar(30) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `image` varchar(40) NOT NULL DEFAULT 'user.png',
  `phone` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(700) NOT NULL
) ENGINE=InnoDB;

INSERT INTO `admins` VALUES
(1, 'A9876543210', 'Lehi', 'Kinyera', '12/11/2024', 'admin.png', '0778235910', 'male', 'Kampala');

-- ========================
-- STUDENTS
-- ========================
CREATE TABLE `students` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `father` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(50) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `image` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `request_date` varchar(30),
  `request_time` varchar(30),
  `request` varchar(20)
) ENGINE=InnoDB;

INSERT INTO `students` VALUES
(1,'S1001','Kinyera','Lehi','Kato James','Male','12c','A','2005-01-01','user.png','0778235910','Lehi@gmail.com','Kansanga','Kampala','256','Central','','',''),
(2,'S1002','Brian','Okello','Okello Peter','Male','12c','A','2005-02-02','user.png','0700000001','brian@gmail.com','Ntinda','Kampala','256','Central','','',''),
(3,'S1003','Sharon','Namara','Ssempala John','Female','12c','A','2005-03-03','user.png','0700000002','sharon@gmail.com','Naalya','Kampala','256','Central','','',''),
(4,'S1004','Ivan','Ssemanda','Ssemanda Paul','Male','12c','A','2005-04-04','user.png','0700000003','ivan@gmail.com','Mukono','Mukono','256','Central','','','');

-- ========================
-- TEACHERS
-- ========================
CREATE TABLE `teachers` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `father` varchar(150) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `image` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(512) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL
) ENGINE=InnoDB;

INSERT INTO `teachers` VALUES
(1,'T2001','Lehi','Kinyera','Kinyera Senior','ICT','Male','1990-01-01','user.png','0778235910','teacher@gmail.com','Kampala','Kampala','256','Central','12c','A');

-- ========================
-- SUBJECTS
-- ========================
CREATE TABLE `subjects` (
  `s_no` int(20) NOT NULL,
  `subject_id` varchar(40),
  `subject_name` varchar(100),
  `class` varchar(50)
) ENGINE=InnoDB;

INSERT INTO `subjects` VALUES
(1,'SUB1','ICT','12c'),
(2,'SUB2','Mathematics','12c'),
(3,'SUB3','English','12c');

-- ========================
-- MARKS
-- ========================
CREATE TABLE `marks` (
  `s_no` int(20) NOT NULL,
  `exam_id` varchar(40),
  `subject` varchar(255),
  `student_id` varchar(40),
  `marks` varchar(10)
) ENGINE=InnoDB;

INSERT INTO `marks` VALUES
(1,'EX1','ICT','S1001','90'),
(2,'EX1','Mathematics','S1001','85'),
(3,'EX1','English','S1001','88'),
(4,'EX1','ICT','S1002','75'),
(5,'EX1','Mathematics','S1003','80');

-- ========================
-- ATTENDANCE
-- ========================
CREATE TABLE `attendence` (
  `s_no` int(20) NOT NULL,
  `student_id` varchar(40),
  `attendence` varchar(10),
  `class` varchar(30),
  `section` varchar(5),
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB;

INSERT INTO `attendence` VALUES
(1,'S1001','1','12c','A',NOW()),
(2,'S1002','1','12c','A',NOW()),
(3,'S1003','0','12c','A',NOW());

-- ========================
-- FEEDBACK
-- ========================
CREATE TABLE `feedback` (
  `s_no` int(11) NOT NULL,
  `sender_id` varchar(20),
  `receiver_id` varchar(20),
  `msg` varchar(500),
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB;

INSERT INTO `feedback` VALUES
(1,'T2001','S1001','Excellent work Kinyera',NOW()),
(2,'T2001','S1002','Improve Mathematics',NOW());

-- ========================
-- USERS (LOGIN)
-- ========================
CREATE TABLE `users` (
  `s_no` int(15) NOT NULL,
  `id` varchar(40),
  `email` varchar(256),
  `password_hash` varchar(700),
  `role` varchar(20),
  `theme` varchar(20)
) ENGINE=InnoDB;

INSERT INTO `users` VALUES
(1,'A9876543210','admin@gmail.com','123','admin','light'),
(2,'T2001','teacher@gmail.com','123','teacher','light'),
(3,'S1001','Lehi@gmail.com','123','student','light');

-- ========================
-- INDEXES & AUTO INCREMENT
-- ========================
ALTER TABLE `admins` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `students` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `teachers` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `subjects` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `marks` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `attendence` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `feedback` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `users` MODIFY `s_no` int AUTO_INCREMENT PRIMARY KEY;

COMMIT;