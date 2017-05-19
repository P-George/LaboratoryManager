/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : LaboratoryManager

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 05/19/2017 15:56:28 PM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `COURSE`
-- ----------------------------
DROP TABLE IF EXISTS `COURSE`;
CREATE TABLE `COURSE` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `TEACHER` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `EDUCATION`
-- ----------------------------
DROP TABLE IF EXISTS `EDUCATION`;
CREATE TABLE `EDUCATION` (
  `SSN` int(11) NOT NULL,
  `STARTDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `ENDDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `SCHOOLNAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DEGREE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`STARTDATE`,`ENDDATE`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `STUDENT` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `FIELD`
-- ----------------------------
DROP TABLE IF EXISTS `FIELD`;
CREATE TABLE `FIELD` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `HOBBY`
-- ----------------------------
DROP TABLE IF EXISTS `HOBBY`;
CREATE TABLE `HOBBY` (
  `SSN` int(11) NOT NULL,
  `CONTENT` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`CONTENT`),
  CONSTRAINT `hobby_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `STUDENT` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `HOBBY`
-- ----------------------------
BEGIN;
INSERT INTO `HOBBY` VALUES ('1143220116', '??');
COMMIT;

-- ----------------------------
--  Table structure for `IMPRESSION`
-- ----------------------------
DROP TABLE IF EXISTS `IMPRESSION`;
CREATE TABLE `IMPRESSION` (
  `LABORATORYNO` int(11) NOT NULL,
  `CONTENT` text COLLATE utf8_bin NOT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`LABORATORYNO`,`SSN`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `impression_ibfk_1` FOREIGN KEY (`LABORATORYNO`) REFERENCES `LABORATORY` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `impression_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `STUDENT` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `JOB`
-- ----------------------------
DROP TABLE IF EXISTS `JOB`;
CREATE TABLE `JOB` (
  `SSN` int(11) NOT NULL,
  `DEPARTMENT` varchar(255) COLLATE utf8_bin NOT NULL,
  `APPOINTMENT` varchar(255) COLLATE utf8_bin NOT NULL,
  `STARTDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `ENDDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`STARTDATE`,`ENDDATE`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `STUDENT` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `LABORATORY`
-- ----------------------------
DROP TABLE IF EXISTS `LABORATORY`;
CREATE TABLE `LABORATORY` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `STARTDATE` datetime NOT NULL,
  `NUMBER` int(11) NOT NULL DEFAULT '0',
  `SUPERVISORSSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `LOCATION`
-- ----------------------------
DROP TABLE IF EXISTS `LOCATION`;
CREATE TABLE `LOCATION` (
  `NO` int(11) NOT NULL,
  `LABNO` int(11) NOT NULL,
  `PHONE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_P` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_C` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_A` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NO`),
  KEY `LABNO` (`LABNO`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`LABNO`) REFERENCES `LABORATORY` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `LOVE`
-- ----------------------------
DROP TABLE IF EXISTS `LOVE`;
CREATE TABLE `LOVE` (
  `SSN` int(11) NOT NULL,
  `FIELDNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`FIELDNO`),
  KEY `love_ibfk_1` (`FIELDNO`),
  CONSTRAINT `love_ibfk_1` FOREIGN KEY (`FIELDNO`) REFERENCES `FIELD` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `PROJECT`
-- ----------------------------
DROP TABLE IF EXISTS `PROJECT`;
CREATE TABLE `PROJECT` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `HOURS` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `RESEARCH`
-- ----------------------------
DROP TABLE IF EXISTS `RESEARCH`;
CREATE TABLE `RESEARCH` (
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `NO` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `HOURS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEGREE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `research_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `TEACHER` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `STUDENT`
-- ----------------------------
DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
  `SSN` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SALARY` decimal(10,0) DEFAULT '0',
  `EMAIL` varchar(255) COLLATE utf8_bin NOT NULL,
  `TUTORSSN` int(11) DEFAULT '0',
  `LABORATORYNO` int(11) DEFAULT '0',
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `TUTORSSN` (`TUTORSSN`),
  KEY `TUTORSSN_2` (`TUTORSSN`),
  KEY `TUTORSSN_3` (`TUTORSSN`),
  KEY `TUTORSSN_4` (`TUTORSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `STUDENT`
-- ----------------------------
BEGIN;
INSERT INTO `STUDENT` VALUES ('11432211', 'Kuangs', '123', '133@qq.com', '1403102', '1002', '111222'), ('11432215', 'KMM', '0', '12252@qq.com', '0', '0', '123456'), ('1143220116', 'Meng', '100', 'kuangmeng@msn.com', '1403102', '1001', '123456');
COMMIT;

-- ----------------------------
--  Table structure for `STUDY`
-- ----------------------------
DROP TABLE IF EXISTS `STUDY`;
CREATE TABLE `STUDY` (
  `SSN` int(11) NOT NULL,
  `COURSENO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`COURSENO`),
  KEY `COURSENO` (`COURSENO`),
  CONSTRAINT `study_ibfk_1` FOREIGN KEY (`COURSENO`) REFERENCES `COURSE` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `study_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `STUDENT` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `TEACHER`
-- ----------------------------
DROP TABLE IF EXISTS `TEACHER`;
CREATE TABLE `TEACHER` (
  `SSN` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_bin NOT NULL,
  `LABORATORYNO` int(11) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `LABORATORYNO` (`LABORATORYNO`),
  KEY `LABORATORYNO_2` (`LABORATORYNO`),
  KEY `LABORATORYNO_3` (`LABORATORYNO`),
  KEY `LABORATORYNO_4` (`LABORATORYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `WORKS_FOR`
-- ----------------------------
DROP TABLE IF EXISTS `WORKS_FOR`;
CREATE TABLE `WORKS_FOR` (
  `SSN` int(11) NOT NULL,
  `RESEARCHNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`RESEARCHNO`),
  KEY `RESEARCHNO` (`RESEARCHNO`),
  KEY `RESEARCHNO_2` (`RESEARCHNO`),
  KEY `RESEARCHNO_3` (`RESEARCHNO`),
  KEY `RESEARCHNO_4` (`RESEARCHNO`),
  CONSTRAINT `works_for_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `TEACHER` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `WORKS_ON`
-- ----------------------------
DROP TABLE IF EXISTS `WORKS_ON`;
CREATE TABLE `WORKS_ON` (
  `SSN` int(11) NOT NULL,
  `PROJECTNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`PROJECTNO`),
  KEY `PROJECTNO` (`PROJECTNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`PROJECTNO`) REFERENCES `PROJECT` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
